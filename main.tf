terraform {
  backend "azurerm" {
    resource_group_name   = "demosatatergnew"
    storage_account_name  = "demostatesaterra123"
    container_name        = "terraform-state-cont"
    key                   = "terraform.tfstate"
    use_msi               = true
    client_id             = "a7fb605e-8786-4e0d-a5b1-aa49b75946ad"
    access_key            = "YI2jYffR0py6EFrpJFeEvWTJGvN6rEvghRf1bQJv3OvMBmH9qzTmQcPns+ofdefLauVdJVZ0Ig5t+AStdZeYeg=="
  }
}

provider "azurerm" {
  features {}

  use_msi         = true
  subscription_id = var.subscription_id
  client_id       = "a7fb605e-8786-4e0d-a5b1-aa49b75946ad" 
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "bastion" {
  name                 = var.subnet_bastion_name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.subnet_bastion_address_prefix]
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_storage_container" "example" {
  for_each              = toset(var.storage_container_names)
  name                  = each.value
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}
