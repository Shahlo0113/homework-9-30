terraform {
  cloud {
    organization = "summercloud"

    workspaces {
      name = "infra-workspaces"
    }
  }
}
provider "tfe" {
   version = "~> 0.48.0"
}
locals {
    exec_type = "local"
  infra-components = [
    "vpc",
    "subnet",
    "ec2"
  ]
}

resource "tfe_workspace" "example" {
  for_each = { for component in local.infra-components : component => component }

  name = each.value
  organization = "summercloud"
}
