#   __   ____              ___    ___                           __   ____     
#  / /  / / / __ __  ____ / _ \  / _ \ ___   ___ ___   ___  ___/ /  |_  /     
# / /__/_  _// // / / __// // / / , _// -_) (_-</ -_) / _ \/ _  /  _/_ <      
#/____/ /_/  \_,_/ /_/   \___/ /_/|_| \__/ /___/\__/ /_//_/\_,_/  /____/     
#
#importando o modulo
import-module -Name VMware.VimAutomation.Core

#Antes de rodar certifique que a vm pode ser desligada
$vmname = Read-Host "Digite o nome da Vm"
$caminho = Read-Host "Digite o Caminho para exportar o arquivo:"

#se entrar a vmware ele continua as operacoes
if(get-vm -Name $vmname -ErrorAction SilentlyContinue)
{
    #remove os snapshots
    Get-Snapshot $vmname | Remove-Snapshot -confirm:$false
    
    #desliga a vm
    Get-VM -Name $vmname | Shutdown-VMGuest -confirm:$false
    
    #remove as cdrom 
    Get-VM -Name $vmname | Get-CDDrive | Set-CDDrive -NoMedia -confirm:$false
    
    #faz o export
    Get-VM -Name $vmname | Export-VApp -Destination $caminho -Format OVA
}
else {
    Write-Host "Vm nao encontrada"
}