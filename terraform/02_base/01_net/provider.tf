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
    /*
      Azure stack using terraform azurerm provider.
      1. access_key is retrieved from the BACKEND_STORAGE_ACCOUNT > Access keys > Key value
      2. terraform init -reconfigure with values as described in README.md
    */
    environment          = "AZURESTACKCLOUD" 
    //access_key           = "accessKeyFromAzureStorage=="    // (option 1 to test only, not reocmmended for production)
    # access_key           = var.state_access_key             // (option 2 pass value via init -reconfigure as string or env var ref)
    # resource_group_name  = var.state_resource_group_name    // "azstack-remote-state"
    # storage_account_name = var.state_storage_account_name   // "azstackstore"
    # container_name       = var.state_container_name         // "azstfrs"
    # key                  = var.state_key_06_database        // "02_base/01_net"
  }
}
