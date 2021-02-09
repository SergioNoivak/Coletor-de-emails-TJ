#SingleInstance, Force

idsCidades := ["1", "4", "5", "6", "9", "13", "15", "17", "19", "21", "23", "24", "25", "29", "33", "35", "37", "38", "41", "42", "44", "45", "52"]
; idsCidades := ["1","4"]

pagina := "https://webapp.tjro.jus.br/rhtransparente"
Loop, % idsCidades.MaxIndex()
{
     Run , % pagina
     sleep 1000
     Send, ^+i
     sleep 2000
    ;  Send, {Tab 1}
    ;  sleep 1000
      cidade := idsCidades[A_Index]
     SendInput, {Raw} document.getElementsByName("comarcaLotacaoPredioId")[0].value = %cidade%
     Send,{Enter}
     sleep 1000
     SendInput, {Raw} document.getElementById('buscaForm').submit();
     Send,{Enter}
     sleep 1000
     SendInput, {Raw} function getEmails() {var search_in = document.body.innerHTML;string_context = search_in.toString();array_mails = string_context.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);return array_mails;};let c = getEmails(); copy(c)
     sleep 2000
     Send,{Enter}
     sleep 2000  
     WinActivate, ahk_class Notepad
     Send, ^v
     Send, {Enter}
     sleep 1000  
     WinClose, ahk_exe msedge.exe
     sleep 2000  
}