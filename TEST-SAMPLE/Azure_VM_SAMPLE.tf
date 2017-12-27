## Author: Dan Catinella / 10/15/20017

#################################################################
#           VARIABLES                                           #
#################################################################

variable "tenantid" {default = "5e564299-5ce2-4c3e-93fa-e1212bd7ceda"} 
variable "subscriptionid" {default = "9173b146-58ca-4c49-9b27-dd15f3249f0c"} 

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

#Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group}"
  location = "${var.location}"

  tags {
    ProductOwner = "${var.tag_product_owner}"
    Description = "${var.tag_description}"
  }
}

#Create vNet
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.rg_prefix}_vnet"
  address_space       = ["${var.address_space}"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
}

#Create Subnet
resource "azurerm_subnet" "sub" {
  name                 = "${var.rg_prefix}_sub"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "${var.subnet_prefix}"
}

#Create NSG
resource "azurerm_network_security_group" "NSG" {
  name                = "${var.rg_prefix}_nsg"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"

  security_rule {
    name                       = "NSG_Test"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "80"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags {
    ProductOwner = "${var.tag_product_owner}"
    Description = "${var.tag_description}"
  }
}

#Create NICs
resource "azurerm_network_interface" "nic" {
  name                = "${var.rg_prefix}nic${count.index}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  network_security_group_id = "${azurerm_network_security_group.NSG.id}"
  count               = "${var.vm_count}"

  ip_configuration {
    name                          = "ipconfig${count.index}"
    subnet_id                     = "${azurerm_subnet.sub.id}"
    private_ip_address_allocation = "dynamic"
  }

  tags {
    ProductOwner = "${var.tag_product_owner}"
    Description = "${var.tag_description}"
  }
}

#resource "azurerm_managed_disk" "test" {
#  name                 = "datadisk_existing"
#  location             = "${var.location}"
#  resource_group_name  = "${azurerm_resource_group.TFtest.name}"
#  storage_account_type = "Standard_LRS"
#  create_option        = "Empty"
#  disk_size_gb         = "1023"
#}

#Create VMs
resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.rg_prefix}vm${count.index}"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  #network_interface_ids = ["${azurerm_network_interface.TFtest.id}"] OLD
  network_interface_ids = ["${element(azurerm_network_interface.nic.*.id, count.index)}"]
  vm_size               = "${var.vm_size}"
  count                 = "${var.vm_count}"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "${var.image_publisher}"
    offer     = "${var.image_offer}"
    sku       = "${var.image_sku}"
    version   = "${var.image_version}"
  }

  storage_os_disk {
    name              = "osdisk${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  # Optional data disks
  #storage_data_disk {
  #  name              = "datadisk_new"
  #  managed_disk_type = "Standard_LRS"
  #  create_option     = "Empty"
  #  lun               = 0
  #  disk_size_gb      = "1023"


  #storage_data_disk {
  #  name            = "${azurerm_managed_disk.test.name}"
  #  managed_disk_id = "${azurerm_managed_disk.test.id}"
  #  create_option   = "Attach"
  #  lun             = 1
  #  disk_size_gb    = "${azurerm_managed_disk.test.disk_size_gb}"
  #}

  os_profile {
    computer_name  = "${var.hostname}${count.index}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }

  #os_profile_linux_config {
   # disable_password_authentication = false
  #}

  tags {
    ProductOwner = "${var.tag_product_owner}"
    Description = "${var.tag_description}"
  }
}

#################################################################
#           PROVISIONERS                                        #
#################################################################

#Server Class Installs

#################################################################
#           OUTPUT                                              #
#################################################################

#MOVED TO SEPARATE FILE