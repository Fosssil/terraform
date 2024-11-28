resource "aws_internet_gateway" "sagarIGW" {
  vpc_id = aws_vpc.sagar_vpc.id
  tags = {
    Name = "Sagar IGW TF"
  }
}
