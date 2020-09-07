#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

CapsLock & 1::F1
CapsLock & 2::F2
CapsLock & 3::F3
CapsLock & 4::F4
CapsLock & 5::F5
CapsLock & 6::F6
CapsLock & 7::F7
CapsLock & 8::F8
CapsLock & 9::F9
CapsLock & 0::F10
CapsLock & -::F11
CapsLock & =::F12

CapsLock & w::Up
CapsLock & a::Left
CapsLock & s::Down
CapsLock & d::Right

CapsLock & Up::Send {Volume_Up}
CapsLock & Down::Send {Volume_Down}

; win + alt + arrows
#!Left::Send,^{PGUP}
#!Right::Send,^{PGDN}
#!UP::Send {Volume_Up}
#!Down::Send {Volume_Down}

capslock::
    send {Lalt down}{Shift}{Lalt up}
return
