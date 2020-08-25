
#monitoruj prcesy kktórei jak uzywaja cpu
#todo nex week
#export to cvs
$timestart = Get-Date
$timeend = $timestart.AddMinutes(2)
write-host "Start Time: $timestart"
Write-Host "End time: $timeend"
Do {
    $timenow = Get-Date
    if ($timenow -ge $timeend){
        Write-Host "its time to finish"
    }else {
        Write-Host "not done yet"
        Get-Process | sort CPU -Descending | select -first 5 -Property Processname,ID,CPU | Export-csv -Path .\test.csv -Append
    }
    start-sleep -seconds 20
    

}until ($timenow -gt $timeend)

