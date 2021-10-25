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
module "builder" {
  source  = "app.terraform.io/sanesp-poc/builder/azure"
  version = "0.0.1"

  sequence_number = var.sequence_number
  workload_acronym = var.workload_acronym
  location = var.location
  environment = var.env_acronym
  entity = var.entity
}

module "rsg" {
  source  = "app.terraform.io/sanesp-poc/rsg/azure"
  version = "0.0.3"

  resource_group_name = module.builder.resource_group
  resource_group_location = var.location
  description = "Resource group from Terraform Cloud"
}

module "akv" {
  source  = "app.terraform.io/sanesp-poc/akv/azure"
  version = "0.0.15"

  akv_name = module.builder.akv_name
  location = module.rsg.resource_group_location
  enabled_disk_encryption = var.enabled_disk_encryption
  purge_protection_enabled = var.purge_protection_enabled
  sku_name = var.sku_name
  soft_delete_retention_days = var.soft_delete_retention_days
  resource_group_name = module.rsg.resource_group_name
}

module "sta" {
  source  = "app.terraform.io/sanesp-poc/sta/azure"
  version = "0.0.9"

  sta_name = module.builder.sta_name
  location = module.rsg.resource_group_location
  account_replication_type = var.account_replication_type
  account_tier = var.account_tier
  environment_tag = var.environment_tag
  resource_group_name = module.rsg.resource_group_name
}