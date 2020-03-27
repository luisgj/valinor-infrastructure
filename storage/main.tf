resource "aws_db_subnet_group" "subnetgroup" {
  name_prefix = "valinor"
  description = "Database subnet group for valinordb"
  subnet_ids  = var.subnet_ids
  tags = {
    Owner  = "valinor"
    Env = "test"
  }
}

resource "aws_db_instance" "mysql_rds" {
  engine            = "mysql"
  engine_version    = "5.7.19"
  instance_class = "db.t2.small"
  allocated_storage = 5
  storage_encrypted = false
  name     = "valinordb"
  username = "valinor"
  password = "test-password"
  port     = "3306"
  vpc_security_group_ids = [var.security_group]
  db_subnet_group_name = aws_db_subnet_group.subnetgroup.name
  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"
  multi_az = true
  # disable backups to create DB faster
  backup_retention_period = 0
  tags = {
    Owner       = "valinor"
    Env = "test"
  }
  final_snapshot_identifier = "valinordb"
  deletion_protection = false
}