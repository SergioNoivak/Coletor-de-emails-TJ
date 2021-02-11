#SingleInstance Force
 emails := []
; [101,136] - 35
; [140,142] - 3

DecidirPagina(caso,i){

    if caso=1
        return "https://www.tjse.jus.br/tjnet/internet/exibecompetencias.wsp?TMP.CMPT=600&TMP.COMARCA=" . (100+i)
    if caso=2
        return "https://www.tjse.jus.br/tjnet/internet/exibecompetencias.wsp?TMP.CMPT=600&TMP.COMARCA=" . (139+i)
}

contador := 0
Loop % 35
{
sleep 3000 
Run , % DecidirPagina(1,A_Index)
sleep 1000 
Send, ^+i
sleep 4000 
SendInput, {Raw} function getEmails() {var search_in = document.body.innerHTML;string_context = search_in.toString();array_mails = string_context.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);return array_mails;}; let emails = getEmails(); copy(emails);  
Send, {Enter}
sleep 4000 
WinActivate, ahk_class Notepad
Send, ^v
Send,{Enter}
if (contador < 3){
    contador := contador + 1
} else{
    contador := 0
    WinClose, ahk_exe msedge.exe
}
}

WinClose, ahk_exe msedge.exe
sleep 5000 
contador := 0
 Loop % 3
{
sleep 3000 
Run , % DecidirPagina(2,A_Index)
sleep 1000 
Send, ^+i
sleep 4000 
SendInput, {Raw} function getEmails() {var search_in = document.body.innerHTML;string_context = search_in.toString();array_mails = string_context.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);return array_mails;}; let emails = getEmails(); copy(emails);  
Send, {Enter}
sleep 4000 
WinActivate, ahk_class Notepad
Send, ^v
Send,{Enter}
if (contador < 3){
    contador := contador + 1
} else{
    contador := 0
    WinClose, ahk_exe msedge.exe
}
}

Return