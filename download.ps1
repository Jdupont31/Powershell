Import-Module BitsTransfer

$totaltime=0
$i=0
$start_time = Get-Date

#Script pour DL tous les fichiers d'une URL avec incrémentation et les placer dans C:\dw\
while($i -le 1141)
{
 
    $url = "https://streamer03.myvideoplace.tv/edge/_definst_/smil:smil/archive_01/videos/01-10-19/bc2231a5ea62eb9c1917b14dd00faf7d_1569936514.smil/media_w144962242_b1200000_" + $i + ".ts"
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
