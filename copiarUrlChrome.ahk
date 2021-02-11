#SingleInstance, Force
url_num := 10
WinActivate,ahk_class Chrome_WidgetWin_1
Loop % url_num
{
    sleep 1000 
    Send, ^l
    sleep 2000 
    Send, ^c
    sleep 1000 
    WinActivate, ahk_class Notepad
    sleep 2000 
    Send, ^v
    Send,{Enter}
    WinActivate, ahk_class Chrome_WidgetWin_1
    Send, ^{Tab}
}
Return