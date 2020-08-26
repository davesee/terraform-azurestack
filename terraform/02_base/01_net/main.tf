/*
Sample resource group with remote storage.
*/

resource "azurerm_resource_group" "NET-rg" {
  name     = var.NET_RESOURCE_GROUP_01
  location = var.LOCATION
}