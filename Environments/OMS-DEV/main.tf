
#################################################################
#           PROVIDER                                           #
#################################################################
provider "azurerm" {
}

#################################################################
#           RESOURCES                                           #
#################################################################

resource "azurerm_resource_group" "RG" {
 name = "UFG-D-OMS-ResGrp"
 location = "EastUS"
}

#Create Azure Automation Account
module "AzureAutomation"{
  source = "../../Modules/Azure/AzureAutomation"
  resource_group_name = "${azurerm_resource_group.RG.name}"
  account_name = "UFG-D-OMS-AzureAutomation"
  location = "EastUS2"
  sku = "Basic"
  tags = "${var.tags}"
}

#Create Log Analytics Workspace
module "LogAnalytics"{
  source = "../../Modules/Azure/LogAnalytics"
  resource_group_name = "${azurerm_resource_group.RG.name}"
  log_account_name = "UFG-D-OMS-LogAnalytics"
  location = "EastUS"
  sku = "Standard"
  retention = 30
  tags = "${var.tags}"
}



