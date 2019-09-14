function wait {
  param([int]$stop = 3)
  Start-Sleep -seconds $stop
}

[void] [System.Reflection.Assembly]::LoadWithPartialName("'Microsoft.VisualBasic")
& "$env:WinDir\Notepad.exe"
$a = Get-Process | Where-Object {$_.Name -eq "Notepad"}
wait
[Microsoft.VisualBasic.Interaction]::AppActivate($a.ID)
[void] [System.Reflection.Assembly]::LoadWithPartialName("'System.Windows.Forms")
wait
[System.Windows.Forms.SendKeys]::SendWait("{F5}{ENTER}")
[System.Windows.Forms.SendKeys]::SendWait("~Name:{TAB}$env:UserName~")
[System.Windows.Forms.SendKeys]::SendWait("ABCDEFGHIJKLM~")
[System.Windows.Forms.SendKeys]::SendWait("ABCDEFGHIJKLM{BACKSPACE}~")
[System.Windows.Forms.SendKeys]::SendWait("^{HOME}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}~{DELETE}")
wait
[System.Windows.Forms.SendKeys]::SendWait("%F")
wait
[System.Windows.Forms.SendKeys]::SendWait("X")
wait
[System.Windows.Forms.SendKeys]::SendWait("N")
exit