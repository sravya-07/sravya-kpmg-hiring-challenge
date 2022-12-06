# output - various parameters of the vpc
output "id" {
  value = aws_vpc.vpc.id
}

output "arn" {
  value = aws_vpc.vpc.arn
}

output "tags" {
  value = aws_vpc.vpc.tags
}
