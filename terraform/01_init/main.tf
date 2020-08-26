resource "azurerm_resource_group" "tfstate_rg" {
  name     = var.BACKEND_RESOURCE_GROUP_NAME
  location = var.LOCATION
}

resource "azurerm_storage_account" "tfstate" {
  name                     = var.BACKEND_STORAGE_ACCOUNT_NAME
  resource_group_name      = azurerm_resource_group.tfstate_rg.name
  location                 = azurerm_resource_group.tfstate_rg.location
  account_tier             = var.STORAGE_ACCOUNT_ACCOUNT_TIER
  account_replication_type = var.STORAGE_ACCOUNT_ACCOUNT_REPLICATION_TYPE
  account_kind             = var.STORAGE_ACCOUNT_ACCOUNT_KIND

  identity {
    type = var.IDENTITY_TYPE
  }

  tags = {
    environment = var.TAGS_ENVIRONMENT
    version     = var.TAGS_VERSION
  }
}

resource "azurerm_storage_container" "tfstate_container" {
  name = var.BACKEND_CONTAINER_NAME
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}
