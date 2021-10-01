#   __   ____              ___    ___                           __   ____     
#  / /  / / / __ __  ____ / _ \  / _ \ ___   ___ ___   ___  ___/ /  |_  /     
# / /__/_  _// // / / __// // / / , _// -_) (_-</ -_) / _ \/ _  /  _/_ <      
#/____/ /_/  \_,_/ /_/   \___/ /_/|_| \__/ /___/\__/ /_//_/\_,_/  /____/     
#

#importando o modulo
import-module -Name VMware.VimAutomation.Core

$vmName = Read-Host "Digite o Nome da vmware para procurar"

#ligando a maquina
Get-VM -Name $vmName | Start-VM
