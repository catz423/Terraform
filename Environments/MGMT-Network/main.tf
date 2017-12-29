## Author: Dan Catinella - 12/26/2017

#################################################################
#           REMOTE STATE                                        #
#################################################################

#Use Azure Blob Storage
terraform {
  backend "azurerm" {
    storage_account_name = "tfstateblob"
    container_name       = "terraform-state"
    key                  = "prod-mgmt-networks.terraform.tfstate"
    access_key           = "MDrSR0viBlGHo+1AdjPj51AwfdWmJkLAtU7blB6sAExpRtfQbkS4bhPmnMoY6G1VeQT3D4BZkWT/Q3q9Sbc2PA=="
  }
}

#################################################################
#           VARIABLES                                           #
#################################################################

variable "tenantid" {
  #default = "5e564299-5ce2-4c3e-93fa-e1212bd7ceda" #FAH Holdings
  default = "19a60988-3f4f-4cb7-a5b4-a97a99c8a4ff" #DAN - PERSONAL
  } 

variable "subscriptionid" {
  #default = "9173b146-58ca-4c49-9b27-dd15f3249f0c" #FAH Holdings
  default = "d1e70a32-b7b1-4889-9e7e-ebb21dd35acb" #DAN - PERSONAL
  } 

#################################################################
#           PROVIDER                                           #
#################################################################

# Configure the Microsoft Azure Provider
provider "azurerm" {
  tenant_id       = "${var.tenantid}"
  subscription_id = "${var.subscriptionid}"
  #client_id       = "${var.clientid}"
  #client_secret   = "${var.clientsecret}"
}

#################################################################
#           RESOURCES                                           #
#################################################################

#Create vNet
module "vnet"{
  source = "../../Modules/Azure/Network/vNet"
  vnet_name = "${var.AppName}_vNet"
  resource_group_name = "${var.AppName}_Network_RG"
  location = "${var.location}"
  address_space = "${var.address_space}"
  tags = "${var.tags}"
}

#Create Management App Subnet
module "subnet"{
  source = "../../Modules/Azure/Network/Subnet"
  vnet_name = "${module.vnet.vnet_name}"
  resource_group_name = "${var.AppName}_Network_RG"
  NSG_RG_name = "${var.AppName}_NSG_RG"
  allow_rdp_traffic = "true"
  location = "${var.location}"
  subnet_prefixes = ["${var.subnet_prefixes}"]
  subnet_names = ["MGMT_App_Subnet"]
  tags = "${var.tags}"
}
