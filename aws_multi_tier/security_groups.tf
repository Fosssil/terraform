resource "aws_security_group" "wp-sg" {
  name        = "wordpress_sg"
  description = "Allow inbound traffic only for HTTP and outbound traffic for all"
  vpc_id      = aws_vpc.sagar_vpc.id
  tags = {
    Name = "Wordpress Security Group"
  }
}

## Outbound rule
resource "aws_vpc_security_group_egress_rule" "WP_allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.wp-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivallent to all ports
}

## Inbound rule
resource "aws_vpc_security_group_ingress_rule" "WP_allow_http_ipv4_for_all" {
  security_group_id = aws_security_group.wp-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = "80"
}

## Allow ssh`
resource "aws_vpc_security_group_ingress_rule" "WP_allow_ssh_for_all" {
  security_group_id = aws_security_group.wp-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = "22"
}
