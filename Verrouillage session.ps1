Function Lock-WorkStation {
$signature = @’
[DllImport(“user32.dll”, SetLastError = true)]
public static extern bool LockWorkStation();
‘@
$name = “Win32LockWorkStation”
$LockWorkStation = Add-Type -memberDefinition $signature -name $name -namespace Win32Functions -passthru
$LockWorkStation::LockWorkStation() | Out-Null
}