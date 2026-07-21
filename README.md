# AWS Hybrid Network using Terraform

## Overview

This project demonstrates the implementation of a hybrid AWS networking environment using Terraform. It provisions multiple networking components including VPCs, Site-to-Site VPN connectivity, VPC Peering, NAT Gateway, Internet Gateway, routing, security groups, and EC2 instances.

The infrastructure follows Infrastructure as Code (IaC) principles, making deployments repeatable, modular, and easy to manage.

---

## Architecture

The infrastructure includes:

* VPC 1 (Primary Application Network)
* VPC 2 (Shared Services Network)
* VPC Peering Connection
* Customer Gateway (StrongSwan VPN)
* AWS Site-to-Site VPN
* NAT Gateway
* Internet Gateway
* Public and Private Route Tables
* Security Groups
* Elastic IP
* EC2 Instances in both VPCs

```
                    Internet
                        │
                 Internet Gateway
                        │
        ┌─────────────────────────────────┐
        │             VPC 1               │
        │                                 │
        │  Public EC2                     │
        │      │                          │
        │  NAT Gateway                    │
        │      │                          │
        │  Private EC2                    │
        └──────────────┬──────────────────┘
                       │
                 VPC Peering
                       │
        ┌──────────────┴──────────────────┐
        │             VPC 2               │
        │                                 │
        │        Public EC2               │
        └─────────────────────────────────┘

                       │
                Site-to-Site VPN
                       │
              Customer Gateway
            (StrongSwan on Ubuntu)
```

---

## Features

* Infrastructure as Code using Terraform
* Multi-VPC architecture
* VPC Peering
* Site-to-Site VPN
* Customer Gateway using StrongSwan
* Internet Gateway
* NAT Gateway
* Elastic IP
* Route Tables
* Security Groups
* EC2 deployment
* Modular Terraform configuration

---

## Technologies Used

* Terraform
* AWS EC2
* AWS VPC
* AWS Internet Gateway
* AWS NAT Gateway
* AWS Elastic IP
* AWS Site-to-Site VPN
* AWS Customer Gateway
* AWS VPC Peering
* Ubuntu
* StrongSwan

---

## Project Structure

```
.
├── provider.tf
├── versions.tf
├── variables.tf
├── locals.tf
├── data.tf
│
├── vpc2.tf
├── igw.tf
├── nat_gateway.tf
├── elastic_ip.tf
├── route_tables.tf
├── vpc2_route_tables.tf
│
├── sg.tf
├── vpc2_sg.tf
├── customer_gateway_sg.tf
│
├── ec2.tf
├── ec2_vpc2.tf
├── customer_gateway.tf
├── customer_gateway_userdata.sh
├── peering.tf
├── outputs.tf
└── README.md
```

---

## Prerequisites

* Terraform 1.5+
* AWS Account
* AWS CLI configured
* SSH Key Pair
* IAM user with appropriate permissions

---

## Deployment

Clone the repository:

```bash
git clone https://github.com/<your-username>/aws-hybrid-network-terraform.git

cd aws-hybrid-network-terraform
```

Initialize Terraform:

```bash
terraform init
```

Review the execution plan:

```bash
terraform plan
```

Deploy the infrastructure:

```bash
terraform apply
```

Destroy the infrastructure when finished:

```bash
terraform destroy
```

---

## Components

| File                   | Purpose                         |
| ---------------------- | ------------------------------- |
| provider.tf            | AWS Provider configuration      |
| versions.tf            | Terraform version constraints   |
| variables.tf           | Input variables                 |
| locals.tf              | Local values                    |
| data.tf                | AWS data sources                |
| vpc2.tf                | Secondary VPC configuration     |
| igw.tf                 | Internet Gateway                |
| nat_gateway.tf         | NAT Gateway                     |
| elastic_ip.tf          | Elastic IP allocation           |
| route_tables.tf        | Route tables for VPC 1          |
| vpc2_route_tables.tf   | Route tables for VPC 2          |
| sg.tf                  | Security Groups                 |
| vpc2_sg.tf             | VPC 2 Security Groups           |
| customer_gateway_sg.tf | Customer Gateway Security Group |
| ec2.tf                 | EC2 resources in VPC 1          |
| ec2_vpc2.tf            | EC2 resources in VPC 2          |
| customer_gateway.tf    | Customer Gateway instance       |
| peering.tf             | VPC Peering configuration       |
| outputs.tf             | Terraform outputs               |

---

## Learning Outcomes

Through this project, I gained practical experience with:

* Terraform Infrastructure as Code
* AWS VPC networking
* Public and Private subnet design
* Internet and NAT Gateways
* Security Groups
* Route Tables
* VPC Peering
* Site-to-Site VPN architecture
* Customer Gateway deployment using StrongSwan
* Infrastructure automation
* AWS networking best practices

---

## Future Improvements

* Terraform Modules
* Remote Backend (S3 + DynamoDB)
* Transit Gateway
* Multi-Region Deployment
* Monitoring with CloudWatch
* CI/CD using GitHub Actions
* Automated Security Scanning

---

## Author

**Praveenkumar G**

DevSecOps Engineer

Feel free to fork this repository, raise issues, or contribute improvements.
