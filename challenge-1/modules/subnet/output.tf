# output - various parameters of the subnet
output "id" {
  value = aws_subnet.subnet.id
}

output "arn" {
  value = aws_subnet.subnet.arn
}

output "tags" {
  value = aws_subnet.subnet.tags
}