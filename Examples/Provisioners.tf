
#Provisioner Examples

resource "null_resource" "example1" {
    #Onboard VMs to DSC Configuration
    provisioner "local-exec" {
        command = "../DSC/OnboardVM.ps1 -AzureVMRGName \"${azurerm_resource_group.vm.name}\" -computerName \"${var.vm_hostname}${count.index}\" -NodeConfig \"FileResource.locahost\""
        interpreter = ["PowerShell", "-Command"]
    }
}

