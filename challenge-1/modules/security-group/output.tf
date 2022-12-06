# output - various parameters of the SG
output "id" {
    value = aws_security_group.sg.id
}

output "arn" {
  value = aws_security_group.sg.arn
}
