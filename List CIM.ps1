
 # List CIMClass by name
 #$class = Get-CimClass -ClassName Win32_Process
 #$class.CimClassMethods

 # Trouver cimclass par nom
 # get-cimclass *reboot*

 $class = Get-CimClass -ClassName Win32_Process
 $class.CimClassMethods

 #Write OUTPUT
 Write-Output "-------------------"

 $class.CimClassMethods[“Create”].Parameters