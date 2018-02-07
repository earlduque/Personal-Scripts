SetTitleMatchMode, 2

; Various Text Replacements
:://gliderecord::var newGR = new GlideRecord('Table_name');{Enter}newGR.addQuery('Column_name', filter_value);{Enter}newGR.query();{Enter}newGR.next();
:://getuser::javascript:gs.getUserID()
:://getlocation::javascript:gs.getUser().getLocation()
:://getfield::javascript:gs.getUser().getRecord().getDisplayValue('column_name')
:://script:://The following was created by admin-eduque on __/__/____ in ucdavisietdev{Enter}//Description: 
:://bgscript::findValue();{Enter}function findValue(){{}{Enter}gs.print('Message: ');{Enter}{}}
::/shrug::¯\_(ツ)_/¯
::/hearteyes::😍
::/eyeroll::🙄
::/lod::ಠ_ಠ
::/tableflip::(╯°□°）╯︵ ┻━┻
::/eduroam::http://kb.ucdavis.edu/?id=2025
::/leaving::http://kb.ucdavis.edu/?id=0129
::/passphrase::http://kb.ucdavis.edu/?id=0101
::/password::http://kb.ucdavis.edu/?id=0101
::/ohd::https://ucdavis.jira.com/wiki/spaces/ITX/pages/319062684/Other+Help+Desks
::/accounts::http://accounts.ucdavis.edu

	
	


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
	sleep, 500
	send, !n
	Return

	
	
	

;doesn't allow windows+m
#m::Return 



	
; Control+S saves the script and if the script is in focus, reloads the script
#IfWinActive, Personal-Scripts - Microsoft Visual Studio
~^s::
	sleep 100
	reload
	return