# VPC ID
output "vpc_id" {
  value = aws_vpc.main.id
}

# Bastion Public IP
output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

# Private EC2 Private IP
output "private_ec2_private_ip" {
  value = aws_instance.private_ec2.private_ip
}

# Public Subnet ID
output "public_subnet_id" {
  value = aws_subnet.public_a.id
}

# Private Subnet A ID
output "private_subnet_a_id" {
  value = aws_subnet.private_a.id
}

output "customer_gateway_public_ip" {

  value = aws_instance.customer_gateway.public_ip
}

output "customer_gateway_private_ip" {

  value = aws_instance.customer_gateway.private_ip
}

output "vpc3_id" {

  value = aws_vpc.vpc3.id
}

output "customer_gateway_public_ip" {

  value = aws_instance.customer_gateway.public_ip
}