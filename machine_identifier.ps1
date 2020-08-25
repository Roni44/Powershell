#machines name
$env:COMPUTERNAME
#CPU
Get-WmiObject win32_processor | select name  
#RAM size
Get-WmiObject -class  win32_physicalmemory -Property capacity | select capacity

#IP
((Get-NetIPConfiguration).ipv4address).ipaddress
#login user
$env:username
#GUI?