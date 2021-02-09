#SingleInstance, Force


DecidirPagina(i){
    return "https://www.tjrs.jus.br/institu/comarcas/dados_municipio.php?codigo=" . i 
}


GravarEmailsDaPagina(pagina){
    Run , % pagina
    sleep 1000 
    Send, ^+i
    sleep 2000  
    Send, {Tab 1}
    sleep 1000  
    SendInput, {Raw} copy(document.getElementsByTagName("A").length)
    Send,{Enter}
    sleep 1000  
    tamanhoLinks := Clipboard
    ColetarEmails(tamanhoLinks)
    WinClose, ahk_exe msedge.exe

}

ColetarEmails(tamanhoLinks){
    Loop %tamanhoLinks%
    {
    sleep 2000  
    SendInput, {Raw} function getEmails() {var search_in = document.body.innerHTML;string_context = search_in.toString();array_mails = string_context.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);return array_mails;};let v = document.getElementsByTagName("A"); v[%A_Index%-1].click(); 
    Send,{Enter}
    sleep 2000  
    SendInput, {Raw} let x = getEmails();let k = copy(x);
    Send,{Enter}
    sleep 2000  
    WinActivate, ahk_class Notepad
    Send, ^v
    Send, {Enter}
    sleep 1000  
    WinActivate,ahk_exe msedge.exe
    }
}


Loop 490{
      GravarEmailsDaPagina( DecidirPagina(A_Index))
}

 Return