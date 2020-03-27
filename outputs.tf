output "bastion_ip_address" {
  value = module.instance.ip_address
}

output "bastion_dns" {
  value = module.instance.dns
}

output "private_ip_address" {
  value = module.instance.private_ip_address
}

output "rds_address" {
  description = "The address of the RDS instance"
  value       = module.db.rds_address
}

output "rds_db_name" {
  description = "The database name"
  value       = module.db.rds_db_name
}

output "rds_db_user" {
  description = "The database username"
  value       = module.db.rds_db_user
}

output "rds_db_pwd" {
  description = "The database name"
  value       = module.db.rds_db_pwd
}