resource "aws_internet_gateway" "igw" { # the module for creating an IGW in AWS to communicate with with the internet gateway
  vpc_id = var.vpc_id
  tags = var.tags
}
