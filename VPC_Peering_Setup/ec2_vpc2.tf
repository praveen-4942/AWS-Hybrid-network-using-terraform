resource "aws_instance" "vpc2_ec2" {

  ami           = data.aws_ami.ubuntu_2204.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.vpc2_public.id

  associate_public_ip_address = true

  key_name = var.key_name

  vpc_security_group_ids = [
    aws_security_group.vpc2_ec2.id
  ]

  tags = merge(local.common_tags, {
    Name = "vpc2-ec2"
  })
}