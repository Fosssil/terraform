resource "aws_route_table_association" "RTAssoactionSubnet1a" {
  subnet_id      = aws_subnet.lw_public_subnet_1a.id
  route_table_id = aws_route_table.sagarRoutingTable.id
}
