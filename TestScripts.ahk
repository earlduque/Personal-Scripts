CoordMode, Mouse, Client


; If I'm looking at a putty window, modify the behavious or Control+C and Control+V	
;#IfWinActive, ahk_exe putty.exe

; Control+A selects all on the mothra window
^a::
	rect := WindowGetRect("AutoMothra")

	WinGetPos, X, Y, Width, Height
	WinGetActiveTitle, Title
	WinRestore, %Title%
	WinMove, %Title%,,,, 675, 425
	MouseClickDrag, Left, 1, 1, rect.width, rect.height
	NewSelectAll = %Clipboard%
	StringReplace, NewSelectAll, NewSelectAll, `r`n`r`n, `r`n, UseErrorLevel
	StringReplace, NewSelectAll, NewSelectAll, `r`n`r`n, `r`n, UseErrorLevel
	StringReplace, NewSelectAll, NewSelectAll, `r`n`r`n, `r`n, UseErrorLevel
	Clipboard = %NewSelectAll%
	WinMove, %Title%,, %X%, %Y%, %Width%, %Height%
	Return
	
	WindowGetRect(AutoMothra) {
    if hwnd := WinExist(AutoMothra) {
        VarSetCapacity(rect, 16, 0)
        DllCall("GetClientRect", "Ptr", hwnd, "Ptr", &rect)
        return {width: NumGet(rect, 8, "Int"), height: NumGet(rect, 12, "Int")}
    }
}

#+m:: ;HERE IT BOYS LET'S DO THIS
rect := WindowGetRect("AutoMothra")
MsgBox % rect.width "`n" rect.height
;WindowGetRect(AutoMothra) {
;    if hwnd := WinExist(AutoMothra) {
;        VarSetCapacity(rect, 16, 0)
;        DllCall("GetClientRect", "Ptr", hwnd, "Ptr", &rect)
;        return {width: NumGet(rect, 8, "Int"), height: NumGet(rect, 12, "Int")}
;    }
;}

















; Control+S saves the script and if the script is in focus, reloads the script
#IfWinActive, *C:\Users\eduque\OneDrive - UC Davis\Scripts\TestScripts.ahk - Notepad++
~^s::
	sleep 100
	reload
	return