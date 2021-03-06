#foldery do skanowania
$startDirectory = 'c:\program files\'
 
#listuje wszytskie folder po $startdirecotry
$directoryItems = Get-ChildItem $startDirectory | Where-Object {$_.PSIsContainer -eq $true} | Sort-Object
 
#petla do skanu folderow
foreach ($i in $directoryItems)
{
    $subFolderItems = Get-ChildItem $i.FullName -recurse -force | Where-Object {$_.PSIsContainer -eq $false} | Measure-Object -property Length -sum | Select-Object Sum
    $i.FullName + " -- " + "{0:N2}" -f ($subFolderItems.sum / 1MB) + " MB"
    }