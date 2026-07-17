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




#############################################
# Transit Gateway Outputs
#############################################

output "transit_gateway_id" {
  description = "Transit Gateway ID"
  value       = aws_ec2_transit_gateway.tgw.id
}

output "vpc1_tgw_attachment_id" {
  description = "VPC1 Transit Gateway Attachment ID"
  value       = aws_ec2_transit_gateway_vpc_attachment.vpc1_attachment.id
}

output "vpc2_tgw_attachment_id" {
  description = "VPC2 Transit Gateway Attachment ID"
  value       = aws_ec2_transit_gateway_vpc_attachment.vpc2_attachment.id
}