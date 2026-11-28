# Terraform AWS Infrastructure (Lesson 5)

AWS infrastructure built using Terraform modules (S3 backend, VPC, and ECR).

## Project Structure

```text
.
├── main.tf                  # Module declarations
├── backend.tf               # Remote state configuration (S3 + DynamoDB)
├── outputs.tf               # Root outputs
├── README.md                # Project documentation
└── modules/
    ├── s3-backend/          # S3 bucket and DynamoDB table for state locking
    ├── vpc/                 # VPC, subnets, IGW, NAT Gateway, and route tables
    └── ecr/                 # ECR repository for Docker images
```

## Modules

- **`s3-backend`** — creates a versioned S3 bucket for `terraform.tfstate` and a DynamoDB table for state locking.
- **`vpc`** — deploys a VPC (`10.0.0.0/16`), 3 public and 3 private subnets, an Internet Gateway, a NAT Gateway, and route tables.
- **`ecr`** — creates a private ECR repository with image scanning on push (`scan_on_push = true`), an access policy, and outputs the repository URL.

## Usage

```bash
# Initialize providers, modules, and backend
terraform init

# Preview infrastructure changes
terraform plan

# Apply configuration
terraform apply

# Destroy all resources
terraform destroy
```