resource "aws_security_group" "sg" { # Module to create a security group
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id
  tags        = var.tags
}
