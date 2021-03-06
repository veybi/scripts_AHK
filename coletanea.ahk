; ---------------------------------
; Script access
; ---------------------------------

^!a::edit %A_ScriptName%					; Open current script in editor
^!+a::run explorer.exe %A_ScriptDir%		; Open the current script's path

GroupAdd, ThisScript, %A_ScriptName%		; Add any window containing this script's name to the group ThisScript
											; This is used in the Auto-reload on save function
; ---------------------------------
; Auto-reload on save
; ---------------------------------

; Reloads script if active window is the script editor and Ctrl-S is send

;#IfWinActive ahk_group ThisScript						; Only run if met
#IfWinActive coletanea.ahk								; Only run if met
~^s::													; Otherwise, ignore hotkey
msgbox 0, Coletanea Messages, Scrip Reloaded Successfuly, 1
Reload
Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
IfMsgBox, Yes, Edit
return
#IfWinActive

; Create routines to auto-detect computer and change/block functionalities based on what computer the script is running
<#o::
MsgBox, 0,, %A_ComputerName%, 10

return

; ==================================================================================
; GUI to list all existent Scripts
; Created by Bruno Bianchessi
; 29/06/09
; ==================================================================================
^!h::
help(){
Gui, Margin, 20, 20
Gui, Font, underline
Gui, Add, Text, cBlue gscript1, Help													Ctrl+Alt+H
Gui, Add, Text, cBlue gscript2, Paste Paint												Ctrl+Alt+P
Gui, Add, Text, cBlue gscript3, Quick Brow Fox								    			Ctrl+Alt+Q
Gui, Add, Text, cBlue gscript4, Ping external websites and Server											Ctrl+Alt+M
Gui, Add, Text, cBlue gscript5, List of phrases												Ctrl+Alt+L
Gui, Add, Text, cBlue gscript6, Paste Clipboard Content as pure text									Ctrl+Alt+L
Gui, Add, Text, cBlue gscript7, Mazimize window to both monitors								       Win+Alt+Up
Gui, Add, Text, cBlue gscript8, Open Notepad++											Ctrl+Alt+N
Gui, Add, Text, cBlue gscript12, Open Studio Code										    	Ctrl+Alt+B
Gui, Add, Text, cBlue gscript13, Open Time Tracker											    Ctrl+Alt+t
Gui, Add, Text, cBlue gscript14, Open VPN settings											    Win+v
Gui, Font
Gui, Add, Text, cBlue gscript9, Disable F1											(Always active)
Gui, Add, Text, cBlue gscript10, Disable CapsLock [shift + CapsLock is the new Caps]						(Always active)
Gui, Add, Text, cBlue gscript11, Pause/Break suspends the scripts							(Always active)
Gui, Font, norm
Gui, Show
return

script1:
MsgBox, 0,, [Dought!!!!]
return

script2:
cola_paint()
return

script3:
quick_brow_fox()
return

script4:
run_pings()
return

script5:
entretem_usuario()
return

script6:
paste_plain_text()
return

script7:
janela_max()
return

script8:
open_notepad()
return

script12:
open_studio_code()
return

script13:
open_timetracker()
return

script14:
open_vpn_settings()
return

script9:
return

script10:
return

script11:
return


}

; ==================================================================================
; Script copies the image from active window to the clipboard, opens Paint and paste
; the image there
; Created by Bruno Bianchessi
; 18/02/09
; ==================================================================================
^!p::
cola_paint(){
Sleep, 100
Send, {ALTDOWN}{PRINTSCREEN}{ALTUP}
Sleep, 100

	Run C:\WINDOWS\system32\mspaint.exe
Sleep, 100
WinWait, Untitled - Paint, 
Send, {CTRLDOWN}v{CTRLUP}
return
}

; ==================================================================================
; Script inserts a string of text. Good for testing fonts, fill paragraphs, etc.
; Created by Bruno Bianchessi
; 20/05/09
; ==================================================================================
^!q::
quick_brow_fox(){

Sleep, 100
Sendinput, The quick brown fox jumps over the lazy dog.{Space}
return
}

; ==================================================================================
; Script pings some external websites and the servidor (test internet access)
; Created by Bruno Bianchessi
; 29/12/11
; ==================================================================================
^!m::
run_pings(){

server := "fe80::f173:91ed:c9f5:c21b%6"

Run C:\WINDOWS\system32\cmd.exe 
WinWait, C:\WINDOWS\system32\cmd.exe, 
Send, cd\ {enter}
Send, cls {enter}
Send, ping -t %server%{enter}

WinGetActiveTitle, Title
WinMove,%Title%,,0,0,,

Sleep, 100

Run C:\WINDOWS\system32\cmd.exe 
WinWait, C:\WINDOWS\system32\cmd.exe, 
Send, cd\ {enter}
Send, cls {enter}
Send, ping -t www.google.com{enter}

WinGetActiveTitle, Title
WinMove,%Title%,,980,0,,

Sleep, 100

Run C:\WINDOWS\system32\cmd.exe 
WinWait, C:\WINDOWS\system32\cmd.exe, 
Send, cd\ {enter}
Send, cls {enter}
Send, ping -t www.facebook.com{enter}

WinGetActiveTitle, Title
WinMove,%Title%,,0,510,,

Sleep, 100

Run C:\WINDOWS\system32\cmd.exe 
WinWait, C:\WINDOWS\system32\cmd.exe, 
Send, cd\ {enter}
Send, cls {enter}
Send, ping -t www.yahoo.com.br{enter}

WinGetActiveTitle, Title
WinMove,%Title%,,980,510,,

return
}

; ==================================================================================
; GUI listing all existing phrases (not supported anymore, so the phrases won't be translated)
; Created by Bruno Bianchessi
; 09/05/11
; ==================================================================================
^!l::
entretem_usuario(){

frase1 = Oi, tudo bem? Eu sou um script, você quer falar comigo?
frase2 = Eu fui criado para conversar com as pessoas enquanto elas aguardam meu programador estar disponível.
frase3 = Escolha um dos seguintes temas: a) Política, b) Atualidades, c) Trivialidades ou d) Morfologia cerebral.
frase4 = Brincadeira... Ainda não sou tão avançado assim. Mas já sei contar piadas. Quer que eu conte uma?
frase5 = Ops... As piadas que eu conheço podem não ser adequadas para a sua idade. Aguarde enquanto eu questiono meu programador.

InputBox, numero_frase, Escolha a frase,1) %frase1% `n`n2) %frase2% `n`n3) %frase3% `n`n4) %frase4% `n`n5) %frase5%,, 640, 480

tempo_sleep = 10000
Sleep, 100



if numero_frase = 0
{
    	Send, %frase1% {Enter}
	Sleep, tempo_sleep
		Send, %frase2% {Enter}
	Sleep, tempo_sleep
		Send, %frase3% {Enter}
	Sleep, tempo_sleep
		Send, %frase4% {Enter}
	Sleep, tempo_sleep
		Send, %frase5% {Enter}
}		
else if numero_frase = 1
		Send, %frase1% {Enter}
else if numero_frase = 2
    	Send, %frase2% {Enter}
else if numero_frase = 3
    	Send, %frase3% {Enter}
else if numero_frase = 4
    	Send, %frase4% {Enter}
else if numero_frase = 5
    	Send, %frase5% {Enter}
else
    MsgBox, Give up eh? Your choice was: %numero_frase%

return
}

; ==================================================================================
; Turns CapsLock off, it works like a regular Shift key now.
; To toggle CapsLock, hold Shift and then press CapsLock
; Created by Bruno Bianchessi
; 19/03/11
; ==================================================================================
{
+CapsLock::CapsLock
CapsLock::Shift
return
}

; ==================================================================================
; Remap F1 key to nothing (no more annoying help windows when trying to press F2)
; Created by Bruno Bianchessi
; 25/09/18
; ==================================================================================
{
F1::return
}

; ==================================================================================
; Script that pastes the contents of the clipboard as plain text
; Created by Bruno Bianchessi
; 25/09/18
; ==================================================================================
^!v::
paste_plain_text(){

    Clip0 = %ClipBoardAll%
    ClipBoard = %ClipBoard% ; Convert to plain text
    Send ^v
    Sleep 1000
    ClipBoard = %Clip0%
    VarSetCapacity(Clip0, 0) ; Free memory
    Return
}

; ==================================================================================
; Script that maximizes the active window to both monitors (only works for a specific resolution and monitor array)
; Created by Bruno Bianchessi
; 01/28/19
; ==================================================================================
#!Up::
janela_max(){

	WinGetActiveTitle, Title
	WinMove,%Title%,,0,0,5120,1600
return
}

; ==================================================================================
; Script that assigns the SUSPEND function to the Pause/Break key. 
; Created by Bruno Bianchessi
; 18/10/18
; ==================================================================================
{
Pause::suspend
}

; ==================================================================================
; Script to open o Notepad++
; Created by Bruno Bianchessi
; 21/01/19
; ==================================================================================
^!n::
open_notepad(){
Run C:\Program Files (x86)\Notepad++\notepad++.exe
return
}

; ==================================================================================
; Script to open Studio Code
; Created by Bruno Bianchessi
; 27/05/19
; ==================================================================================
^!b::
open_studio_code(){
Run C:\Users\Bruno.Bianchessi\AppData\Local\Programs\Microsoft VS Code\Code.exe
return
}


; ==================================================================================
; Script to open Time Tracker
; Created by Bruno Bianchessi
; 28/05/19
; ==================================================================================
^!t::
open_timetracker(){
Run https://time.pensardevelopment.com/
return
}

; ==================================================================================
; Script to open VPN configurations
; Created by Bruno Bianchessi
; 28/05/19
; ==================================================================================
<#v::
open_vpn_settings(){
Run ms-settings:network-vpn
return
} 