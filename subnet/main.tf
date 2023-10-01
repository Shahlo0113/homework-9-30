# Configure the AWS provider for the Subnet directory
provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

# Configure the Terraform backend to use the workspace created in Task 7
terraform {
  backend "remote" {
    organization = "summercloud"
    workspaces {
      name = "infra-subnet" # Replace with your workspace name
    }
  }
}