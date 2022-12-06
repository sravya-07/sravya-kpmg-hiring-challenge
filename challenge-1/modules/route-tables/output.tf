# output - various parameters of the route table
output "id" {
  value = aws_route_table.route-table.id
}

output "arn" {
  value = aws_route_table.route-table.arn
}

output "tags" {
  value = aws_route_table.route-table.tags
}
