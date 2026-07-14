# Third VPC (On-Premises)

resource "aws_vpc" "vpc3" {

  cidr_block           = "172.16.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(local.common_tags, {
    Name = "training-vpc-3"
  })
}

resource "aws_subnet" "vpc3_public" {

  vpc_id                  = aws_vpc.vpc3.id
  cidr_block              = "172.16.1.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name = "vpc3-public"
  })
}

resource "aws_internet_gateway" "vpc3_igw" {

  vpc_id = aws_vpc.vpc3.id

  tags = merge(local.common_tags, {
    Name = "vpc3-igw"
  })
}

resource "aws_route_table" "vpc3_public" {

  vpc_id = aws_vpc.vpc3.id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.vpc3_igw.id
  }

  tags = merge(local.common_tags, {
    Name = "vpc3-public-rt"
  })
}

resource "aws_route_table_association" "vpc3_public" {

  subnet_id      = aws_subnet.vpc3_public.id
  route_table_id = aws_route_table.vpc3_public.id
}