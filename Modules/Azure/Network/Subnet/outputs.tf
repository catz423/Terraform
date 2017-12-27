

output "vnet_subnets" {
  description = "The ids of subnets created inside the newly created vNet"    
  value = "${azurerm_subnet.subnet.*.id}"
}

output "security_group_id" {
  description = "The id of the security group attached to subnets inside the newly created vNet. Use this id to associate additional network security rules to subnets."    
  value = "${azurerm_network_security_group.security_group.id}"
}