locals {
  tags = try(yamldecode(file("tags.yml")), var.tags)
}

# creating the VPC for the resources
module "vpc" {
  source     = "../modules/VPC"
  cidr_block = var.vpc_cidr_block
  tags       = merge({ Name = var.vpc_name }, local.tags)
}

# creating the app subnet
module "subnet_app" {
  source            = "../modules/subnet"
  vpc_id            = module.vpc.id
  availability_zone = var.app_subnet_availability_zone
  cidr_block        = var.app_subnet_cidr_block
  tags              = merge({ Name = var.app_subnet_name }, local.tags)
}

# creating the web subnet
module "subnet_web" {
  source            = "../modules/subnet"
  vpc_id            = module.vpc.id
  availability_zone = var.web_subnet_availability_zone
  cidr_block        = var.web_subnet_cidr_block
  tags              = merge({ Name = var.web_subnet_name }, local.tags)
}

# creating the db subnet
module "subnet_db" {
  source            = "../modules/subnet"
  vpc_id            = module.vpc.id
  availability_zone = var.db_subnet_availability_zone
  cidr_block        = var.db_subnet_cidr_block
  tags              = merge({ Name = var.db_subnet_name }, local.tags)
}

# creating the public subnet
module "subnet_public" {
  source            = "../modules/subnet"
  vpc_id            = module.vpc.id
  availability_zone = var.public_subnet_availability_zone
  cidr_block        = var.public_subnet_cidr_block
  tags              = merge({ Name = var.public_subnet_name }, local.tags)
}

# creating the IGW
module "igw" {
  source = "../modules/igw"
  vpc_id = module.vpc.id
  tags   = merge({ Name = var.igw_name }, local.tags)
}

# creating the public route table
module "route_table_public" {
  source = "../modules/route-tables"
  vpc_id = module.vpc.id
  tags   = merge({ Name = var.public_route_table_name }, local.tags)
}

# creating the route for the IGW
module "route_for_igw" {
  source                 = "../modules/route"
  route_table_id         = module.route_table_public.id
  destination_cidr_block = "0.0.0.0/0"
  conn_type              = "vpc_internet_gateway"
  conn_id                = module.igw.id
}

# creating the public route table association
module "route_table_association_public" {
  source         = "../modules/route-table-association"
  subnet_id      = module.subnet_public.id
  route_table_id = module.route_table_public.id
}

# creating the elastic_ip for the NAT
module "elastic_ip" {
  source = "../modules/elastic-ip"
  vpc    = module.vpc.id
  tags   = merge({ Name = var.eip_name }, local.tags)
}

# creating the NAT
module "nat" {
  source        = "../modules/nat"
  allocation_id = module.elastic_ip.id
  subnet_id     = module.subnet_public.id
  tags          = merge({ Name = var.nat_name }, local.tags)
}

# creating the route tables, routes and route table associations for the app, db and web subnets
module "route_table_app" {
  source = "../modules/route-tables"
  vpc_id = module.vpc.id
  tags   = merge({ Name = var.app_route_table_name }, local.tags)
}

module "route_for_app_subnet" {
  source                 = "../modules/route"
  route_table_id         = module.route_table_app.id
  destination_cidr_block = "0.0.0.0/0"
  conn_type              = "vpc_internet_gateway"
  conn_id                = module.nat.id
}

module "route_table_association_app" {
  source         = "../modules/route-table-association"
  subnet_id      = module.subnet_app.id
  route_table_id = module.route_table_app.id
}

module "route_table_db" {
  source = "../modules/route-tables"
  vpc_id = module.vpc.id
  tags   = merge({ Name = var.db_route_table_name }, local.tags)
}

module "route_for_db_subnet" {
  source                 = "../modules/route"
  route_table_id         = module.route_table_db.id
  destination_cidr_block = "0.0.0.0/0"
  conn_type              = "vpc_internet_gateway"
  conn_id                = module.nat.id
}

module "route_table_association_db" {
  source         = "../modules/route-table-association"
  subnet_id      = module.subnet_db.id
  route_table_id = module.route_table_db.id
}

module "route_table_web" {
  source = "../modules/route-tables"
  vpc_id = module.vpc.id
  tags   = merge({ Name = var.web_route_table_name }, local.tags)
}

module "route_for_web_subnet" {
  source                 = "../modules/route"
  route_table_id         = module.route_table_web.id
  destination_cidr_block = "0.0.0.0/0"
  conn_type              = "vpc_internet_gateway"
  conn_id                = module.igw.id
}

module "route_table_association_web" {
  source         = "../modules/route-table-association"
  subnet_id      = module.subnet_web.id
  route_table_id = module.route_table_web.id
}

# creating the security group for TLS access

module "tls_sg" {
  source      = "../modules/security-group"
  name        = var.tls_sg_name
  description = var.sg_description
  vpc_id      = module.vpc.id
  tags        = merge({ Name = var.tls_sg_name }, local.tags)
}

# loading the sg rules in the file creating the sg rules
locals {
  sg_rules = yamldecode(file("sg-rules.yml"))
}
module "sg_rules" {
  source            = "../modules/security-group-rules"
  count             = length(local.sg_rules)
  type              = local.sg_rules[count.index].type
  from_port         = local.sg_rules[count.index].from_port
  to_port           = local.sg_rules[count.index].to_port
  protocol          = local.sg_rules[count.index].protocol
  cidr_blocks       = local.sg_rules[count.index].cidr_blocks
  security_group_id = module.tls_sg.id
}

# creating the mysql_db
module "mysql_db" {
  source               = "../modules/database"
  allocated_storage    = var.db_allocated_storage
  db_name              = var.db_name
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = var.db_parameter_group_name
  skip_final_snapshot  = var.db_skip_final_snapshot
  db_subnet_group_name = var.db_subnet_group_name
  subnet_ids           = [module.subnet_db.id]
  tags                 = local.tags
}

# creating the webserver
module "webserver" {
  source          = "../modules/ec2"
  ami             = var.webserver_ami
  instance_type   = var.webserver_instance_type
  security_groups = [module.tls_sg.id]
  subnet_id       = module.subnet_web.id
  tags            = merge({ Name = var.webserver_name }, local.tags)
}

# creating the LB
resource "aws_lb" "alb" {
  name               = "webserver-lb"
  load_balancer_type = "application"
  security_groups    = [module.tls_sg.id]
  subnets            = [module.subnet_web.id]
  tags               = merge({ Name = "webserver-lb" }, local.tags)
}

# Creating load balancer target group

resource "aws_lb_target_group" "alb_tg_group" {
  name     = "webserver-tg"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = module.vpc.id
}

#Creating listeners
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "443"
  protocol          = "HTTPS"
  default_action {
    target_group_arn = aws_lb_target_group.alb_tg_group.arn
    type             = "forward"
  }
}

# Creating listener rules

resource "aws_lb_listener_rule" "allow_all" {
  listener_arn = aws_lb_listener.listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg_group.arn
  }

  condition {
   path_pattern {
    values = ["*"]
  }
  }
}
