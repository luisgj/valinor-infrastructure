output "vpc_id" {
  description = "The vpc id created"
  value = aws_vpc.vpc.id
}

output "public_security_group_id" {
  description = "the default security group id to attach to resources"
  value = aws_security_group.public-access.id
}

output "private_security_group_id" {
  description = "the default security group id to attach to resources"
  value = aws_security_group.private-access.id
}

output "public_subnet" {
  description = "the subnet range to attach to the instance"
  value = aws_subnet.public_subnet.id
}

output "database_subnet_a" {
  description = "the subnet range to attach to the database"
  value = aws_subnet.database_subnet_a.id
}

output "database_subnet_b" {
  description = "the subnet range to attach to the database"
  value = aws_subnet.database_subnet_b.id
}

output "private_subnet" {
  description = "the subnet range to attach to the database"
  value = aws_subnet.private_subnet.id
}