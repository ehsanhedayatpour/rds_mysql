output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = try(aws_db_instance.my_rds_mysql.*.address, "")
}
