variable "AppName" {
  description = "The name of the application or service"
  default = "TFTest"
}

variable "vm_hostname" {
  description = "VM name referenced also in storage-related names."
  default = "TFTestVM"
}

variable "vm_count" {
    description = "Number of VM instances to deploy"
    default = 2
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
  default     = "South Central US"
}

variable "address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = ["10.0.0.0/21"]
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  default     = ["10.0.1.0/27"]
}

#variable "storage_account_tier" {
#  description = "Defines the Tier of storage account to be created. Valid options are Standard and Premium."
#  default     = "Standard"
#}

#variable "storage_replication_type" {
#  description = "Defines the Replication Type to use for this storage account. Valid options include LRS, GRS etc."
#  default     = "LRS"
#}

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

variable "tags" {
  type = "map"
  description = "A map of the tags to use on the resources that are deployed with this module."
  default = {
    Environment = "DEV"
    Description = "Terraform Test"
    ProductOwner = "Dan Cat"
  }
}