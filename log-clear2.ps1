$Now = Get-Date
$LastWrite = $Now.AddDays(-30)
$Files = get-childitem -Path ".\logs" -include *.log -recurse |Where {$_.LastWriteTime -le "$LastWrite"} 
foreach ($File in $Files){
if ($File) {
write-host "Deleting File '$File'"
Remove-Item $File | out-null
}
}