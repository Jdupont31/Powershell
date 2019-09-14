function ConvertTo-Jpg
{
    [cmdletbinding()]
    param([Parameter(Mandatory=$true, ValueFromPipeline = $true)] $Path)

    process{
        if ($Path -is [string])
        { $Path = get-childitem $Path }

        $Path | foreach {
            $image = [System.Drawing.Image]::FromFile($($_.FullName));
            $FilePath = [IO.Path]::ChangeExtension($_.FullName, '.jpg');
            $image.Save($FilePath, [System.Drawing.Imaging.ImageFormat]::Jpeg);
            $image.Dispose();
        }
    }

 }

 #Use function:
 #Cd to directory w/ png files
 cd C:\wallpjo\

 #Run ConvertTo-Jpg function
 Get-ChildItem *.png | ConvertTo-Jpg