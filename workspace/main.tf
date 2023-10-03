terraform {
  required_providers {
    tfe = {
      version = "~> 0.48.0"
    }
  }

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

data "tfe_organization" "summer-cloud" {
  name = "summercloud"
}

locals {
  exec_type = "local"
  infra-components = [
    "vpc",
    "subnet",
    "ec2",
  ]
}

resource "tfe_workspace" "test" {
  for_each       = toset(local.infra-components)
  name           = each.key
  organization   = data.tfe_organization.summer-cloud.name
  execution_mode = local.exec_type
}