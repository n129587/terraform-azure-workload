# Azure resource group
variable "env_acronym" {
  type = string
  description = "(Required) Environment acronym. Default: d1"
  default = "d1"
}

variable "entity" {
  type = string
  description = "(Required) Entity acronym"
  default = "san"
}

variable "sequence_number" {
  type = string
  description = "(Required) Resource sequence number"
  default = "001"
}

variable "workload_acronym" {
  type = string
  description = "(Required) Workload acronym."
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