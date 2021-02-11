#SingleInstance, Force

WinActivate,ahk_exe msedge.exe
sleep 2000 
Send, ^+i
sleep 2000  
Loop 37
{
   sleep 2000  
   SendInput, {Raw} document.getElementById(%A_Index%).click();
   Send, {Enter}
   sleep 2000 
   SendInput, {Raw} function getEmails() {var search_in = document.body.innerHTML;string_context = search_in.toString();array_mails = string_context.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);return array_mails;}let emails = getEmails();copy(emails);
   Send, {Enter}
   sleep 5000 
   WinActivate, ahk_class Notepad
   Send, ^v
   Send,{Enter}
   sleep 1000 
   WinActivate,ahk_exe msedge.exe
}

