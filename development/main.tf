terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

resource "aws_instance" "backend" {
    ami = var.aws_amis[var.aws_region]
    instance_type = "t2.micro"
}