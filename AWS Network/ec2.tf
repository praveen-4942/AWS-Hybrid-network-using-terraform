# Bastion Host
resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ubuntu_2204.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_a.id
  vpc_security_group_ids      = [aws_security_group.bastion.id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = merge(local.common_tags, {
    Name = "bastion-host"
  })
}

# Private EC2 Instance
resource "aws_instance" "private_ec2" {
  ami                         = data.aws_ami.ubuntu_2204.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private_a.id
  vpc_security_group_ids      = [aws_security_group.private_ec2.id]
  associate_public_ip_address = false
  key_name                    = var.key_name

  tags = merge(local.common_tags, {
    Name = "private-ec2"
  })
}