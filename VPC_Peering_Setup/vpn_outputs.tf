output "customer_gateway_id" {

  value = aws_customer_gateway.customer_gateway.id
}

output "vpn_gateway_id" {

  value = aws_vpn_gateway.vpn_gateway.id
}

output "vpn_connection_id" {

  value = aws_vpn_connection.site_to_site.id
}