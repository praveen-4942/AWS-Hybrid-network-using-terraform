# AWS Hybrid Network Infrastructure using Terraform

A production-style AWS Hybrid Networking project built using **Terraform** that demonstrates how to design, provision, and automate an enterprise-grade network infrastructure on AWS.

This project simulates a real-world hybrid cloud environment by integrating multiple AWS Virtual Private Clouds (VPCs) with an On-Premises network using a Site-to-Site VPN powered by **StrongSwan**. It also includes Transit Gateway, VPC Peering, NAT Gateway, Internet Gateway, Security Groups, Route Tables, and EC2 instances to showcase modern cloud networking concepts.

---

## Architecture

```
                                        Internet
                                            │
                                    Internet Gateway
                                            │
                              ┌─────────────────────────┐
                              │         VPC 1           │
                              │                         │
                              │  Public EC2            │
                              │      │                 │
                              │  NAT Gateway           │
                              │      │                 │
                              │  Private EC2           │
                              └──────────┬─────────────┘
                                         │
                                  Transit Gateway
                           ┌─────────────┼─────────────┐
                           │                           │
                     VPC Peering                  Site-to-Site VPN
                           │                           │
                    ┌──────┴──────┐           Customer Gateway
                    │    VPC 2    │        (Ubuntu + StrongSwan)
                    │ Shared VPC  │                 │
                    └─────────────┘          On-Premises Network
```

---

## Features

- Infrastructure as Code (Terraform)
- Multi-VPC Architecture
- Transit Gateway
- VPC Peering
- Site-to-Site VPN
- Customer Gateway using StrongSwan
- Internet Gateway
- NAT Gateway
- Public & Private Subnets
- Route Tables
- Security Groups
- Elastic IP
- EC2 Instances
- On-Premises Network Simulation
- Automated Infrastructure Deployment

---

## Technologies Used

| Category | Technologies |
|----------|--------------|
| IaC | Terraform |
| Cloud | AWS |
| Networking | VPC, Transit Gateway, VPC Peering, VPN |
| Compute | EC2 |
| Connectivity | Internet Gateway, NAT Gateway |
| Security | Security Groups |
| VPN | StrongSwan |
| Operating System | Ubuntu Server |

---

## Repository Structure

```
.
├── customer_gateway.tf
├── customer_gateway_sg.tf
├── customer_gateway_userdata.sh
├── data.tf
├── ec2.tf
├── ec2_vpc2.tf
├── elastic_ip.tf
├── igw.tf
├── locals.tf
├── nat_gateway.tf
├── outputs.tf
├── peering.tf
├── provider.tf
├── route_tables.tf
├── sg.tf
├── transit_gateway.tf
├── variables.tf
├── versions.tf
├── vpc2.tf
├── vpc2_route_tables.tf
├── vpc2_sg.tf
├── vpc3.tf
├── vpc_subnets.tf
├── vpn.tf
├── vpn_outputs.tf
├── vpn_routes.tf
├── On premises/
├── README.md
└── .gitignore
```

---

## Infrastructure Components

| Component | Description |
|-----------|-------------|
| VPC 1 | Primary application network |
| VPC 2 | Shared services network |
| VPC 3 | Additional network |
| Public Subnets | Internet-facing resources |
| Private Subnets | Internal application resources |
| Internet Gateway | Provides Internet connectivity |
| NAT Gateway | Enables outbound Internet access for private subnets |
| Transit Gateway | Centralized routing between VPCs |
| VPC Peering | Direct VPC-to-VPC communication |
| Customer Gateway | Ubuntu EC2 configured with StrongSwan |
| Site-to-Site VPN | Secure IPSec tunnel between AWS and On-Premises |
| Security Groups | Instance-level firewall rules |
| Route Tables | Traffic routing configuration |
| Elastic IP | Static public IP for VPN endpoint |
| EC2 Instances | Test workloads |

---

## Prerequisites

Before deploying this project, ensure you have:

- Terraform >= 1.5
- AWS CLI configured
- AWS Account
- IAM User with appropriate permissions
- SSH Key Pair
- Git

---

## Deployment

### Clone the repository

```bash
git clone https://github.com/<your-username>/aws-hybrid-network-terraform.git
cd aws-hybrid-network-terraform
```

### Initialize Terraform

```bash
terraform init
```

### Validate Configuration

```bash
terraform validate
```

### Review the Execution Plan

```bash
terraform plan
```

### Deploy Infrastructure

```bash
terraform apply
```

### Destroy Infrastructure

```bash
terraform destroy
```

---

## Learning Outcomes

Through this project, I gained hands-on experience with:

- Infrastructure as Code (IaC)
- Terraform Best Practices
- AWS Networking Fundamentals
- CIDR Planning
- VPC Design
- Public & Private Subnets
- Route Tables
- Internet Gateway
- NAT Gateway
- Transit Gateway
- VPC Peering
- Site-to-Site VPN
- StrongSwan VPN Configuration
- Customer Gateway Setup
- Security Groups
- Elastic IP Management
- EC2 Provisioning
- Hybrid Cloud Networking
- Enterprise Network Design
- Infrastructure Automation

---

## Skills Demonstrated

- AWS Networking
- Terraform
- Infrastructure Automation
- Cloud Architecture
- Hybrid Cloud
- VPN Configuration
- Routing
- Network Security
- Linux Administration
- DevSecOps Fundamentals

---

## Future Improvements

- Convert resources into reusable Terraform Modules
- Implement Remote Backend using S3 and DynamoDB
- Add High Availability VPN
- Configure Dynamic Routing using BGP
- Integrate CloudWatch Monitoring
- Add GitHub Actions CI/CD Pipeline
- Integrate Terratest
- Add tfsec and Checkov Security Scanning
- Multi-Region Deployment Support

---

## Screenshots

Add screenshots here after deployment.

Example:

```
screenshots/
├── architecture.png
├── terraform-apply.png
├── aws-console.png
├── vpn-status.png
└── route-tables.png
```

---

## Best Practices Followed

- Infrastructure as Code
- Modular Terraform Configuration
- Least Privilege Security Groups
- Network Segmentation
- Secure VPN Connectivity
- Automated Resource Provisioning
- Version Controlled Infrastructure

---

## Author

### Praveenkumar G

**DevSecOps Engineer**

GitHub: https://github.com/<your-username>

LinkedIn: https://linkedin.com/in/<your-profile>

---

## License

This project is licensed under the MIT License.

---

⭐ If you found this project useful, consider starring the repository.
