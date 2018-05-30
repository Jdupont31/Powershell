


#Termine le processus avec terminate()
# et handle par la suite
#

[cmdletbinding()]
param(
$ComputerName=$env:COMPUTERNAME,
[parameter(Mandatory=$true)]
$ProcessName
)
$Processes = Get-WmiObject -Class Win32_Process -ComputerName $ComputerName -Filter "name='$ProcessName'"
if($processes) {
foreach ($process in $processes) {
$returnval = $process.terminate()
$processid = $process.handle
if($returnval.returnvalue -eq 0) {
write-host "nThe process $ProcessName ($processid) terminated successfully"
}
else {
write-host "nThe process $ProcessName ($processid) termination has some problems"
}
}
} else {
Write-host "`n No processes found with the name $ProcessName"
}
write-host ""
