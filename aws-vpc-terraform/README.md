# WHAT DOES THIS PROJECT DO?

This Terraform project creates a base network in AWS for a `dev` environment in the `sa-east-1` region.

The defined infrastructure does the following:

- Creates a VPC with the CIDR block `10.0.0.0/16`.
- Creates 4 subnets within that VPC:
  - 2 public subnets: `10.0.1.0/24` and `10.0.2.0/24`.
  - 2 private subnets: `10.0.3.0/24` and `10.0.4.0/24`.
- Configures the public subnets to automatically assign a public IP when launching instances.
- Creates an Internet Gateway and attaches it to the VPC.
- Creates a public route table with internet access (`0.0.0.0/0`) through the Internet Gateway.
- Associates the public route table with the 2 public subnets.
- Creates a private route table and associates it with the 2 private subnets.
- Creates a basic Security Group within the VPC with the following rules:
  - Allows inbound SSH traffic on port `22` from any IP.
  - Allows inbound HTTP traffic on port `80` from any IP.
  - Allows all outbound traffic.

**Important:** The private subnets do not have a NAT Gateway or direct internet access, since the current configuration only creates a public route through the Internet Gateway.

# HOW TO RUN IT:

- `terraform init`
- `terraform fmt`
- `terraform validate`
- `terraform plan`
- `terraform apply`

# TO DESTROY THE INFRASTRUCTURE:

- `terraform destroy`
