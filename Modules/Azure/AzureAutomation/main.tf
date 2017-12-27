
#Create Resource Group
#resource "azurerm_resource_group" "RG" {
# name = "${var.resource_group_name}"
# location = "${var.location}"
# tags     = "${var.tags}"
#}

#Create Azure Automation Account
resource "azurerm_automation_account" "AA" {
  name                = "${var.account_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  sku {
    name = "${var.sku}"
  }

  tags     = "${var.tags}"

}