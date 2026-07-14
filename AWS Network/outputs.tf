# ==========================================
# Main VPC Outputs
# ==========================================

output "vpc_id" {
  description = "Main VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "Public Subnet ID"
  value       = aws_subnet.public_a.id
}

output "private_subnet_a_id" {
  description = "Private Subnet A ID"
  value       = aws_subnet.private_a.id
}

# ==========================================
# EC2 Outputs
# ==========================================

output "bastion_instance_id" {
  description = "Bastion Host Instance ID"
  value       = aws_instance.bastion.id
}

output "bastion_public_ip" {
  description = "Bastion Host Public IP"
  value       = aws_instance.bastion.public_ip
}

output "bastion_private_ip" {
  description = "Bastion Host Private IP"
  value       = aws_instance.bastion.private_ip
}

output "private_ec2_instance_id" {
  description = "Private EC2 Instance ID"
  value       = aws_instance.private_ec2.id
}

output "private_ec2_private_ip" {
  description = "Private EC2 Private IP"
  value       = aws_instance.private_ec2.private_ip
}

# ==========================================
# Customer Gateway Outputs (VPC3)
# ==========================================

output "customer_gateway_instance_id" {
  description = "Customer Gateway EC2 Instance ID"
  value       = aws_instance.customer_gateway.id
}

output "customer_gateway_public_ip" {
  description = "Customer Gateway Public IP"
  value       = aws_instance.customer_gateway.public_ip
}

output "customer_gateway_private_ip" {
  description = "Customer Gateway Private IP"
  value       = aws_instance.customer_gateway.private_ip
}

# ==========================================
# VPC3 Outputs
# ==========================================

output "vpc3_id" {
  description = "VPC3 ID"
  value       = aws_vpc.vpc3.id
}

output "vpc3_public_subnet_id" {
  description = "VPC3 Public Subnet ID"
  value       = aws_subnet.vpc3_public.id
}

output "vpc3_private_subnet_id" {
  description = "VPC3 Private Subnet ID"
  value       = aws_subnet.vpc3_private.id
}