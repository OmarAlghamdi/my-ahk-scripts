global mediaState:=1
; mute on pause + left
~Pause & Left:: 
SoundSet, +1, , mute
return
; volume up on pause + up
~Pause & Up::
SoundSet +5
return
; volume down on pause + down
~Pause & Down::
SoundSet -5
return

; next media on pause + page up
~Pause & PgDn::
send {Media_Next}
return
; previous media on pause + page down
~Pause & PgUp::
send {Media_Prev}
return
; pause/resume media on pause + home
~Pause & Home::
if (mediaState==0) {
    send {Media_Stop}
    mediaState:=1
}
else if (mediaState==1) {
    send {Media_Stop}
    sleep 10
    send {Media_Play_Pause}
    mediaState:=0
}
return


; =====================
; unrelated

; snipping tool
~PrintScreen::
run, SnippingTool.exe
sleep, 300
send !n
return

;calculator
~#`::
run, % "calculator:"
return

; open powershell in the current folder
~#z::
; copy the folder path
send {F4}
send ^a
send ^c
; open powershell (user mode)
send #x
send i
sleep 300
; change directory
send cd ^v
send {enter}
return


; download from youtube as audio
~+^d::
send youtube-dl ^v 
SendInput -x --audio-format m4a --audio-quality 0 --prefer-ffmpeg
send {enter}
return