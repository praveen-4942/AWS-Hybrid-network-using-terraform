#########################################################
# Static VPN Route
#########################################################

resource "aws_vpn_connection_route" "onprem" {

  vpn_connection_id = aws_vpn_connection.site_to_site.id

  destination_cidr_block = "192.168.100.0/24"
}

#########################################################
# Route VPC1 -> OnPrem
#########################################################

resource "aws_route" "private_to_onprem" {

  route_table_id = aws_route_table.private.id

  destination_cidr_block = "192.168.100.0/24"

  gateway_id = aws_vpn_gateway.vpn_gateway.id
}