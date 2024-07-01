variable "subscription_id" {
  description = "The subscription ID for Azure"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location where the resource group will be created"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
}

variable "subnet_bastion_name" {
  description = "The name of the bastion subnet"
  type        = string
}

variable "subnet_bastion_address_prefix" {
  description = "The address prefix of the bastion subnet"
  type        = string
}

variable "storage_account_name" {
  description = "The location where the resource group will be created"
  type        = string
}

variable "storage_container_name" {
  description = "The location where the resource group will be created"
  type        = string
}

