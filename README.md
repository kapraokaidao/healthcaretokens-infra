# healthcaretokens-infra

## Requirements

- Terraform CLI
- AWS IAM credentials with EC2 full access, RDS full access

## Description

This is an infrastructure as a code for Healthcare Token project. This aims to shortend the deployment process.

## Installation

**1. Install Terraform CLI**
For OS X:

```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

For other OS, please see [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)

**2. Configure aws credential file**
Create or append `~/.aws/credentials` file with:

```
[tfuser]
aws_access_key_id = {your-access-key-id}
aws_secret_access_key = {your-secret access-key}
```

**3. Configure secret for db**
Rename `secret.tfvars.example` to `secret.tfvars` and replace the following variables in the file with yours.

```
db_username = "{your_database_username}"
db_password =  "{your_database_password}"
```

**3. Init Terraform**

```
terraform init
```

## Deploy

```
terraform apply -var-file="secret.tfvars"
```
