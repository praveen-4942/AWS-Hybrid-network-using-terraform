resource "aws_security_group" "customer_gateway" {

  name        = "customer-gateway-sg"
  description = "Customer Gateway Security Group"
  vpc_id      = aws_vpc.vpc2.id

  # SSH from your public IP only
  ingress {

    description = "SSH from my IP"

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [var.allowed_ssh_cidr]
  }

  # ICMP (Ping) from your public IP only
  ingress {

    description = "ICMP from my IP"

    from_port = -1
    to_port   = -1
    protocol  = "icmp"

    cidr_blocks = [var.allowed_ssh_cidr]
  }

  # Allow all outbound traffic
  egress {

    description = "Allow all outbound traffic"

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "customer-gateway-sg"
  })
}