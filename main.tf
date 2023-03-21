
provider "aws" {
    region = "us-east-1"
}

resource "aws_db_instance" "my_rds_mysql" {
  allocated_storage           = 10
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "5.7"
  instance_class              = "db.t2.micro"
  db_name                        = "myrdsmysql"
  username                    = "admin"
  password                    = "admin123"
  parameter_group_name        = "default.mysql5.7"
  vpc_security_group_ids      = [aws_security_group.rds_sg.id]
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  backup_retention_period     = 35
  backup_window               = "22:00-23:00"
  maintenance_window          = "Sat:00:00-Sat:03:00"
  multi_az                    = true
  skip_final_snapshot         = true
}
