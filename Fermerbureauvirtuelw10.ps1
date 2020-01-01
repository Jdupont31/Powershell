Function Fermeturebureauvirtuelw10
{
    $KeyShortcut = Add-Type -MemberDefinition @"
    [DllImport("user32.dll")]
    static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo);
    //WIN + CTRL + F4: Ferme le bureau virtuel
    public static void Fermeturebureauvirtuelw10()
    {
        //Key down
        keybd_event((byte)0x5B, 0, 0, UIntPtr.Zero); //Left Windows key 
        keybd_event((byte)0x11, 0, 0, UIntPtr.Zero); //CTRL
        keybd_event((byte)0x73, 0, 0, UIntPtr.Zero); //F4
        //Key up
        keybd_event((byte)0x5B, 0, (uint)0x2, UIntPtr.Zero);
        keybd_event((byte)0x11, 0, (uint)0x2, UIntPtr.Zero);
        keybd_event((byte)0x73, 0, (uint)0x2, UIntPtr.Zero);
    }
"@ -Name CloseVirtualDesktop -UsingNamespace System.Threading -PassThru
    $KeyShortcut::Fermeturebureauvirtuelw10()
}


Function CloseAllVirtualDesktopInWin10() {
    $maxNumber=1..800
    foreach ($n in $maxNumber)
    {
        Fermeturebureauvirtuelw10
    }
}

CloseAllVirtualDesktopInWin10

