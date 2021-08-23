terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
  }
}

data "azurerm_client_config" "current" {}

# Modules
module "rsg" {
  source  = "app.terraform.io/georgevazj-lab/rsg/azure"
  version = "0.0.3"

  resource_group_name = var.resource_group_name
  resource_group_location = var.location
  description = "Resource group from Terraform Cloud"
}

module "akv" {
  source  = "app.terraform.io/georgevazj-lab/akv/azure"
  version = "0.0.8"

  akv_location = module.rsg.outputs.resource_group_location
  akv_name = var.akv_name
  enabled_disk_encryption = var.enabled_disk_encryption
  purge_protection_enabled = var.purge_protection_enabled
  resource_group_name = module.rsg.output.resource_group_name
  sku_name = var.sku_name
  soft_delete_retention_days = var.soft_delete_retention_days
  
  depends_on = [
    module.rsg
  ]
}

module "sta" {
  source  = "app.terraform.io/georgevazj-lab/sta/azure"
  version = "0.0.4"

  resource_group_name = module.rsg.resource_group_name
  sta_location = module.rsg.outputs.resource_group_location
  sta_name = var.sta_name
  account_replication_type = var.account_replication_type
  account_tier = var.account_tier
  environment_tag = var.environment_tag

  depends_on = [
    module.rsg
  ]
}