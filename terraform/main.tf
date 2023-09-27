locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  rg_name = "${var.rg_name}-${local.workspaces_suffix}"
}

resource "random_string" "random_string" {
  length  = 10
  special = false
  upper   = false
}

resource "azurerm_resource_group" "rg" {
    name     = local.rg_name
    location = var.rg_location
}

resource "azurerm_storage_account" "sa" {
  name = "${lower(var.sa_name)}${random_string.random_string.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}

output "rg_name" {
    value = azurerm_resource_group.rg.name
}