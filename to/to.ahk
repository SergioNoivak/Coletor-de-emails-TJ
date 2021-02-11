#SingleInstance, Force
#Include sites.ahk
SendMode Input
SetWorkingDir, %A_ScriptDir%
contador := 0
Loop % emails.MaxIndex()
{
Run ,% emails[A_Index]
sleep 2000 
Send, ^+i
sleep 2000 
SendInput, {Raw} function getEmails() {var search_in = document.body.innerHTML;string_context = search_in.toString();array_mails = string_context.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);return array_mails;}let emails = getEmails();copy(emails);
Send, {Enter}
sleep 5000 
WinActivate, ahk_class Notepad
Send, ^v
Send,{Enter}
if (contador < 15){
    contador := contador + 1
} else{
    contador := 0
    WinClose, ahk_exe msedge.exe

}
}

Return












