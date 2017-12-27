
variable "vnet_name" {
  description = "The name of the vNet"
}

variable "address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default = []
}

variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
    description = "The name of the resource group to add the vNet to"
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type = "map"
}