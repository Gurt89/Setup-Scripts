$newName = Read-Host -Prompt "Enter New Computer Name"
$domain = "gurtler.local"
$user = "ngurtler"
$password = Read-Host -Prompt "Enter password for $user" -AsSecureString 
$username = "$domain\$user" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password) 
Rename-Computer -NewName $newName -Force
Write-Host "Please waiting for a moment to change Domain and then restart" -ForegroundColor Red
Add-Computer -DomainName $domain -Options JoinWithNewName -Credential $credential