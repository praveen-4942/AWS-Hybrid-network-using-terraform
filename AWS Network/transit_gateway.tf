#############################################
# AWS Transit Gateway
#############################################

resource "aws_ec2_transit_gateway" "tgw" {

  description = "Training Transit Gateway"

  default_route_table_association = "enable"
  default_route_table_propagation = "enable"

  tags = merge(local.common_tags, {
    Name = "training-tgw"
  })
}

#############################################
# Attach VPC1
#############################################

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc1_attachment" {

  subnet_ids = [
    aws_subnet.public_a.id,
    aws_subnet.private_a.id
  ]

  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.main.id

  dns_support = "enable"

  tags = merge(local.common_tags, {
    Name = "vpc1-tgw-attachment"
  })
}

#############################################
# Attach VPC2
#############################################

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc2_attachment" {

  subnet_ids = [
    aws_subnet.vpc2_public.id
  ]

  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc2.id

  dns_support = "enable"

  tags = merge(local.common_tags, {
    Name = "vpc2-tgw-attachment"
  })
}