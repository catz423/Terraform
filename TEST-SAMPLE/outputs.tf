output "vm_name" {
  value = "${join(",", azurerm_virtual_machine.vm.*.name)}"
}

output "vm_private_ip" {
  value = "${join(",", azurerm_network_interface.nic.*.private_ip_address)}"
}

