resource "aws_vpc" "vpc" { # the module to create a VPC in AWS
  cidr_block = var.cidr_block
  tags = var.tags
}