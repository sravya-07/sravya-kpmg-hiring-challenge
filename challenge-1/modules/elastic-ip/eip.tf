resource "aws_eip" "eip" { # module for creating an elatic ip address in AWS
  vpc = var.vpc
  tags = var.tags
}