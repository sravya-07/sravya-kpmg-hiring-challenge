resource "aws_route_table" "route-table" { # module to create a route table in AWS
  vpc_id = var.vpc_id
  tags   = var.tags
}
