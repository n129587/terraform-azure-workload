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
  version = "0.0.10"

  akv_name = var.akv_name
  enabled_disk_encryption = var.enabled_disk_encryption
  purge_protection_enabled = var.purge_protection_enabled
  sku_name = var.sku_name
  soft_delete_retention_days = var.soft_delete_retention_days
  resource_group_name = module.rsg.resource_group_name
}

module "sta" {
  source  = "app.terraform.io/georgevazj-lab/sta/azure"
  version = "0.0.6"

  sta_name = var.sta_name
  account_replication_type = var.account_replication_type
  account_tier = var.account_tier
  environment_tag = var.environment_tag
  resource_group_name = module.rsg.resource_group_name
}