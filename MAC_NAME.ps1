$macAddresses = Get-WmiObject win32_networkadapterconfiguration
$tab=$macAddresses.macaddress
$netbiosName=$(Get-WmiObject Win32_Computersystem).name
$array = New-Object System.Collections.ArrayList
foreach ($mc in ($tab | Where-Object {$_ -ne $null}))
{
 $array.add([PSCUSTOMOBJECT]@{
    'Mac' = $mc
    'Netbiosname' = $netbiosName})
     
}
$array | Export-Csv H:\result.txt -notypeinformation -encoding UTF8