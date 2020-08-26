provider "azurerm" {
  subscription_id = var.SUBSCRIPTION_ID
  # client_id       = "..."
  # client_secret   = "..."
  # tenant_id       = "..."
  version           = "~>2.8.0"
  features {} 
}
provider "azuread" {
  version         = "=0.7" 
  subscription_id = var.SUBSCRIPTION_ID
}

terraform {
  required_version = ">= v0.12.26"
  backend "azurerm" {
    resource_group_name  = "azstack-remote-state"
    storage_account_name = "azstackstore"
    container_name       = "azstfrs"
    key                  = "02_base/01_net"

    /*
      Azure stack using terraform azurerm provider
      access_key is retrieved from the BACKEND_STORAGE_ACCOUNT > Access keys > Key value
      select Azure stack vars from .env file > TERRAFORM global > Azurestack
    */
    environment          = "AZURESTACKCLOUD" 
    access_key           = "ReplaceMeWithTheAccessKeyFromAzureStorageAccountLength88CharsHere=="
  }
}
