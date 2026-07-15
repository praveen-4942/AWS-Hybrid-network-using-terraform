resource "aws_security_group" "customer_gateway" {

  name        = "customer-gateway-sg"
  description = "Customer Gateway Security Group"
  vpc_id      = aws_vpc.vpc3.id

  # Tunnel 1 - IKE
ingress {
  description = "IKE - Tunnel 1"
  from_port   = 500
  to_port     = 500
  protocol    = "udp"
  cidr_blocks = ["3.223.34.3/32"]
}

# Tunnel 1 - NAT-T
ingress {
  description = "NAT-T - Tunnel 1"
  from_port   = 4500
  to_port     = 4500
  protocol    = "udp"
  cidr_blocks = ["3.223.34.3/32"]
}

# Tunnel 2 - IKE
ingress {
  description = "IKE - Tunnel 2"
  from_port   = 500
  to_port     = 500
  protocol    = "udp"
  cidr_blocks = ["44.215.185.135/32"]
}

# Tunnel 2 - NAT-T
ingress {
  description = "NAT-T - Tunnel 2"
  from_port   = 4500
  to_port     = 4500
  protocol    = "udp"
  cidr_blocks = ["44.215.185.135/32"]
}
  
  
  
  
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

