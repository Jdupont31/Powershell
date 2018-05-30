$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate('explorer.exe')
Sleep 1
$wshell.SendKeys('~')

