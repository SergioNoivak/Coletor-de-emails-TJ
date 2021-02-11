#SingleInstance, Force
n := 2
Loop % 1
{
sleep 2000 
Run, https://sistemas-internet.tjce.jus.br/internet/contatos/default.asp?cod=1
sleep 3000 
Send,^l
Send,{Tab 8}
; Send,{Down A_Index}
; Send,{Tab}
; Send,{Enter}
; sleep 2000 
; Send, ^+i
; sleep 2000 
; SendInput, {Raw} function getEmails() {var search_in = document.body.innerHTML;string_context = search_in.toString();array_mails = string_context.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);return array_mails;}let emails = getEmails();copy(emails);
; Send, {Enter}
; sleep 5000 
; WinActivate, ahk_class Notepad
; Send, ^v
; Send,{Enter}
}


