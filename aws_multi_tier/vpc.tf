resource "aws_vpc" "sagar_vpc" {
  cidr_block           = var.AWS_VPC_CIDR
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Sagar-VPC-TF"
  }
}
