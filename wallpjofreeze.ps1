# Para faire Install-Module NTFSSecurity
$folder = "C:\wallpjo"                         # PATH
$subreddits = @("wallpaper")                   # SUB best
$subredditslock = @("wallpapers")              # SUBlock less
$timeframe = "day"                             # FREQ

# Init upvote
$upvotes = 0 
$upvoteslock = 0

# Loop through each sub
$subreddits | ForEach-Object{
    $json = Invoke-RestMethod -uri "https://www.reddit.com/r/$_/top.json?t=$timeframe&limit=1"  # Get JSON file for the top posts
    $sub_upvotes = $json.data.children[0].data.ups                                    # Get number of upvotes for the top post
    
    # If the top post has more upvotes than the (current) most upvoted
    if($sub_upvotes -gt $upvotes){
        $upvotes = $sub_upvotes                                         # Set as most upvoted top post
        $url = $json.data.children[0].data.preview.images[0].source.url # Navigate through the JSON to get the URL
    }
}

# Loop through each sub
$subredditslock | ForEach-Object{
    $jsonlock = Invoke-RestMethod -uri https://www.reddit.com/r/$_/top.json?t=$timeframe  # Get JSON file for the top posts
    $sub_upvoteslock = $jsonlock.data.children[0].data.ups                                    # Get number of upvotes for the top post
    
    # If the top post has more upvotes than the (current) most upvoted
    if($sub_upvoteslock -gt $upvoteslock){
        $upvoteslock = $sub_upvoteslock                                         # Set as most upvoted top post
        $urllock = $jsonlock.data.children[0].data.preview.images[0].source.url # Navigate through the JSON to get the URL
    }
}

    if($sub_upvoteslock -gt $sub_upvotes){
     $a=$subreddits
     $subreddits=$subredditslock
     $subredditslock=$a
    }


# Replace &amp with & in the URL; More info : https://old.reddit.com/r/redditdev/comments/9ncg2r/changes_in_api_pictures/
$url = $url.Replace('&amp;', '&') 
$urllock = $urllock.Replace('&amp;', '&') 
                             
# Get the filename 
$todaydate = Get-Date -Format "yyyy-MM-dd"      # Get the date (file will be saved as date)
$extension = $url -replace '.*\.(.*?)\?.*','$1' # Get the file extension from the URL
$extensionlock = $urllock -replace '.*\.(.*?)\?.*','$1' # Get the file extension from the URL
$filename = "$todaydate.$extension"            # Combine the date + the extension for the filename
$path = "$folder\$filename"                     # Complete outfile path (folder param + filename)

$extensionlock = $urllock -replace '.*\.(.*?)\?.*','$1'
$filenamelock = "lock.$extensionlock"
$pathlock = "$folder\$filenamelock"  


# Download and save the file
Invoke-WebRequest $url -OutFile $path
Invoke-WebRequest $urllock -OutFile $pathlock



# Set the wallpaper - stolen from : https://stackoverflow.com/questions/43187787/change-wallpaper-powershell
$setwallpapersrc = @"
using System.Runtime.InteropServices;
public class wallpaper
{
public const int SetDesktopWallpaper = 20;
public const int UpdateIniFile = 0x01;
public const int SendWinIniChange = 0x02;
[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
private static extern int SystemParametersInfo (int uAction, int uParam, string lpvParam, int fuWinIni);
public static void SetWallpaper ( string path )
{
SystemParametersInfo( SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange );
}
}
"@

Add-Type -TypeDefinition $setwallpapersrc

[wallpaper]::SetWallpaper($path) 


#C:\ProgramData\Microsoft\Windows\SystemData
takeown /f C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-21-1202660629-854245398-1801674531-11331\ReadOnly\LockScreen_O\LockScreen___1920_1080_notdimmed.jpg
takeown /f C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-21-1202660629-854245398-1801674531-11331\ReadOnly\LockScreen_O\
icacls C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-21-1202660629-854245398-1801674531-11331\ReadOnly\LockScreen_O\LockScreen___1920_1080_notdimmed.jpg /Grant 'Dupont:(F)'
icacls C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-21-1202660629-854245398-1801674531-11331\ReadOnly\LockScreen_O\ /Grant 'Dupont:(F)'
Add-NTFSAccess –Path "C:\ProgramData\Microsoft\Windows\SystemData\" –Account "dupont@ladepeche.local" –AccessRights Modify

#Ne fonctionne pas celà dois enlever readonly
#attrib -s -h -r C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-21-1202660629-854245398-1801674531-11331\ReadOnly\LockScreen_O\ /s /d


Remove-Item C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-21-1202660629-854245398-1801674531-11331\ReadOnly\LockScreen_O\LockScreen___1920_1080_notdimmed.jpg
Copy-Item C:\wallpjo\lock.$extensionlock C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-21-1202660629-854245398-1801674531-11331\ReadOnly\LockScreen_O\LockScreen___1920_1080_notdimmed.jpg

