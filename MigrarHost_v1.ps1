#   __   ____              ___    ___                           __   ____     
#  / /  / / / __ __  ____ / _ \  / _ \ ___   ___ ___   ___  ___/ /  |_  /     
# / /__/_  _// // / / __// // / / , _// -_) (_-</ -_) / _ \/ _  /  _/_ <      
#/____/ /_/  \_,_/ /_/   \___/ /_/|_| \__/ /___/\__/ /_//_/\_,_/  /____/     
#
#Esse script lista os host disponiveis para migração

cls
#Importando o modulo
import-module -Name VMware.VimAutomation.Core

#buscando a VM
$vmName = Read-Host "Digite o Nome da vmware ou parte do nome.."
if($vms = Get-VM -Name "*$vmname*")
{
$i = 0
foreach($vm in $vms)
{
    write-host $i " - " $vm.name
    $i++
}
$opvm = Read-Host "Digite o numero da maquina:"



#buscando o host
$hosts = Get-vmhost
$j = 0
foreach($hostvm in $hosts)
{
    write-host $j " - " $hostvm.name
    $j++
}
$ophost = Read-Host "Digite o numero do host:"


write-host "==============================" -ForegroundColor Cyan
#migrando apenas os recursos computacionais
write-host "As opcoes escolhidas foram:"
Write-Host "VM:" ($vms[$opvm].name)
Write-Host "Hoost:" ($hosts[$ophost].name)
$confirm = 0
$confirm = Read-Host "Está certo disso? Enter para continuar e 0 para cancelar:"

if($confirm -eq 0)
{
    Write-Warning "Operação cancelada"
}
else
{
    Write-Host "Iniciando migração" -ForegroundColor Yellow
    Move-VM -VM $vmName -Destination $NewHost -Confirm:$false
}
}
else{Write-Warning "Nenhuma maquina encontrada"}
