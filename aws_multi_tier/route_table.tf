resource "aws_route_table" "sagarRoutingTable" {
  vpc_id = aws_vpc.sagar_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sagarIGW.id
  }
  tags = {
    Name = "sagar Routing Table"
  }
}
