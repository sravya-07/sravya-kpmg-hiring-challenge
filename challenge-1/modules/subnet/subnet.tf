resource "aws_subnet" "subnet" { # module to create the subnet in the VPC
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
  cidr_block        = var.cidr_block
  tags              = var.tags
}
