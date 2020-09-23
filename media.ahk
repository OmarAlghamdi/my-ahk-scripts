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

; open powershell in the selected path
~#z::
send {F4}
send ^a
send ^c
send #x
send i
sleep 300
send cd ^v
send {enter}
