
output "AA_id" {
  value = "${module.AzureAutomation.id}"
}

output "LA_id" {
  value = "${module.LogAnalytics.id}"
}

output "LA_Workspace_id" {
  value = "${module.LogAnalytics.workspace_id}"
}

output "LA_URL" {
  value = "${module.LogAnalytics.url}"
}