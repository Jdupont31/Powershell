
$ComputerName = "E05970"
$secpasswd = Read-Host "Entrer un mot de passe" -AsSecureString

$user = New-Object System.Management.Automation.PSCredential ("pssvp1", $secpasswd)
invoke-command -ComputerName $ComputerName -Credential $user -script {get-process} 