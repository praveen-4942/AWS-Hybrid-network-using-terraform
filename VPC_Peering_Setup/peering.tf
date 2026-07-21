resource "aws_vpc_peering_connection" "peer" {

  vpc_id      = aws_vpc.main.id
  peer_vpc_id = aws_vpc.vpc2.id

  auto_accept = true

  tags = merge(local.common_tags, {
    Name = "vpc1-vpc2-peer"
  })
}

# Route from VPC1 -> VPC2

resource "aws_route" "vpc1_to_vpc2" {

  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "10.20.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "vpc1_private_to_vpc2" {

  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = "10.20.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

# Route from VPC2 -> VPC1

resource "aws_route" "vpc2_to_vpc1" {

  route_table_id            = aws_route_table.vpc2_public.id
  destination_cidr_block    = "10.10.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}