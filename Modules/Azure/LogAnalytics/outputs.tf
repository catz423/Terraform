
output "workspace_id" {
  value = "${azurerm_log_analytics_workspace.logs.workspace_id}"
}

output "id" {
  value = "${azurerm_log_analytics_workspace.logs.id}"
}

output "url" {
  value = "${azurerm_log_analytics_workspace.logs.portal_url}"
}