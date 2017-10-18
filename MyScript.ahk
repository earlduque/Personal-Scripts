SetTitleMatchMode, 2

; Various Text Replacements
:://gliderecord::var newGR = new GlideRecord('Table_name');{Enter}newGR.addQuery('Column_name', filter_value);{Enter}newGR.query();
:://getuser::javascript:gs.getUserID()
:://getlocation::javascript:gs.getUser().getLocation()
:://getfield::javascript:gs.getUser().getRecord().getDisplayValue('column_name')
:://script:://The following was created by admin-eduque on __/__/____ in ucdavisietdev{Enter}//Description: 
::/shrug::¯\_(ツ)_/¯
::/hearteyes::😍
::/eyeroll::🙄
::/adp::Tier1=8156:7456. Tier2=9156:7456
::/maps::uuuullllll on 9/6/17
::/graphpad::login=ucdsoftware@ucdavis.edu pw=ucdTeam2013
::/esri::login=software2007 pw=UCDsoft2
::/eduroam::http://kb.ucdavis.edu/?id=2025
::/thanks::{Enter}{Enter}Thank you for contacting IT Express.{Enter}
::/leaving::http://kb.ucdavis.edu/?id=0129
::/passphrase::http://kb.ucdavis.edu/?id=0101
::/password::http://kb.ucdavis.edu/?id=0101
::/ohd::https://ucdavis.jira.com/wiki/spaces/ITX/pages/319062684/Other+Help+Desks
::/accounts::http://accounts.ucdavis.edu
::/matchmatrix::login=eduque@ucdavis.edu pw=specimen angry obsidian
::/dev::BZkKyPhdHUUG
	
	


; Control+Shift+J types my UC Davis e-mail address
^+j::
	Send, eduque@ucdavis.edu
	Return

	

	
; Control+Shift+K types my personal e-mail address
^+k::
	Send, earliodookie@gmail.com
	Return
	
	
	
	
; My Employee IDs
#+j::
	Send, 752222679
	Return
	
	

	
; windows+shift+l moves the currently selected window to my "blank space"
#+l::
	WinGetActiveTitle, Title
	WinRestore, %Title%
	WinMove, %Title%,, 1913, 171, 1094, 754
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

	
	

; Control+Shift+V Opens up a TightVNC viewer, and logs into the CCMIS
^+v::
	sleep, 300
	send, {Lwin}
	sleep, 300
	send, tightvnc viewer{Enter}
	sleep, 900
	send, {Enter}
	sleep, 500
	Send, itxvnc{Enter}
	Return

	

;doesn't allow windows+m
#m::Return 




; Control+Shift+C opens a new chrome tab and goes to a new call incident	
^+c::
	WinActivate, Google Chrome
	sleep, 300
	send, ^t
	sleep, 200
	myLink := "https://ucdavisit.service-now.com/nav_to.do?uri=%2Fincident.do%3Fsys_id%3D-1%26sysparm_query%3Dassigned_to%3Djavascript:gs.user_id()%5Eassignment_group%3D786178d950368500528ad44054e28fca"
	send, %myLink%{Enter}
	Return
	
	
	

;various table grabs in SN
#IfWinActive, ServiceNow
GetTableName(windownumpad){
	if (windownumpad = 1){
		TableName = incident.list
	} else if (windownumpad = 2){
		TableName = sys_user.list
	} else if (windownumpad = 3){
		TableName = sys_user_group.list
	} else if (windownumpad = 4){
		TableName = sc_cat_item.list
	} else if (windownumpad = 5){
		TableName = u_service_desk_emails.list
	}
	return TableName
}

SendNavAction(numpadNumber){
	send ^!f
	sleep,100
	zTableName := GetTableName(numpadNumber)
	send, %zTableName%{enter}
}

^Numpad1::
	SendNavAction(1)
	Return
^Numpad2::
	SendNavAction(2)
	Return
^Numpad3::
	SendNavAction(3)
	Return
^Numpad4::
	SendNavAction(4)
	Return
^Numpad5::
	SendNavAction(5)
	Return

^Numpad0::
	windows1 := GetTableName(1)
	windows2 := GetTableName(2)
	windows3 := GetTableName(3)
	windows4 := GetTableName(4)
	windows5 := GetTableName(5)
	WinGetActiveStats, Title, Width, Height, X, Y
	guiWidth := X
	guiHeight := Y+200
	Gui, New,,SN Tables
	gui, font, s14
	Gui, Add, Text,,numpad1. %windows1%
	Gui, Add, Text,,numpad2. %windows2%
	Gui, Add, Text,,numpad3. %windows3%
	Gui, Add, Text,,numpad4. %windows4%
	Gui, Add, Text,,numpad5. %windows5%
	Gui -Caption
	Gui, Show, X%guiWidth% Y%guiHeight%
	loop {
		if (GetKeyState("Numpad0","P")=0 && GetKeyState("Ctrl","P")=0){
			Gui Destroy
			WinActivate, %Title%
			return
		}
		sleep 500
	}
	return
	
	
	
; Control+S saves the script and if the script is in focus, reloads the script
#IfWinActive, Personal-Scripts - Microsoft Visual Studio
~^s::
	sleep 100
	reload
	return