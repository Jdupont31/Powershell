
$totaltime=0
$i=0


while($i -gt 1138)
{

    $path = "https://streamer03.myvideoplace.tv/edge/_definst_/smil:smil/archive_01/videos/01-10-19/bc2231a5ea62eb9c1917b14dd00faf7d_1569936514.smil/media_w144962242_b1200000_" + $i + ".ts"

    $output =  "C:\dw\" + $i + ".ts"

    $start_time = Get-Date

    Import-Module BitsTransfer
    #Start-BitsTransfer -Source $url -Destination $output
    #OR
    Start-BitsTransfer -Source $url -Destination $output -Asynchronous

    $totaltime=$totaltime+$((Get-Date).Subtract($start_time).Seconds)

}




Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"