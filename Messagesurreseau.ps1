
$message = read-host -prompt 'ERROR'; 
Invoke-WmiMethod -Class win32_process -ComputerName e07171 -Name create -ArgumentList  "c:\windows\system32\msg.exe * $message"