Add-Type @"
using System;                                                                     
using System.Runtime.InteropServices;
public class Tricks {
[DllImport("user32.dll")]                                                            
public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, int dwExtraInfo);}
"@   

[system.reflection.assembly]::Loadwithpartialname("system.windows.forms")

#left shift key pressed
[tricks]::keybd_event([System.Windows.Forms.Keys]::LShiftKey, 0x45, 0, 0);
Start-Sleep 10
#left shift key released
[tricks]::keybd_event([System.Windows.Forms.Keys]::LShiftKey, 0x45, 0x2, 0);    