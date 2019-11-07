Import-Module BitsTransfer

$totaltime=0
$i=0
$start_time = Get-Date

#Script pour DL tous les fichiers d'une URL avec incrémentation et les placer dans C:\dw\
while($i -le 1141)
{
 
    $url = "urlbasename" + $i + ".ts"
    $output =  "C:\dw\"+ $i +".ts"

    Start-BitsTransfer -Source $url -Destination $output -Asynchronous
    

    if($ii -ge 10)
    {
        Get-BitsTransfer | Complete-BitsTransfer
        $ii=0
    }
    $ii++   
    $i++

}

Get-BitsTransfer | Complete-BitsTransfer
echo $((Get-Date).Subtract($start_time).Seconds)