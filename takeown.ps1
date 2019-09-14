

takeown /f C:\Windows\Web\Screen\img105.jpg
icacls C:\Windows\Web\Screen\img105.jpg /Grant 'Dupont:(F)'
Remove-Item C:\Windows\Web\Screen\img105.jpg
Copy-Item C:\wallpjo\lock.jpeg C:\Windows\Web\Screen\img105.jpg