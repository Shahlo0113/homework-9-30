# Configure the AWS provider for the Subnet directory
provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

# Configure the Terraform backend to use the workspace created in Task 7
terraform {
     required_providers {
    tfe = {
      version = "~> 0.48.0"
    }
  }
   cloud {
    organization = "summercloud"

    workspaces {
      name = "infra-subnet"
    }
  }
}
variable "vpc_id" {
  default = "vpc-0e77c6485b3f0eacf"
}

data "aws_vpc" "main" {
  id = var.vpc_id
}

resource "aws_subnet" "main" {
  vpc_id     = data.aws_vpc.main.id
  cidr_block = cidrsubnet(data.aws_vpc.main.cidr_block, 4, 1)

  tags = {
    Name = "Main"
  }
}
