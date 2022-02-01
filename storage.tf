resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  allow_blob_public_access = false
  account_kind             = "StorageV2"
  is_hns_enabled           = true

  tags = {
    environment = var.env_name
  }
}
