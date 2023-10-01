terraform {
  cloud {
    organization = "summercloud"

    workspaces {
      name = "infra-workspaces"
    }
  }
}
provider "tfe" {
  hostname = "app.terraform.io"
  organization = "summercloud"
  token = "nHLARsh471dzbQ.atlasv1.ZaNpO1UbyayBnnLAzkrHs2D2tEh4nNCetEhwXIojZd4YzjGVpvQ0izKKRUjOKbgE460"
}
locals {
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
