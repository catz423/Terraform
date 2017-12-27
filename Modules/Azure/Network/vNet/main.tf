resource "azurerm_resource_group" "network" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

#Create vNet
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}"
  address_space       = ["${var.address_space}"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.network.name}"
  tags                = "${var.tags}"
}
