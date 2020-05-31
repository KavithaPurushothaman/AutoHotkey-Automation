#Persistent
SetTimer, DetectProcess, 500  ;Millisecond Timer
return

DetectProcess: 

; Detect hidden windows
DetectHiddenWindows, On  

; Find window titles by regex
SetTitleMatchMode, RegEx 

; Get this script's name
Script := A_ScriptName  

; Get the PID of the window with the title matching the format "*\Scriptname - AutoHotkey v*"
WinGet, PID, PID, % "i)^.+\\" Script " - AutoHotkey v.+$"

;MsgBox, % Script "'s PID is:`n" PID
 
Name = AutoHotkey.exe 
 
Flag = 0

Processes:=ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process")
for Process in Processes
	If (Process.Name=Name && Process.ProcessID<>PID)
        Flag = 1

If(flag<>0)
	sleep 1000
else
{	
	MsgBox Sample running!
	ExitApp
}