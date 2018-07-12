#Mount network share to H:
New-PSDrive -Name H -PSProvider FileSystem -Root \\srv_win_veeam\Net_Share -Persist

#Install SNMP
Import-Module ServerManager
Install-WindowsFeature SNMP-Service
Install-WindowsFeature RSAT-SNMP

#Configure SNMP
Invoke-Command -ComputerName 127.0.0.1 -FilePath H:\scripts\InstallSNMP.ps1