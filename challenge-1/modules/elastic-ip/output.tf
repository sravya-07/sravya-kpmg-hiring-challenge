# output - various parameters of the EIP
output "id" {
  value = aws_eip.eip.id
}

output "ip" {
  value = aws_eip.eip.address
}

output "tags" {
  value = aws_eip.eip.tags
}
