
# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "1bb6eeda-d07d-4234-8c09-51e3c4195fa0"
  client_id       = "b5572627-5d92-47ff-a6cd-7fbab596938e"
  client_secret   = "W312SU1gy4Gwdakyp4lRrSuT4yqe8X1o1LouJukdOhQ="
  tenant_id       = "6132875a-61c9-4549-b266-fe19f482fd8b"
}


terraform {
  backend "azurerm" {
    storage_account_name = "newsto"
    container_name       = "testcon"
    access_key = "YOB5Qg/lqGFD3ypHC7k+lS1ZtEFdmBCsNP/lcpUCFr06890WLXUb8myO5d3fPNMFd0ivAW8K/Wu1OzimLpRZ/Q=="
    key                  = "terraform.tfstate"
  }
}

# create a resource group 
resource "azurerm_resource_group" "RG" {
    name = "testrgnew30"
    location = "West US"
}

resource "azurerm_storage_account" "storageaccount" {
   name = "teststoragenew30"
   resource_group_name = "${azurerm_resource_group.RG.name}"
   location = "${azurerm_resource_group.RG.location}"
   account_tier = "Standard"
   account_replication_type = "GRS"
}
resource "azurerm_storage_container" "blobstorage" {
   name = "testcontainernew30"
   resource_group_name = "${azurerm_resource_group.RG.name}"
   storage_account_name = "${azurerm_storage_account.storageaccount.name}"
   container_access_type = "container" /*Can be either blob, container or private. Defaults to private.*/
}


