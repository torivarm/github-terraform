variable "rg_name" {
    type = string
    description = "Name of the resource group"
    default = "rg-terraform"
}

variable "rg_location" {
    type = string
    description = "Location of the resource group"
    default = "westeurope"
}

variable "sa_name" {
    type = string
    description = "Name of the storage account"
    default = "satf"
}