#   __   ____              ___    ___                           __   ____     
#  / /  / / / __ __  ____ / _ \  / _ \ ___   ___ ___   ___  ___/ /  |_  /     
# / /__/_  _// // / / __// // / / , _// -_) (_-</ -_) / _ \/ _  /  _/_ <      
#/____/ /_/  \_,_/ /_/   \___/ /_/|_| \__/ /___/\__/ /_//_/\_,_/  /____/     
#



Install-Module -Name VMware.VimAutomation.Core
add-pssnapin vmware.vimautomation.core
$VcenterServer = Read-Host "Digite o ip ou o nome do servidor do vcenter"
$cred = Get-Credential
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-VIServer -Server $VcenterServer -Credential ($cred)