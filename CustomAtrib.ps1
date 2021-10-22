$count = 0
cls 
Get-VM | %{

$_.Name
#$_.Notes
write-host $_.CustomFields
#$_

if($_.Notes -like "*"){}else{
$Description = ""
Set-VM -VM $_ -Notes $Description -Confirm:$false
}
write-host "==============================="
#Read-Host "next.."
$count++

}

$count
#Set-CustomAttribute -Name CreationDetails -CustomAttribute CreationDate
#New-CustomAttribute -Name "CompanyName" -TargetType VMHost, VirtualMachine