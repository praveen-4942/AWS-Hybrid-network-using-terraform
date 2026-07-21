# Second VPC
resource "aws_vpc" "vpc2" {
  cidr_block           = "10.20.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(local.common_tags, {
    Name = "training-vpc-2"
  })
}

# Public Subnet
resource "aws_subnet" "vpc2_public" {
  vpc_id                  = aws_vpc.vpc2.id
  cidr_block              = "10.20.1.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name = "vpc2-public"
  })
}

# Internet Gateway
resource "aws_internet_gateway" "vpc2_igw" {
  vpc_id = aws_vpc.vpc2.id

  tags = merge(local.common_tags, {
    Name = "vpc2-igw"
  })
}