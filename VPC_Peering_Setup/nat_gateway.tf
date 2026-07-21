# NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_a.id

  depends_on = [
    aws_internet_gateway.igw
  ]

  tags = merge(local.common_tags, {
    Name = "training-nat-gateway"
  })
}