output "resource_group_id" {
  value = azurerm_resource_group.rsg.id
}

output "resource_group_name" {
  value = azurerm_resource_group.rsg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rsg.location
}

output "akv_id" {
  value = azurerm_key_vault.akv.id
}

output "akv_name" {
    value = azurerm_key_vault.akv.name
}

output "sta_id" {
  value = azurerm_storage_account.sta.id
}

output "sta_name" {
  value = azurerm_storage_account.sta.name
}