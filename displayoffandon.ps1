#Affichage On et OFF


$time = Get-Date
if ($time.Hour -gt 17 -and $time.Hour -lt 8)
{powercfg -change -monitor-timeout-ac 1}
Else { Start-Sleep -s 60; $time = Get-Date; powercfg -change -monitor-timeout-ac 0}

