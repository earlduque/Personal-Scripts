SetTitleMatchMode, 2

; Various Text Replacements
:://gliderecord::var gr = new GlideRecord('Table_name');{Enter}gr.addQuery('Column_name', filter_value);{Enter}gr.query();{Enter}gr.next();
:://gliderecordw::var gr = new GlideRecord('Table_name');{Enter}gr.addQuery('Column_name', filter_value);{Enter}gr.query();{Enter}while (gr.next()){}
:://getuser::javascript:gs.getUserID()
:://getfield::javascript:gs.getUser().getRecord().getDisplayValue('column_name')
:://bgscript::findValue();{Enter}function findValue(){{}{Enter}{Enter}gs.print('Message: ' + );{Enter}{}}
:://bgscriptgr::findValue();{Enter}function findValue(){{}{Enter}{Enter}var gr = new GlideRecord('Table_name');{Enter}gr.addQuery('Column_name', filter_value);{Enter}gr.query();{Enter}gr.next();{Enter}{Enter}gs.print('Message: ' + );{Enter}{}}
:://bgscriptgrget::findValue();{Enter}function findValue(){{}{Enter}{Enter}var gr = new GlideRecord('Table_name');{Enter}gr.get('sys_id');{Enter}{Enter}{Enter}gs.print('Message: ' + );{Enter}{}}
::/shrug::¯\_(ツ)_/¯
::/hearteyes::😍
::/eyeroll::🙄
::/poop::💩
::/nerd::🤓
::/lod::ಠ_ಠ
::/tableflip::(╯°□°）╯︵ ┻━┻
::/eduroam::http://kb.ucdavis.edu/?id=2025
::/leaving::http://kb.ucdavis.edu/?id=0129
::/passphrase::http://kb.ucdavis.edu/?id=0101
::/password::http://kb.ucdavis.edu/?id=0101
::/ohd::https://ucdavis.jira.com/wiki/spaces/ITX/pages/319062684/Other+Help+Desks
::/accounts::http://accounts.ucdavis.edu
::/resume::résumé

	
	


; Control+Shift+J types my UC Davis e-mail address
^+j::
	Send, eduque@ucdavis.edu
	Return

	

	
; Control+Shift+K types my personal e-mail address
^+k::
	Send, earliodookie@gmail.com
	Return
	

	
	
	
; Windows+S opens the snipping tool and then makes it active
#s::
	sleep, 300
	send, {Lwin}
	sleep, 300
	send, snipping tool
	sleep, 300
	send, {Enter}
	sleep, 1000
	send, !n
	Return

	
	

; story ticker
$#NumpadAdd::
	WinGetTitle, OriginalWindow, A
	WinActivate, Notepad++
	Sleep, 500
	Send, ^{END}
	Send, {SHIFT}+{UP}
	Send, {SHIFT}+{UP}
	Send, {SHIFT}+{UP}
	Send, {SHIFT}+{END}
	Send, ^x
	Send, ^{HOME}
	Send, ^v
	Send, ^{END}
	Send, ^s
	WinActivate, %OriginalWindow%
	Return
$#NumpadSub::
	WinGetTitle, OriginalWindow, A
	WinActivate, Notepad++
	Sleep, 500
	Send, ^{HOME}
	Send, {SHIFT}+{DOWN}
	Send, {SHIFT}+{DOWN}
	Send, {SHIFT}+{DOWN}
	Send, {SHIFT}+{END}
	Send, ^x
	Send, ^{END}
	Send, ^v
	Send, ^{END}
	Send, ^s
	WinActivate, %OriginalWindow%
	Return
	

;open story with naming convention in dev
^!n::
	OriginalClipboard = %clipboard%
	IfNotInString, OriginalClipboard, STRY 
	{
		Return
	}
	sleep, 300
	send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}
	sleep, 1000
	send, ^c
	SecondClipboard = %clipboard%
	send, ^+n
	sleep, 300
	newLink = https://ucdavisietdev.service-now.com/nav_to.do?uri=sys_update_set.do`%3Fsys_id`%3D-1`%26sysparm_query=name=IET %OriginalClipboard% %SecondClipboard%
	send, %newLink%{Enter}
	Return



;doesn't allow windows+m
#m::Return 



	
; Control+S saves the script and if the script is in focus, reloads the script
#IfWinActive, Personal-Scripts - Microsoft Visual Studio
~^s::
	sleep 100
	reload
	return