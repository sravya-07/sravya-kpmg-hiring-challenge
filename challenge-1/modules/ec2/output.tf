# output for various paramaters of the instance
output "id" {
  value = aws_instance.instance.id
}

output "private_ip" {
  value = aws_instance.instance.private_ip
}

output "arn" {
  value = aws_instance.instance.arn
}

output "tags" {
  value = aws_instance.instance.tags_all
}
