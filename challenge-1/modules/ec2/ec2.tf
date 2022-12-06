resource "aws_instance" "instance" { # resource for createing the aws instance
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = var.security_groups
  subnet_id       = var.subnet_id

  tags = var.tags
}
