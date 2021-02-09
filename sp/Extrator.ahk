#SingleInstance, Force
#Include palavras.ahk

SendMode Input
SetWorkingDir, %A_ScriptDir%

class Extrator{
    __New(){
        this.words := DefinirPalavras()
        this.isDevToolsOpen := false
        this.isPossivelAvancarPagina := true
    }

    VisitarPagina(){
        Run , "https://www.tjsp.jus.br/CanaisComunicacao/EmailsInstitucionais"
    }

    AbrirDevTools(){
        if not this.isDevToolsOpen{
            Send, ^+i
            this.isDevToolsOpen := true
        } 
    }

    FecharDevTools(){
        if this.isDevToolsOpen{
        Send, ^+i
        this.isDevToolsOpen := false   
        }
    }

    PesquisarPalavra(indice_word){

        word := "" . this.words[indice_word]
        SendInput, {Raw}  document.getElementById("NomeSetor").value = "%word%"
        Send, {Enter}
        sleep 1000 
        SendInput, {Raw}  document.getElementById("btnConsultarEmails").click()
        Send, {Enter}

    }
    AvancarPagina(){
        if this.isPossivelAvancarPagina{
        this.AbrirDevTools()
        SendInput, {Raw} let nextTag = document.getElementsByClassName("next")[0];
        Send, {Enter}
        sleep 1000 
        SendInput, {Raw} nextTag.click()
        Send, {Enter}
        sleep 1000 
        }
    }

    VerificarEhPossivelAvancarPagina(){
        this.AbrirDevTools()
        SendInput, {Raw} let nextTag = document.getElementsByClassName("next")[0]; copy(nextTag.classList.contains("disabled")?false:true);
        Send, {Enter}
        sleep 2000 
        this.isPossivelAvancarPagina := %Clipboard%
        sleep 1000 
    }

    RetornarParaNavegador(){
        WinActivate,ahk_exe msedge.exe
    }
    ColarNotepad(){
        WinActivate, ahk_class Notepad
        Send, ^v
        Send,{Enter}
    }

    ExtrairEmails(){
      if this.isPossivelAvancarPagina{
        SendInput, {Raw} function getEmails() {var search_in = document.body.innerHTML;string_context = search_in.toString();array_mails = string_context.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);return array_mails;}let emails = getEmails();copy(emails);
        Send, {Enter}
        sleep 5000 
        this.ColarNotepad()
        sleep 1000 
        this.RetornarParaNavegador()
      }
    }
    
}