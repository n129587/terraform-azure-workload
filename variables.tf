# Azure resource group
variable "resource_group_name" {
  type = string
  description = "(Required) Resouce group name"
}

variable "location" {
  type = string
  description = "(Optional) Resource group location"
  default = "westeurope"
}

variable "description" {
  type = string
  description = "(Required) Resource group description"
}

# Azure Key vault
variable "akv_name" {
  type = string
  description = "(Required) Key Vault name"
}

variable "enabled_disk_encryption" {
  type = bool
  description = "Enable disk encryption"
  default = true
}

variable "soft_delete_retention_days" {
  type = number
  description = "(Optional) Soft delete retention days. Default: 7"
  default = 7
}

variable "purge_protection_enabled" {
  type = bool
  description = "(Optional) Enable purge protection. Default: false"
  default = false
}

variable "sku_name" {
  type = string
  description = "(Optional) Storage account SKU. Default: standard"
  default = "standard"
}

# Azure storage account
variable "sta_name" {
  type = string
  description = "(Required) Storage account name"
}

variable "account_tier" {
  type = string
  description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium"
  default = "Standard"
}

variable "account_replication_type" {
  type = string
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS"
  default = "LRS"
}

variable "environment_tag" {
  type = string
  description = "(Optional) Environment tag"
  default = "Sandbox"
}