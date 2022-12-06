# output - various parameters of the IGW that may be used
output "arn" {
  value = aws_internet_gateway.igw.arn
}

output "id" {
  value = aws_internet_gateway.igw.id
}

output "tags" {
  value = aws_internet_gateway.igw.tags
}
