# output - various parameters of the NAT
output "id" {
    value = aws_nat_gateway.nat.id
}

output "tags" {
  value = aws_nat_gateway.nat.tags
}

# output "ip" {
#   value = aws_nat_gateway.nat.private_ip
# }
