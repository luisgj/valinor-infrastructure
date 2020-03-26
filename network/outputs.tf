output "vpc_id" {
  description = "The vpc id created"
  value = aws_vpc.vpc.id
}

output "security_group_id" {
  description = "the default security group id to attach to resources"
  value = aws_vpc.vpc.default_security_group_id
}

output "instance_subnet" {
  description = "the subnet range to attach to the instance"
  value = aws_subnet.instance_subnet.id
}

output "database_subnet" {
  description = "the subnet range to attach to the database"
  value = aws_subnet.database_subnet.id
}