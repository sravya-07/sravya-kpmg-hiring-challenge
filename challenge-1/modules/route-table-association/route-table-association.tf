resource "aws_route_table_association" "association" { # terraform module to associate route table with a subnet
  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id
}
