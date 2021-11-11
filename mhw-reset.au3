#cs ----------------------------------------------------------------------------
FKUSHEN LVURWRK
v2021.11.11.2330
#ce ----------------------------------------------------------------------------

;Inits
Opt("WinTitleMatchMode", 2)
Opt("SendKeyDelay", 200)
Opt("SendKeyDownDelay", 25)

;Vars
$GameWindowTitle = "MONSTER HUNTER: WORLD"
$SleepDefault = 500
$SleepBoard = 1000
$SleepAbandon = 14000
$SleepCanteen = 1500
;BEGIN

HotKeySet("{F9}", "GotoCanteen")
HotKeySet("{F10}", "PostQuest")
HotKeySet("{F11}", "RunToBoard")
HotKeySet("^{F11}", "AutoAIO")

While 1
	Sleep(100)
WEnd

;RunToBoard()
;END

Func AbandonQuest()
	WinActivate($GameWindowTitle)

	MouseMove(0, 0, 0)

	; Open Menu
	Safesend("{ESC}")
	Sleep($SleepDefault)

	; Abandon Quest
	Safesend("{RIGHT}{DOWN}")

	; Return to HQ
	Safesend("{SPACE}{SPACE}")
	Sleep($SleepDefault)

EndFunc   ;==>AbandonQuest

Func PostQuest()
	WinActivate($GameWindowTitle)

	; Open Board and get mouse out of the way
	Safesend("e")
	MouseMove(0, 0, 0)
	Sleep($SleepDefault)

	; Post New Quest and skip animation
	Safesend("{SPACE}")
	Safesend("{SHIFTDOWN}")
	Sleep($SleepBoard)
	Safesend("{SHIFTUP}")

	; Master Rank -> Events
	;Safesend("{SPACE}")
	;Safesend("{UP}{UP}{SPACE}")
	;Sleep($SleepDefault)

	; Repost is already on Events
	Safesend("{SPACE}")
	Sleep($SleepDefault)

	; The Place Where Winter Sleeps
	Safesend("{LEFT 2}{UP 4}")
	Safesend("{SPACE}")
	Sleep($SleepDefault)

	; Set Players 1 and Finish
	Safesend("{DOWN}{LEFT 3}")
	Safesend("{UP}{SPACE}")
	Sleep($SleepDefault)

	; Accept this quest
	Safesend("{SPACE}")
EndFunc   ;==>PostQuest

Func RunToBoard()
	WinActivate($GameWindowTitle)

	Safesend("{SHIFTDOWN}")

	Safesend("{a down}{w down}")
	Sleep(1300)
	Safesend("{a up}{w up}")

	Safesend("{w down}")
	Sleep(800)
	Safesend("{w up}")

	Safesend("{d down}")
	Sleep(500)
	Safesend("{d up}")

	Safesend("{SHIFTUP}")
EndFunc   ;==>RunToBoard

Func GotoCanteen()
	WinActivate($GameWindowTitle)

	Safesend("{SHIFTDOWN}")

	Safesend("{s down}")
	Sleep($SleepCanteen)
	Safesend("{s up}")
	Sleep($SleepDefault)
	Send("e")

	Safesend("{SHIFTUP}")
EndFunc   ;==>GotoCanteen

Func AutoAIO()
	AbandonQuest()
	Sleep($SleepAbandon)

	RunToBoard()
	PostQuest()

	Sleep($SleepCanteen)
	Sleep(2000)
	GotoCanteen()
EndFunc   ;==>AutoAIO

Func Safesend($inputSafesend)
	If WinActive($GameWindowTitle) Then
		Send($inputSafesend)
	EndIf
EndFunc   ;==>Safesend
