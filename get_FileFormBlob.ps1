#connect to azure
Connect-AzAccount

#Add module
Install-Module AzureRM



$resourceGroup = "PackerAgents"
 $storageAccountName = "appswin10"
 $containerName = "appspacker"
    
 $storageAccount = Get-AzStorageAccount `
   -ResourceGroupName $resourceGroup `
   -Name $storageAccountName
 $ctx = $storageAccount.Context 
    
 Get-AzStorageBlobContent -Blob "7z2106-x64.msi" `
   -Container $containerName `
   -Destination "C:\Users\rafal\Downloads\azure\" `
   -Context $ctx 
