#SingleInstance, Force
WinActivate,ahk_exe msedge.exe
sleep 2000 
Send, ^+i
sleep 2000  
SendInput, {Raw} let elemento = document.getElementById("pills-tabContent"); copy(elemento);
Send, {Enter}
sleep 5000 


