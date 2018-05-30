#Play sound


$a = new-object –type system.media.soundplayer
$a.soundlocation = "C:\a.wav“
$a.play()