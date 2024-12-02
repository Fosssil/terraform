resource "aws_security_group" "wp-sg" {
  name        = "wordpress_sg"
  description = "Allow inbound traffic only for HTTP and outbound traffic for all"
  vpc_id      = aws_vpc.sagar_vpc.id
  tags = {
    Name = "Wordpress Security Group"
  }
}
