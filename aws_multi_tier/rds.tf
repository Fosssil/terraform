resource "aws_db_instance" "wprds" {
  allocated_storage      = 10
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "8.0.35"
  instance_class         = "db.t3.micro"
  username               = "admin"
  password               = var.RDS_PASSWORD
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  db_subnet_group_name   = "wp_rds_subnet_group"
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
}
