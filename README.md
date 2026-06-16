# terraform-iam

> AWS IAM infrastructure managed as code using Terraform — Users, Roles, Policies, and RBAC access control.

## Overview

This repository manages all AWS Identity and Access Management (IAM) resources through Terraform, providing a consistent, auditable, and version-controlled approach to cloud access control.

### What this repo covers

- **IAM Users** — individual or service account identities
- **IAM Roles** — assumable identities for services, cross-account access, and RBAC
- **IAM Policies** — fine-grained permission documents (inline & managed)
- **Permission Boundaries** — guardrails to limit maximum effective permissions
- **RBAC Role Assignments** — role-based access control patterns for teams and environments

## Directory Structure

```
terraform-iam/
├── environments/
│   ├── dev/
│   └── prod/
├── modules/
│   ├── iam-user/
│   ├── iam-role/
│   └── iam-policy/
├── provider.tf
├── backend.tf
├── variables.tf
├── outputs.tf
└── README.md
```

## Prerequisites

| Tool      | Version  |
|-----------|----------|
| Terraform | >= 1.5.0 |
| AWS CLI   | >= 2.x   |

## Getting Started

```bash
# 1. Clone the repo
git clone https://github.com/<your-org>/terraform-iam.git
cd terraform-iam

# 2. Configure AWS credentials
export AWS_PROFILE=your-profile

# 3. Initialize Terraform
terraform init

# 4. Preview changes
terraform plan

# 5. Apply
terraform apply
```

## Branch Strategy

| Branch | Purpose |
|--------|---------|
| `main` | Production-ready, protected |
| `dev`  | Active development and testing |

All changes to `main` must go through a Pull Request with at least one approval.

## State Management

Terraform state is stored remotely in an S3 bucket with DynamoDB locking to prevent concurrent modifications.

## Contributing

1. Branch off from `dev`
2. Make your changes with meaningful commit messages
3. Open a PR → `dev` → `main`
