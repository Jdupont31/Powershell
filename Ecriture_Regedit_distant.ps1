
#Poste distant

$servername = "E0"
$reg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine', $servername)
$regconf = $reg.OpenSubKey("SYSTEM\\CurrentControlSet\\Services\\SNMP\\Parameters",$true)
#Ecriture de la valeur.
$regconf.SetValue('EnableAuthenticationTraps','0','DWord')
#Verification de la valeur.
$regconf.GetValue('EnableAuthenticationTraps')