#En cours d'élaboration

$computer = Read-Host "Nom PC sur lequel supprimer l'imprimante"

Write-host "`Liste des imprimantes sur ce poste :"
Get-WmiObject -class Win32_Printer -computer $computer | fl -Property Name

$impsup = Read-Host "Nom EXACT de l'imprimante à supprimer"

Remove-Printer -ComputerName $computer -name $impsup 
Write-host "Opération effectué, imprimante restante"
Get-WmiObject -class Win32_Printer -computer $computer | fl -Property Name