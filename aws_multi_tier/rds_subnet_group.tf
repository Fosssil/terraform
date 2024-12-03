resource "aws_db_subnet_group" "wp_subnet_group" {
  name       = "wp_rds_subnet_group"
  subnet_ids = []
}
