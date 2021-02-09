#SingleInstance, Force
#Include Extrator.ahk

extrator := new Extrator()
extrator.VisitarPagina()
sleep 2000  
extrator.AbrirDevTools()
sleep 2000  
extrator.PesquisarPalavra(1)
sleep 3000
extrator.ExtrairEmails()  
sleep 1000

Loop 
{       if not extrator.isPossivelAvancarPagina   
            break
        
        extrator.VerificarEhPossivelAvancarPagina()
        extrator.AvancarPagina()
        extrator.ExtrairEmails()  
        sleep 1000
}

; contador := 0

;  Loop % words.MaxIndex()
; {

; indice_word := A_Index
; sleep 1000 
; Run , "https://www.tjsp.jus.br/CanaisComunicacao/EmailsInstitucionais"
; sleep 2000 
; Send, ^+i
; isDesabilitado := false



; sleep 2000  
; word := "" . words[indice_word]
; SendInput, {Raw}  document.getElementById("NomeSetor").value = "%word%"
; Send, {Enter}
; sleep 1000 
; SendInput, {Raw}  document.getElementById("btnConsultarEmails").click()
; Send, {Enter}

; While not isDesabilitado
; {


; sleep 2000  
; SendInput, {Raw} function getEmails() {var search_in = document.body.innerHTML;string_context = search_in.toString();array_mails = string_context.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);return array_mails;}let emails = getEmails();copy(emails);
; Send, {Enter}
; sleep 5000 
; WinActivate, ahk_class Notepad
; Send, ^v
; Send,{Enter}
; sleep 1000 

; WinActivate,ahk_exe msedge.exe
; SendInput, {Raw} let nextTag = document.getElementsByClassName("next")[0]
; Send, {Enter}
; sleep 1000 
; SendInput, {Raw} copy(nextTag.classList.contains("disabled")?true:false);
; Send, {Enter}
; sleep 2000 
; isDesabilitado := Clipboard
; MsgBox, %isDesabilitado%

; sleep 1000 

; if isDesabilitado
;     break
; else{

;     SendInput, {Raw} nextTag.click();
;     Send, {Enter}
;     sleep 2000  


; }


; ; if (contador < 2){
; ;     contador := contador + 1
; ;     WinActivate,ahk_exe msedge.exe
; ; } else{
; ;     contador := 0
; ;     WinClose, ahk_exe msedge.exe
; ;     sleep 2000 
; ;     WinActivate,ahk_exe msedge.exe
; ;     sleep 1000 


; ; }


; }


; MsgBox, "fim"




; }
    