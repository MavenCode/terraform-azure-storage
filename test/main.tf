resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_location
  location = var.resource_group_location
}

module "datalakes" {
  source                   = "../"
  storage_account_name     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  resource_group_location  = azurerm_resource_group.rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  env_name                 = var.env_name

}
