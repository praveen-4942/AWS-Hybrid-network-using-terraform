resource "aws_security_group" "vpc2_ec2" {

  name        = "vpc2-ec2-sg"
  description = "Allow SSH and ICMP"
  vpc_id      = aws_vpc.vpc2.id

  # SSH from your laptop
  ingress {
    description = "SSH from my IP"

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [var.allowed_ssh_cidr]
  }

  # SSH from VPC1
  ingress {
    description = "SSH from VPC1"

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["10.10.0.0/16"]
  }

  # ICMP from VPC1
  ingress {
    description = "ICMP from VPC1"

    from_port = -1
    to_port   = -1
    protocol  = "icmp"

    cidr_blocks = ["10.10.0.0/16"]
  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "vpc2-ec2-sg"
  })
}