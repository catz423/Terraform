
#https://docs.microsoft.com/en-us/powershell/module/azurerm.automation/register-azurermautomationdscnode?view=azurermps-4.4.1

#Registers an Azure VM to a DSC Configuration

Param(
  [Parameter(Mandatory=$True)]
  [string]$AzureVMRGName,
  [Parameter(Mandatory=$True)]
  [string]$computerName,
  [Parameter(Mandatory=$True)]
  [string]$NodeConfig
)

#Security Principal to authenticate to Azure Subscription / This has to be established prior
$password = ConvertTo-SecureString "Password123!" -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential ("3e9d0996-8251-4f4e-bcc2-37371fd728fb", $password)
Login-AzureRmAccount -Credential $creds -ServicePrincipal -TenantId {19a60988-3f4f-4cb7-a5b4-a97a99c8a4ff}

$AutomationAccountName = "DanTest1"
$AutomationRGName = "DanTest1-AzureAuto"
$AzureVMRGName = $AzureVMRGName #TFTest_MGMT_App_RG
$AzureVMName = $computerName #TFTestVM0
$AzureVMLocation = "SouthCentralUS"
$NodeConfiguration = $NodeConfig #"FileResource.locahost"
$ConfigurationMode = "ApplyAndAutocorrect" #ApplyAndMonitor is default

Register-AzureRmAutomationDscNode -AutomationAccountName $AutomationAccountName -AzureVMResourceGroup $AzureVMRGName -AzureVMName $AzureVMName -AzureVMLocation $AzureVMLocation -ResourceGroupName $AutomationRGName -NodeConfigurationName $NodeConfiguration -ConfigurationMode $ConfigurationMode
