resource "aws_route_table_association" "RTAssoactionSubnet1a" {
  subnet_id      = aws_subnet.lw_public_subnet_1a.id
  route_table_id = aws_route_table.sagarRoutingTable.id
}

resource "aws_route_table_association" "RTAssoactionSubnet1b" {
  subnet_id      = aws_subnet.lw_public_subnet_1b.id
  route_table_id = aws_route_table.sagarRoutingTable.id
}

resource "aws_route_table_association" "RTAssoactionSubnet1c" {
  subnet_id      = aws_subnet.lw_public_subnet_1c.id
  route_table_id = aws_route_table.sagarRoutingTable.id
}
