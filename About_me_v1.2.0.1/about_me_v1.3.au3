#include <Constants.au3>
#include <WinAPI.au3>

; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
; Author:         MinhHieuLe

;#RequireAdmin
;imformation
;#pragma compile(Icon, "") ;not finish
#pragma compile(FileDescription, Introduce about me)
#pragma compile(ProductName, Introducer)

#pragma compile(ProductVersion, 1)
#pragma compile(FileVersion, 1.2.0.1)
#pragma compile(LegalCopyright, © www.minhhieule.comli.com)

#NoTrayIcon
_WinAPI_ShowCursor(False)
BlockInput(1)

; Prompt the user to run the script - use a Yes/No prompt with the flag parameter set at 4 (see the help file for more details)
Local $iAnswer = MsgBox(BitOR($MB_YESNO, $MB_SYSTEMMODAL), "Introducer by MinhHieuLe", "Please keep your mouse out of screen while I am writing!")

; Check the user's answer to the prompt (see the help file for MsgBox return values)
; If "No" was clicked (7) then exit the script
If $iAnswer = 7 Then
	MsgBox($MB_SYSTEMMODAL, "Introducer by MinhHieuLe", "OK. Bye!")
	Exit
EndIf

Load_module()

Func Load_module()
	; Display a progress bar window.
	ProgressOn("Introducer by MinhHieuLe", "Uncompressing File", "0%")

	; Update the progress value of the progress bar window every second.
	For $i = 40 To 100 Step 50
		Sleep(500)
		ProgressSet($i, $i & "%")
	Next

	; Set the "subtext" and "maintext" of the progress bar window.
	ProgressSet(100, "Done", "Complete")
	Sleep(100)

	; Close the progress window.
	ProgressOff()
EndFunc



; Run Notepad
Run("notepad.exe")
; Maximise notepad
Sleep(300)
WinSetState("[ACTIVE]", "", @SW_MAXIMIZE)

; Wait for the Notepad to become active. The classname "Notepad" is monitored instead of the window title
WinWaitActive("[CLASS:Notepad]")

; Now that the Notepad window is active type some text
Send("@        @@@@@@@@@   @        @  @  @     @  @      @    @      @ @ @@@@@@@@ @       @ {ENTER}@        @           @ @    @ @  @  @@    @  @      @    @      @ @ @        @       @ {ENTER}@        @           @  @  @  @  @  @ @   @  @      @    @      @ @ @        @       @ {ENTER}@        @@@@@@@@@   @   @    @  @  @  @  @  @@@@@@@@    @@@@@@@@ @ @@@@@@@@ @       @ {ENTER}@        @           @        @  @  @   @ @  @      @    @      @ @ @        @       @ {ENTER}@        @           @        @  @  @    @@  @      @    @      @ @ @        @       @ {ENTER}@@@@@@@@ @@@@@@@@@   @        @  @  @     @  @      @    @      @ @ @@@@@@@@ @@@@@@@@@ {ENTER}")
Send("bye bye{ENTER}")
send("See you again!")
Sleep(500)
Send("+{UP 2}")
Sleep(500)

; Now quit by pressing Alt-F and then scrolling down (simulating the down arrow being pressed six times) to the Exit menu
Send("!f")
Sleep(500)
Send("{DOWN 6}{ENTER}")

; Now a screen will pop up and ask to save the changes, the classname of the window is called
; "#32770" and simulating the "TAB" key to move to the second button in which the "ENTER" is simulated to not "save the file"
WinWaitActive("[CLASS:#32770]")
Sleep(500)
Send("{TAB}{ENTER}")

; Now wait for Notepad to close before continuing
WinWaitClose("[CLASS:Notepad]")

ExitBlueScr()

Func ExitBlueScr()
        BlockInput(0)
        _WinAPI_ShowCursor(True)
        Exit
    EndFunc


