output "rds_address" {
  description = "The address of the RDS instance"
  value = aws_db_instance.mysql_rds.address
}

output "rds_canonical" {
  description = "The address of the RDS instance"
  value = aws_db_instance.mysql_rds.hosted_zone_id
}

output "rds_db_name" {
  description = "The database name"
  value = aws_db_instance.mysql_rds.name
}


output "rds_db_user" {
  description = "The database username"
  value = aws_db_instance.mysql_rds.username
}

output "rds_db_pwd" {
  description = "The database name"
  value = aws_db_instance.mysql_rds.password
}