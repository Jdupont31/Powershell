Function AssociateFileExtensions
{
    Param
    (
        [Parameter(Mandatory=$true)]
        [String[]] $FileExtensions,
        [Parameter(Mandatory=$true)]
        [String] $OpenAppPath
    ) 
    if (-not (Test-Path $OpenAppPath))
    {
	   throw "$OpenAppPath does not exist."
    }   
    foreach ($extension in $FileExtensions)
    {
        $fileType = (cmd /c "assoc $extension")
        $fileType = $fileType.Split("=")[-1] 
        cmd /c "ftype $fileType=""$OpenAppPath"" ""%1"""
    }
}


AssociateFileExtensions