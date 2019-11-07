

takeown /f C:\Windows\Web\Screen\img105.jpg
icacls C:\Windows\Web\Screen\img105.jpg /Grant 'Dupont:(F)'
Remove-Item C:\Windows\Web\Screen\img105.jpg
Copy-Item C:\Windows\Web\Screen\img106.jpg C:\Windows\Web\Screen\img105.jpg