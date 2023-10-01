# Configure the AWS provider for the EC2 directory
provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

# Configure the Terraform backend to use the workspace created in Task 7
terraform {
  backend "remote" {
    organization = "summercloud"
    workspaces {
      name = "infra-ec2" # Replace with your workspace name
    }
  }
}