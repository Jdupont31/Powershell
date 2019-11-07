#Move item vers rep puis remplacement. Arretez de m'ennuyer avec la télémetry ...

takeown /f C:\Windows\System32\CompatTelRunner.exe
icacls C:\Windows\System32\CompatTelRunner.exe /Grant 'Dupont:(F)'
remove-item C:\Windows\System32\CompatTelRunner.exe
