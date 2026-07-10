# AWS Region
variable "aws_region" {
  description = "AWS Region to deploy resources"
  type        = string
  default     = "us-east-1"
}

# VPC
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

# Subnets
variable "public_subnet_cidr" {
  description = "CIDR block for Public Subnet"
  type        = string
  default     = "10.10.1.0/24"
}

variable "private_subnet_a_cidr" {
  description = "CIDR block for Private Subnet A"
  type        = string
  default     = "10.10.2.0/24"
}

variable "private_subnet_b_cidr" {
  description = "CIDR block for Private Subnet B"
  type        = string
  default     = "10.10.3.0/24"
}


# EC2
variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Existing EC2 Key Pair Name"
  type        = string
  default     = "praveen-tasks"
}

# Security
variable "allowed_ssh_cidr" {
  description = "Public IP allowed to SSH into Bastion Host"
  type        = string
  default     = "106.219.180.134/32"
}