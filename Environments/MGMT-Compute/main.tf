## Author: Dan Catinella - 10/22/2017

#################################################################
#           REMOTE STATE                                        #
#################################################################

#Use Azure Blob Storage
terraform {
  backend "azurerm" {
    storage_account_name = "tfstateblob"
    container_name       = "terraform-state"
    key                  = "prod-mgmt-compute.terraform.tfstate"
    access_key           = "MDrSR0viBlGHo+1AdjPj51AwfdWmJkLAtU7blB6sAExpRtfQbkS4bhPmnMoY6G1VeQT3D4BZkWT/Q3q9Sbc2PA=="
  }
}

#Get Networks Remote State
data "terraform_remote_state" "mgmt-network" {
  backend = "azurerm"
  config {
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

#Create VMs
module "WindowsVMs"{
  source = "../../Modules/Azure/Compute"
  #resource_group_name = "${azurerm_resource_group.rg.name}VMs"
  resource_group_name = "${var.AppName}_MGMT_App_RG"
  location = "${var.location}"
  #vnet_subnet_id = "${module.subnet.vnet_subnets[0]}"
  vnet_subnet_id = "${data.terraform_remote_state.mgmt-network.vnet_subnets[0]}"
  admin_username = "${var.admin_username}"
  admin_password = "${var.admin_password}"
  #ssh_key = ""
  remote_port = "3389"
  #storage_account_type = ""
  vm_size = "Standard_DS1"
  nb_instances = "2"
  vm_hostname = "${var.vm_hostname}"
  vm_os_publisher = "MicrosoftWindowsServer"
  vm_os_offer = "WindowsServer"
  vm_os_sku = "2016-Datacenter"
  #vm_os_version = ""
  #vm_os_id = ""
  tags = "${var.tags}"
  public_ip_dns = ["tftest1", "tftest2"]
  public_ip_address_allocation = "dynamic"
  nb_public_ip = "${var.vm_count}"
  #data_sa_type = ""
  #data_disk_size_gb = ""
  #data_disk = "true"
}
