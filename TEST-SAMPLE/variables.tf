variable "resource_group" {
  description = "The name of the resource group in which to create the virtual network."
  default = "TFTest_rg"
}

variable "rg_prefix" {
  description = "The shortened abbreviation to represent your resource group that will go on the front of some resources."
  default     = "TFTest"
}

variable "hostname" {
  description = "VM name referenced also in storage-related names."
  default = "TFTestVM"
}

variable "vm_count" {
    description = "Number of VM instances to deploy"
    default = 3
}

#1 = Assign IP, 0 = No Public IP
#variable "create_public_ip" {
#  description = "If set to true, create a Public IP for the VMs"
#  default = 0
#}
#variable "public_ip_type"{
#  description = "Type of Public IP assignment"
#  default = "Dynamic"
#}

#variable "dns_name" {
#  description = " Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system."
#}

#variable "lb_ip_dns_name" {
#  description = "DNS for Load Balancer IP"
#}

variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  default     = "East US"
}

#variable "virtual_network_name" {
#  description = "The name for the virtual network."
#  default     = "vnet"
#}

variable "address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = "10.0.1.0/26"
}

variable "subnet_prefix" {
  description = "The address prefix to use for the subnet."
  default     = "10.0.1.0/26"
}

#variable "storage_account_tier" {
#  description = "Defines the Tier of storage account to be created. Valid options are Standard and Premium."
#  default     = "Standard"
#}

#variable "storage_replication_type" {
#  description = "Defines the Replication Type to use for this storage account. Valid options include LRS, GRS etc."
#  default     = "LRS"
#}

variable "vm_size" {
  description = "Specifies the size of the virtual machine."
  default     = "Standard_DS2_v2"
}

variable "image_publisher" {
  description = "name of the publisher of the image (az vm image list)"
  default     = "MicrosoftWindowsServer"
}

variable "image_offer" {
  description = "the name of the offer (az vm image list)"
  default     = "WindowsServer"
}

variable "image_sku" {
  description = "image sku to apply (az vm image list)"
  default     = "2016-Datacenter"
}

variable "image_version" {
  description = "version of the image to apply (az vm image list)"
  default     = "latest"
}

variable "admin_username" {
 description = "administrator user name"
  default     = "testadmin"
}

variable "admin_password" {
  description = "administrator password (recommended to disable password auth)"
  default = "Password1234!"
}

variable "tag_product_owner" {
  description = "Product Owner of resource"
  default = "Dan Cat"  
}

variable "tag_description" {
  description = "Description of resource"
  default = "Terraform Test"
}