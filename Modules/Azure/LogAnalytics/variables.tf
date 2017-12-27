
variable "log_account_name" {
  description = "The name of the Azure Automation Account"
  default = "test"
}

variable "resource_group_name" {
  description = "Default resource group name that the network will be created in."
  default = "myapp-rg"
}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  default = "East US"
}

variable "sku" {
  description = "The SKU to use for Log Analytics Workspace"
  default = "Free"
}

variable "retention" {
  description = "The retention in days to use for Log Analytics Workspace"
  default = 30
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type = "map"
}
