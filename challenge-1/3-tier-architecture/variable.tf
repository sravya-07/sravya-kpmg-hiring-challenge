variable "region" {
  default = "us-east-1"
}

variable "tags" {
  default = null
}

variable "vpc_name" { # the name of the VPC 
}

variable "vpc_cidr_block" { # th CIDR block of the VPC
}

variable "app_subnet_availability_zone" { # the availability zone of the app subnet
}

variable "app_subnet_cidr_block" { # the availability zone of the app subnet
}

variable "app_subnet_name" { # the name of the app subnet
}

variable "web_subnet_availability_zone" { # the availability zone of the web subnet
}

variable "web_subnet_cidr_block" { # the availability zone of the web subnet
}

variable "web_subnet_name" { # the name of the web subnet
}

variable "db_subnet_availability_zone" { # the availability zone of the db subnet
}

variable "db_subnet_cidr_block" { # the CIDR block of the db subnet
}

variable "db_subnet_name" { # the name of the db subnet
}

variable "public_subnet_availability_zone" { # the availability zone of the public subnet
}

variable "public_subnet_cidr_block" { # the CIDR of the public subnet
}

variable "public_subnet_name" { # the name of the public subnet
}

variable "igw_name" { # the name of the IGW
}

variable "public_route_table_name" { # the name of the public subnet route table
}

variable "eip_name" {  # the elastic_ip name
}

variable "nat_name" { # the name of the NAT
}

variable "app_route_table_name" { # the name of the route table for the app subnet
}

variable "db_route_table_name" { # the name of the route table for the db subnet
}

variable "web_route_table_name" { # the name of the route table for the web subnet
}

variable "tls_sg_name" { # the name of the SG used to give TLS access 
}

variable "sg_description" { # the description of the SG
}

variable "db_allocated_storage" { # the storage allocated to the DB
}

variable "db_name" { # the name of the DB
}

variable "db_engine" { # the engine of the DB
}

variable "db_engine_version" { # the version of the db engine to be used for the DB
}

variable "db_instance_class" { # the instance class of the DB instance
}

variable "db_username" { # the login username of the DB
}

variable "db_password" { # the login password of the DB
}

variable "db_parameter_group_name" { # the parameter group name of the DB
}

variable "db_skip_final_snapshot" { # values "True or False" indicate whether or not to skip the final snapshot while deleting the DB
}

variable "db_subnet_group_name" { # the name of the DB subnet group
}

variable "webserver_ami" { # the AMI ID to be used when creating the subnet
}

variable "webserver_instance_type" { # the instance type of the webserver
}

variable "webserver_name" { # the name of the webserver
}
