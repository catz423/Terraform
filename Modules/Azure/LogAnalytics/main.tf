


#Create Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "logs" {
  name                = "${var.log_account_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  sku                 = "${var.sku}"
  retention_in_days   = "${var.retention}"

  tags     = "${var.tags}"

}