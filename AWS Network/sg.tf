# Bastion Security Group
resource "aws_security_group" "bastion" {
  name        = "bastion-sg"
  description = "Allow SSH from my public IP"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "bastion-sg"
  })
}

# Private EC2 Security Group
resource "aws_security_group" "private_ec2" {
  name        = "private-ec2-sg"
  description = "Allow SSH from Bastion and VPC2"
  vpc_id      = aws_vpc.main.id

  # SSH from Bastion Host
  ingress {
    description     = "SSH from Bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  # ICMP from VPC2
  ingress {
    description = "ICMP from VPC2"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.20.0.0/16"]
  }

  # SSH from VPC2
  ingress {
    description = "SSH from VPC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.20.0.0/16"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "private-ec2-sg"
  })
}