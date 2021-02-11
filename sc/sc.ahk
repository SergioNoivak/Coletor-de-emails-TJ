#SingleInstance, Force
#Include palavras.ahk

DecidirPagina(i){
    return "http://app.tjsc.jus.br/tjsc-consulta-email/#/consultar?nome=" i 
}

GravarEmailsDaPagina(pagina){
    sleep 1000 
    Run , % pagina
    sleep 1000 
    Send, ^+i
    sleep 2000  
    ; Send, {Tab 1}
    SendInput, {Raw} function getEmails() {var search_in = document.body.innerHTML;string_context = search_in.toString();array_mails = string_context.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);return array_mails;}let emails = getEmails();copy(emails);
    Send, {Enter}
    sleep 4000 
    WinActivate, ahk_class Notepad
    Send, ^v
    Send,{Enter}


  
}
for i, word in words
{     
      pagina := DecidirPagina(word)
      GravarEmailsDaPagina(pagina)

}   