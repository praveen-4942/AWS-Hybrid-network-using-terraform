resource "aws_instance" "customer_gateway" {

  ami           = data.aws_ami.ubuntu_2204.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.vpc3_public.id

  associate_public_ip_address = true

  key_name = var.key_name

  vpc_security_group_ids = [
    aws_security_group.customer_gateway.id
  ]

  source_dest_check = false

  user_data = file("${path.module}/customer_gateway_userdata.sh")

  tags = merge(local.common_tags, {
    Name = "customer-gateway"
  })
}
