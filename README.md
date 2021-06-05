# healthcaretokens-infra

This is an [Infrastructure as Code (IaC)](https://en.wikipedia.org/wiki/Infrastructure_as_code) for [Healthcare Token project](https://github.com/kapraokaidao/healthcare). This aims to shorten the deployment process.

## Prerequisites

- Terraform CLI
- `AWS IAM User` with these criterias
  - type: `Programmatic access`
  - policy: `AmazonEC2FullAccess`
  - policy: `AmazonRDSFullAccess`

## Installation

**1. Install Terraform CLI**
For OS X:

```
brew install terraform
```

For other OS, please see [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)

**2. Configure IAM user's credential created in [prerequisites](#prerequisites)**  
add following lines to `~/.aws/credentials`:

```
[tfuser]
aws_access_key_id = {your-access-key-id}
aws_secret_access_key = {your-secret-access-key}
```

## Setup Terraform variables

First, rename `secret.tfvars.example` to `secret.tfvars`  
Then, replace the following variables in the file with yours.

```
db_username = "{your_database_username}"
db_password =  "{your_database_password}"
key_pair_path = "./path/to/key.pem"
```

<sub>\*Note: `key.pem` is the key pair associated with your EC2 instances</sub>

## Run Terraform

We defined infrastructure for development  
First, cd to `development` directory

```
cd development
```

<br>

### 1) Init Terraform configuration

```
terraform init
```

<br>

### 2) Validate configurations

```
terraform validate
```

<br>

### 3) See deployment plan (optional)

```
terraform plan -var-file="secret.tfvars"
```

<br>

### 4) Deploy

```
terraform apply -var-file="secret.tfvars"
```

\*When `terraform apply` is run, the `setup.sh` and `.env` will be upload to EC2 instances.  
Each instance will have its own `setup.sh` and `.env`

<hr>
<br>


### Complete env files

complete `.env` for each instances according to our project [README](https://github.com/kapraokaidao/healthcare#readme)  
**\*Note** the setup scripts can be ignore since this terraform IaC already prepare `setup.sh` for your instances

<br>

### Finishing up

Your services are ready, now you can start services for each instance.

Remember that `setup.sh` by default start service in attach mode. You may want to start service in detach mode preventing it from stopping when terminal is closed.
