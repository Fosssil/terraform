resource "aws_db_subnet_group" "wp_subnet_group" {
  name = "wp_rds_subnet_group"
  subnet_ids = [aws_subnet.lw_private_subnet_1a.id,
  aws_subnet.lw_private_subnet_1b.id]
  tags = {
    Name = "RDS subnet group"
  }
}
