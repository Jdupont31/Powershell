# 
#Utilisé le compte logué sur le poste.
#Sinon le process va être lancé dans l'autre session
#Ne se lance pas graphiquement car invoker en réseau.
#Il faut que le service powershell soit activé sur la machine.
#
$secpasswd = Read-Host "Entrer un mot de passe" -AsSecureString
$user = New-Object System.Management.Automation.PSCredential ("pssvp1", $secpasswd)

invoke-command  -computername e05914 -Credential $user -ScriptBlock {

 $ie=new-object -com "InternetExplorer.Application"
 $ie.fullscreen=$TRUE
 $ie.navigate("http://www.ladepeche.fr")
 $ie.visible = $true
 $ie.silent = $true 

}