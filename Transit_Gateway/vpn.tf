#########################################################
# AWS Customer Gateway
#########################################################

resource "aws_customer_gateway" "customer_gateway" {

  bgp_asn = 65000

  ip_address = aws_instance.customer_gateway.public_ip

  type = "ipsec.1"

  tags = merge(local.common_tags, {
    Name = "training-customer-gateway"
  })
}

#########################################################
# Virtual Private Gateway
#########################################################

resource "aws_vpn_gateway" "vpn_gateway" {

  tags = merge(local.common_tags, {
    Name = "training-vgw"
  })
}

#########################################################
# Attach VPN Gateway to VPC1
#########################################################

resource "aws_vpn_gateway_attachment" "vpn_attachment" {

  vpc_id = aws_vpc.main.id

  vpn_gateway_id = aws_vpn_gateway.vpn_gateway.id
}

#########################################################
# Site-to-Site VPN
#########################################################

resource "aws_vpn_connection" "site_to_site" {

  vpn_gateway_id = aws_vpn_gateway.vpn_gateway.id

  customer_gateway_id = aws_customer_gateway.customer_gateway.id

  type = "ipsec.1"

  static_routes_only = false



  tags = merge(local.common_tags, {
    Name = "training-site-to-site-vpn"
  })
}