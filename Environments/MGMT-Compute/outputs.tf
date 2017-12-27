# output "vm_name" {
#   #value = "${join(",", module.WindowsVMs.*.vm_names)}"
#   value = "${module.WindowsVMs.vm_names}"
# }

# output "vm_private_ip" {
#   #value = "${join(",", azurerm_network_interface.nic.*.private_ip_address)}"
#   value = "${module.WindowsVMs.network_interface_private_ip}"
# }

# output "vm_public_ip" {
#   #value = "${join(",", azurerm_network_interface.nic.*.private_ip_address)}"
#   value = "${module.WindowsVMs.public_ip_address}"
# }