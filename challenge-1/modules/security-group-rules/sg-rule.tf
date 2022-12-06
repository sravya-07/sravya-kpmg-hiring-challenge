resource "aws_security_group_rule" "rule" { # module to create a rule in a SG in AWS
  type              = var.type
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  cidr_blocks       = var.cidr_blocks
  ipv6_cidr_blocks  = var.ipv6_cidr_blocks
  security_group_id = var.security_group_id
}