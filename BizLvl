#IfWinActive, GTA:SA:MP
DetectHiddenWindows On

!y::
if (enable := !enable)
    setTimer, routine, -1
return

routine:
while enable
{	
	SendInput t/buy{enter}
	Sleep, 400
	SendInput {Down}{Down}{enter}
	Sleep, 400
	SendInput Ads{enter}
	Sleep, 400
}
return 
