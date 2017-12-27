
variable "resource_group_name" {
  description = "Default resource group name that the network will be created in."
}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
}

variable "vnet_name" {
  description = "Name of the vnet to create"
}

# If no values specified, this defaults to Azure DNS 
variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  default     = []
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  default     = ["subnet1"]
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  default     = ["10.0.1.0/24"]
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type = "map"
}

variable "allow_rdp_traffic" {
  description = "This optional variable, when set to true, adds a security rule allowing RDP traffic to flow through to the newly created network. The default value is false."
  default = false  
}

variable "allow_ssh_traffic" {
  description = "This optional variable, when set to true, adds a security rule allowing SSH traffic to flow through to the newly created network. The default value is false."
  default = false  
}

variable "sg_name" {
  description = "Give a name to security group"
  default = "TFTest_NSG"
}

variable "NSG_RG_name" {
  description = "Give a name to Resource Group for the security group"
  default = "TFTest_NSG_RG"
}