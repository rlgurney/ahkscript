{ ;~ --------------------------------------GLOBAL (MUST STAY AT TOP)-------------------------------------

#InstallKeybdHook
#InstallMouseHook
#NoEnv
#Persistent
#SingleInstance Force
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
DetectHiddenWindows, On
SendMode, Event
SetKeyDelay, -1
SetMouseDelay, -1
SetTitleMatchMode, RegEx
}

{ ;~ ---------------------------------------GLOBAL (HIGH PRIORITY)---------------------------------------

;~ **GENERAL USE** - ######COMMENT OUT WHEN DONE#######
;~ `::
	;~ Click, Left
	;~ Sleep, 100
	;~ Send, ^v{Enter}
;~ return

;~ **Reload This AHK Script**
^!r::
	KeyWait, Control, L
	KeyWait, Shift, L
	Reload
	Sleep, 1000 ; Will not trigger unless an error prevents the script reload.
	MsgBox, Script could not be reloaded. Check SciTE for necessary edits.
return

;~ **Play/Pause Media**
;~ !MButton::
	;~ Send, {Media_Play_Pause}
;~ return

;~ **Previous Media**
;~ WheelLeft::
	;~ Send, {Media_Prev}
;~ return

;~ **Next Media**
;~ WheelRight::
	;~ Send, {Media_Next}
;~ return

;~ **Volume Up**
;~ !WheelUp::
	;~ Send, {Volume_Up}
;~ return

;~ **Volume Down**
;~ !WheelDown::
	;~ Send, {Volume_Down}
;~ return

;~ **Open Firefox, Set Window Size/Position**
^!f::
	KeyWait, Control, L
	KeyWait, Alt, L
	DetectHiddenWindows, On
	Run, C:\Program Files\Mozilla Firefox - Legacy\firefox.exe
	WinWaitActive, ahk_exe firefox.exe
	Sleep, 1000
	Send, #{Numpad4 3}
return

;~ **Open main - Hydrus Client**
^!h::
	KeyWait, Control, L
	KeyWait, Shift, L
	DetectHiddenWindows, On
	Run, C:\Hydrus\[Client]\hydrus_client.exe
return

;~ **Open qBitTorrent**
^!q::
	KeyWait, Control, L
	KeyWait, Alt, L
	DetectHiddenWindows, On
	Run, C:\Program Files\qBittorrent\qbittorrent.exe
return

;~ **LP M Pwd**
^+!F6::
	KeyWait, Control, L
	KeyWait, Shift, L
	SendRaw, C0nr@d1$@Gr3@7Fu`(k
	return
}

{ ;~ -----------------------------------------ADOBE FLASH PLAYER-----------------------------------------

;~ **Close Window**
#IfWinActive Adobe Flash Player
Esc::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, !{F4}
return

;~ **Archive File in Hydrus >> Load Next File**
#IfWinActive Adobe Flash Player
^+F2::
	KeyWait, Control, L
	KeyWait, Shift, L
	WinGetActiveStats, WinTitle, WinWidth, WinHeight, WinX, WinY
	WinClose, Adobe Flash Player
	WinActivate, main - Hydrus Client ; ahk_class Qt652QWindowIcon
	Send, ^m
	Sleep, 25
	;~ Send, +{Delete}
	;~ Sleep, 25
	Send, {F7}
	Sleep, 25
	Send, {Right}
	Sleep, 25
	Send, {Enter}
	WinWaitActive, Adobe Flash Player
	WinMove, Adobe Flash Player, , %WinX%, %WinY%
return

;~ **Skip Ahead**
#IfWinActive Adobe Flash Player
^+F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^{Enter}
return

;~ **Delete File in Hydrus >> Load Next File**
#IfWinActive Adobe Flash Player
^+F7::
	KeyWait, Control, L
	KeyWait, Shift, L
	WinGetActiveStats, WinTitle, WinWidth, WinHeight, WinX, WinY
	WinClose, Adobe Flash Player
	WinActivate, main - Hydrus Client ; ahk_class Qt652QWindowIcon
	Send, ^m
	Sleep, 25
	Send, {Delete}
	Sleep, 25
	Send, {Right}
	Sleep, 25
	Send, {Enter}
	WinWaitActive, Adobe Flash Player
	WinMove, Adobe Flash Player, , %WinX%, %WinY%
return
}

{ ;~ -----------------------------------------------CHROME-----------------------------------------------

;~ **Previous Tab**
#IfWinActive ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
^+F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^{PGUP}
return

;~ **Next Tab**
#IfWinActive ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
^+F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^{PGDN}
return

;~ **Close Tab**
#IfWinActive ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
^+F7::
	Send, ^w
return

;~ **Hydrus Sheet - Archive Files >> Copy First Cell on Row >> Search for Copied Data in Hydrus**
#IfWinActive Hydrus - Google ahk_exe chrome.exe
^+F8::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	InputBox, ArchiveCount, Enter Number of Archived Files
	If ErrorLevel = 1
		{
			Exit
		}
	Send, {Home}
	Sleep, 25
	Send, {Right}%ArchiveCount%
	Sleep, 25
	Send, {Right}0{Down}
	Sleep, 25
	Send, {Home}^c
	ClipWait, 2
	WinActivate, main - Hydrus Client
	WinWaitActive, main - Hydrus Client, , 2
	IfWinNotActive, main - Hydrus Client
		Exit
	Sleep, 250
	Send, ^s
	Sleep, 100
	Send, {Tab 5}{Space}{Up}{Enter}^s
	Sleep, 100
	Send, ^v*
	Sleep, 100
	Send, {Enter}
	;~ Sleep, 50
	;~ WinActivate, Hydrus - Google ahk_exe chrome.exe
	;~ Send, {Down}
return

;~ **Hydrus Google Chrome Sheet - Copy First Cell in Row >> Load Saved Search in Hydrus >> Search for Copied Value**
#IfWinActive Hydrus - Google ahk_exe chrome.exe
^+F9::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	;~ Send, {Home}
	;~ Sleep, 25
	;~ Send, {Right}
	;~ Sleep, 25
	Send, ^c
	ClipWait, 2
	WinActivate, main - Hydrus Client ; ahk_class Qt652QWindowIcon
	WinWaitActive, main - Hydrus Client ; ahk_class Qt652QWindowIcon
	IfWinNotActive, main - Hydrus Client ; ahk_class Qt652QWindowIcon
		Exit
	Sleep, 250
	Send, ^s
	Sleep, 100
	Send, {Tab 6}{Space}{Down 3}{Enter}^s
	Sleep, 250
	Send, ^v
	Sleep, 100
	Send, {Enter}
	;~ Sleep, 50
	;~ WinActivate, Hydrus - Google ahk_exe chrome.exe
	;~ Send, {Down}
return

;~ **All Sites - Maximize / Restore Down**
#IfWinActive ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
^+F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {LWin Down}{Up}{LWin Up}
return

;~ **Reload Page (Skip Cache)**
#IfWinActive ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
^+!F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^{F5}
return

;~ **Reopen Closed Tab**
#IfWinActive ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
^+!F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^+t
return

;~ **Go to Final Tab**
#IfWinActive ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
^+!F9::
	Send, ^{9}
return

;~ **Router -- Submit Login Info**
#IfWinActive Sign in ahk_exe chrome.exe
#IfWinActive 192.168.1.1 ahk_exe chrome.exe
#IfWinActive NETGEAR Router RAX43 ahk_exe chrome.exe
^+!F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, admin{Tab}rraa5468
	Sleep, 100
	Send, {Enter}
return

;~ **Hydrus Google Chrome Sheet - Copy First Cell in Row >> Load Saved Search in Hydrus >> Search for Copied Value**
#IfWinActive Hydrus - Google ahk_exe chrome.exe
$^+!F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	Send, {Home}
	Sleep, 20
	Send, ^c
	ClipWait, 2
	Search1 := Clipboard
	Search2 := RegExReplace(Clipboard, "\s", ".")
	WinActivate, main - Hydrus Client ; ahk_class Qt652QWindowIcon
	WinWaitActive, main - Hydrus Client ; ahk_class Qt652QWindowIcon
	IfWinNotActive, main - Hydrus Client ; ahk_class Qt652QWindowIcon
		Exit
	Sleep, 100
	Send, ^s
	Sleep, 100
	Send, {Tab 5}{Space}{Up}{Enter}^s
	Sleep, 100
	Send, %Search1%+{Enter}
	Sleep, 250
	Send, %Search2%
	Sleep, 100
	Send, {Enter}
	Sleep, 250
	Send, ^m
	Sleep, 250
	Send, {F12}
return

;~ **iTunes >> Spotify - Google Sheets**
#IfWinActive iTunes >> Spotify ahk_exe chrome.exe
^+!F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	Send, {Home}
	Sleep, 100
	;~ Send, TRUE
	;~ Sleep, 100
	;~ Send, {Down}
	;~ Sleep, 100
	Send, {Right}
	Sleep, 100
	Send, ^c
	ClipWait, 2
	WinActivate, ahk_exe Spotify.exe
	Sleep, 250
	Send, ^l
	Sleep, 100
	Send, ^a
	Sleep, 200
	Send, {Delete}
	Sleep, 100
	Send, %Clipboard%
	;~ Sleep, 200
	;~ Send, {Enter}
return

;~ **Save File (CTRL+S)**  (KEEP AT BOTTOM OF ^+!F12 HOTKEY LIST)
#IfWinActive ahk_exe chrome.exe
^+!F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Click Right}
	Sleep, 500
	Send, {Down 4}
	Send, {Enter}
	WinWaitActive, Save As
	Sleep, 500
	Send, {Enter}
	;~ Sleep, 250
	;~ Send, ^w
return
}

{ ;~ -----------------------------------------------FIREFOX----------------------------------------------

	{ ;~ ---------------------------------------Website Specific (Firefox)---------------------------------------

		{ ;~ ----------------------------------------------nHentai---------------------------------------------

		;~ **Space on nHentai**
		#IfWinActive nhentai ahk_exe firefox.exe
		$Space::
			KeyWait, Control, L
			KeyWait, Shift, L
			WinGetActiveStats, nhentai, WinWide, WinHigh, WinX, WinY
			MouseGetPos, MouseX, MouseY
			TrueMoveX := WinWide - 40
			MouseMove, TrueMoveX, MouseY
			Send, {Space}
		return

		;~ **Home on nHentai**
		#IfWinActive nhentai ahk_exe firefox.exe
		$Home::
			KeyWait, Control, L
			KeyWait, Shift, L
			WinGetActiveStats, nhentai, WinWide, WinHigh, WinX, WinY
			MouseGetPos, MouseX, MouseY
			TrueMoveX := WinWide - 40
			MouseMove, TrueMoveX, MouseY
			Send, {Home}
		return

		;~ **Page Down on nHentai**
		#IfWinActive nhentai ahk_exe firefox.exe
		$PgDn::
			KeyWait, Control, L
			KeyWait, Shift, L
			WinGetActiveStats, nhentai, WinWide, WinHigh, WinX, WinY
			MouseGetPos, MouseX, MouseY
			TrueMoveX := WinWide - 40
			MouseMove, TrueMoveX, MouseY
			Send, {PgDn}
		return

		;~ **End on nHentai**
		#IfWinActive nhentai ahk_exe firefox.exe
		$End::
			KeyWait, Control, L
			KeyWait, Shift, L
			WinGetActiveStats, nhentai, WinWide, WinHigh, WinX, WinY
			MouseGetPos, MouseX, MouseY
			TrueMoveX := WinWide - 40
			MouseMove, TrueMoveX, MouseY
			Send, {End}
		return

		;~ **nHentai - Search Artist/Group + English**
		#IfWinActive nhentai ahk_exe firefox.exe
		^+!F7::
			KeyWait, Control, L
			KeyWait, Shift, L
			Clipboard =
			Send, ^l
			Sleep, 100
			Send, {Home}^{Right 4}+{End}+{Left}^c
			ClipWait, 2
			If ErrorLevel
				Exit
			Clipboard := StrReplace(Clipboard, "-", "{+}")
			Send, %Clipboard%
			Send, {Home}^{Right 3}search/?q=^{Right}{Backspace}`%3A`%22{End}{Backspace}`%22{+}Language`%3Aenglish
			Sleep, 100
			Send, {Enter}
		return

		;~ **nHentai - Bookmark Profile**
		#IfWinActive nhentai ahk_exe firefox.exe
		^+F8::
			CoordMode, Mouse, Client
			KeyWait, Control, L
			KeyWait, Shift, L
			Clipboard =
			WinGetActiveTitle, WinTitle
			MouseGetPos, MouseX, MouseY
			Send, ^l
			Sleep, 50
			Send, {Home}^{Right 7}+{End}^+{Left 2}+{Left 2}
			Send, ^c
			ClipWait, 2
			If ErrorLevel
				Exit
			Artist := Clipboard
			StringReplace, Artist, Artist, :, %A_Space%-%A_Space%
			StringReplace, Artist, Artist, <, , All
			StringReplace, Artist, Artist, >, , All
			StringReplace, Artist, Artist, ", ', All
			StringReplace, Artist, Artist, /, , All
			StringReplace, Artist, Artist, \, , All
			StringReplace, Artist, Artist, |, -, All
			StringReplace, Artist, Artist, ?, , All
			StringReplace, Artist, Artist, *, , All
			StringReplace, Artist, Artist, ., , All
			Clipboard =
			Send, ^l
			Sleep, 50
			Send, {Tab}
			Sleep, 50
			Send, ^a
			Sleep, 50
			Send, ^c
			Clipwait, 2
			If ErrorLevel
				Exit
			Send, {Tab}
			RegExMatch(Clipboard, "(\d*) [rR]esults", Results)
			Results = %Results1%
			String := StrLen(Results)
			If String = 3
				Results = %Results%
			If String = 2
				Results = 0%Results%
			If String = 1
				Results = 00%Results%
			If Results =
			{
				MsgBox, 0, Hydrus Notification, Failed To Capture Result Count, 1
				Exit
			}
			Send, ^d
			Sleep, 500
			Send, %Results% - %Artist%
			Sleep, 500
			Send, {Tab}n
			Sleep, 250
			Send, {Enter}
		return

		;~ **nHentai - Next Page**
		#IfWinActive nhentai ahk_exe firefox.exe
		^+F9::
			KeyWait, Control, L
			KeyWait, Shift, L
			Clipboard =
			Send, ^l
			Sleep, 100
			Send, ^c
			ClipWait, 1
			If ErrorLevel
				Exit
			URL := Clipboard
			If URL Contains `&page=
			{
				Clipboard =
				Send, {End}^+{Left}^c
				ClipWait, 1
				If ErrorLevel
					Exit
				Base := Clipboard
				New := (Base + 1)
				Send, %New%
				Sleep, 50
				Send, {Enter}
				Exit
			}
			Send, {End}&page=2{Enter}
		return

		;~ **nHentai - Rename qBitTorrent Directory & Begin Download**
		#IfWinActive nhentai ahk_exe firefox.exe
		^+PGUP::
			KeyWait, Control, L
			KeyWait, Shift, L
			CoordMode, Pixel, Client
			CoordMode, Mouse, Client
			Clipboard =
			WinGetActiveTitle, WinTitle
			StringTrimRight, WinTitle, WinTitle, 56
			StringReplace, WinTitle, WinTitle, :, %A_Space%-%A_Space%
			StringReplace, WinTitle, WinTitle, <, , All
			StringReplace, WinTitle, WinTitle, >, , All
			StringReplace, WinTitle, WinTitle, :, , All
			StringReplace, WinTitle, WinTitle, ", , All
			StringReplace, WinTitle, WinTitle, /, , All
			StringReplace, WinTitle, WinTitle, \, , All
			StringReplace, WinTitle, WinTitle, |, , All
			StringReplace, WinTitle, WinTitle, ?, , All
			StringReplace, WinTitle, WinTitle, *, , All
			Send, ^l
			Sleep, 100
			Send, {Tab}
			Sleep, 100
			Send, ^a
			Sleep, 100
			Send, ^c
			ClipWait, 2
			If ErrorLevel
				Exit
			Send, +{Tab}{Tab}
			RegExMatch(Clipboard, "Artists: (.*) \(", Artist)
			StringReplace, Artist1, Artist1, :, %A_Space%-%A_Space%
			StringReplace, Artist1, Artist1, <, , All
			StringReplace, Artist1, Artist1, >, , All
			StringReplace, Artist1, Artist1, :, , All
			StringReplace, Artist1, Artist1, ", , All
			StringReplace, Artist1, Artist1, /, , All
			StringReplace, Artist1, Artist1, \, , All
			StringReplace, Artist1, Artist1, |, , All
			StringReplace, Artist1, Artist1, ?, , All
			StringReplace, Artist1, Artist1, *, , All
			WinActivate, ahk_class Qt5QWindowIcon
			Click, 278, 91
			Send, {Tab 3}{Down}{Home}
			Sleep, 50
			Send, +{F10}
			Sleep, 50
			Send, {Down 3}{Enter}
			WinWaitActive, Renaming
			Send, ^a{Delete}[%Artist1%] %WinTitle%
			Sleep, 100
			Send, {Enter}
			WinWaitClose, Renaming
			Sleep, 2000
			Send, ^s
			Sleep, 100
			WinActivate, nhentai ahk_exe firefox.exe
		return

		}

	}

	{ ;~ ----------------------------------------DownThemAll----------------------------------------

		;~ **DownThemAll - Rename Active File**
		#IfWinActive DownThemAll ahk_exe firefox.exe
		F2::
			KeyWait, Control, L
			KeyWait, Shift, L
			KeyWait, Alt, L
			KeyWait, F2, L
			Person := RegExReplace(Clipboard, "^(\s*)", "")
			PersonFinal := RegExReplace(Person, "(\s*)$", "")
			Send, +{F10}
			Sleep, 100
			Send, {Down 3}{Enter}
			Sleep, 100
			Send, {Home}
		return

		;~ **Open Bookmarks, Set to Upper-Right Corner**
		#IfWinActive ahk_exe firefox.exe
		^+b::
			KeyWait, Control, L
			KeyWait, Alt, L
			KeyWait, Shift, L
			Send, ^+b
			WinWaitActive, Library ahk_exe firefox.exe
			Send, {Win Down}
			Send, {Numpad9}
			Send, {Win Up}
		return
	}

	{ ;~ ------------------------ALL WEBSITES---------------------------------

		{ ;~ ----------------------------------------------------F2---------------------------------------------------

			;~ **Hentai-Foundry - Copy Artist Name to NotePad++**
			#IfWinActive Hentai Foundry ahk_exe firefox.exe
			^+F2::
				KeyWait, Control, L
				KeyWait, Shift, L
				Clipboard =
				Send, ^l{Tab}
				Sleep, 50
				Send, ^a
				Sleep, 50
				Send, ^c
				ClipWait, 2
				If ErrorLevel = 1
					Exit
				Send, ^l
				Sleep, 50
				Send, {Tab}
				Sleep, 50
				RegExMatch(Clipboard, "Home » (.*) » Pictures", Creator)
				If ErrorLevel = 1
				{
					MsgBox, Name Not Found. Exiting Script., 1
					Exit
				}
				StringReplace, Creator1, Creator1, %A_Tab%, , All
				Clipboard = %Creator1%
				WinActivate, Notepad++
				Send, ^v{Enter}
				Sleep, 100
				WinActivate, ahk_exe firefox.exe
				;~ Send, ^w
			return

			;~ **Hydrus Google Chrome Sheet - Copy First Cell in Row >> Load Saved Search in Hydrus >> Search for Copied Value**
			#IfWinActive Hydrus - Google ahk_exe firefox.exe
			^+F2::
				KeyWait, Control, L
				KeyWait, Shift, L
				Clipboard =
				Sleep, 100
				Send, {Esc}
				Sleep, 100
				;~ Send, {Home}
				;~ Sleep, 25
				;~ Send, {Right}
				;~ Sleep, 25
				Send, ^c
				ClipWait, 2
				Sleep, 100
				Send, {Esc}
				Sleep, 100
				WinActivate, main - Hydrus Client
				WinWaitActive, main - Hydrus Client
				Send, ^s
				Sleep, 50
				Send, {Tab 6}
				Sleep, 50
				Send, {Space}
				Sleep, 50
				Send, {Down 3}
				Sleep, 50
				Send, {Enter}
				Sleep, 200
				Send, ^s
				Sleep, 50
				Send, `*^v
				Sleep, 300
				Send, +{Down 3}
				Sleep, 50
				Send, +{Enter}
				Sleep, 50
				Send, {Up}
				Sleep, 50
				Send, {Enter}
				;~ Sleep, 50
				;~ WinActivate, Hydrus - Google ahk_exe chrome.exe
				;~ Send, {Down}
			return

			;~ **Pirate Bay (Torrent Screen) - Download Torrent File**  (NEW!!!!)
			#IfWinActive download torrent ahk_exe firefox.exe
			^+F2::
				KeyWait, Control, L
				KeyWait, Shift, L
				SetDefaultMouseSpeed, 0
				CoordMode, Mouse, Client
				CoordMode, Pixel, Client
				Clipboard = ;~ Clear Clipboard
				Send, ^l
				Sleep, 50
				Send, {Home}^{Right 4}+^{Right}+{Left 2}^c
				ClipWait, , 2
				TorrentID := Clipboard
				WinGetActiveStats, WinTitle, WinWidth, WinHeight, WinX, WinY
				If WinX = -5
				{
					WinX = 0
				}
				WinX = 0
				If WinWidth > 965
				{
					BorderX1 := WinX + 145
				}
				BorderX2 := BorderX1 + 630
				ImageSearch, ProfileX, ProfileY, 0, 0, A_ScreenWidth, A_ScreenHeight, *40 C:\Dropbox\AHK\Images\TPB.png
				If ErrorLevel=1
				{
					ImageSearch, ProfileX, ProfileY, 0, 0, A_ScreenWidth, A_ScreenHeight, *40 C:\Dropbox\AHK\Images\TPB2.png
					If ErrorLevel=1
					{
						ImageSearch, ProfileX, ProfileY, 0, 0, A_ScreenWidth, A_ScreenHeight, *40 C:\Dropbox\AHK\Images\TPB3.png
						If ErrorLevel=1
						{
							MsgBox, 0, Hydrus Notification, Video Not Found, 1
							Exit
						}
					}
				}
				MouseMove, %ProfileX%, %ProfileY%
				Sleep 100
				Click
				;~ WinWaitActive, ahk_exe qbittorrent.exe
				;~ Sleep, 100
				;~ Send, {Enter}
				;~ Sleep, 50
				;~ WinActivate, ahk_exe firefox.exe
				;~ MouseMove, 300, 0, , R
				;~ Sleep, 100
				;~ Send, ^w
				;~ Sleep, 150
				;~ If WinActive("thepiratebay.org | 502:Bad gateway")
				;~ {
					;~ Send, ^{F5}
				;~ }
			return

			;~ **Pixiv - Copy Artist Name & ID to Excel**
			#IfWinActive pixiv ahk_exe firefox.exe
			^+F2::
				KeyWait, Control, L
				KeyWait, Shift, L
				Clipboard =
				WinGetActiveTitle, WinTitle
				If WinTitle Contains Profile [pixiv]
				{
					StringTrimLeft, WinTitle, WinTitle, 1
					StringTrimRight, ArtistName, WinTitle, 36
					StringLower, ArtistName, ArtistName
					Send, ^l
					Sleep, 50
					Send, {Home}^{Right 7}^+{Right}
					Sleep, 50
					Send, ^c
					ClipWait, 3
					If ErrorLevel
						Exit
				}
				If WinTitle Contains 's Works
				{
					StringTrimLeft, WinTitle, WinTitle, 1
					StringTrimRight, ArtistName, WinTitle, 51
					StringLower, ArtistName, ArtistName
					Send, ^l
					Sleep, 50
					Send, {Home}^{Right 8}^+{Right}
					Sleep, 50
					Send, ^c
					ClipWait, 3
					If ErrorLevel
						Exit
					Clipboard := RegExReplace(Clipboard, "&", "")
				}
				ArtistID := Clipboard
				WinActivate, Hydrus Artist Lists ahk_class XLMAIN
				Send, {Home}{Up}
				Sleep, 250
				Send, ^{Down}{Down}%ArtistName%
				Sleep, 250
				Send, {Tab}
				Sleep, 250
				Send, %ArtistID%
				Sleep, 250
				Send, {Tab}
				WinActivate, pixiv ahk_exe firefox.exe
			return

			;~ **Videobox - Scene List: Change Categorie(s) Listed**
			#IfWinActive Scenes With Niches: ahk_exe firefox.exe
			^+F2::
			`::
				KeyWait, Control, L
				KeyWait, Shift, L
				KeyWait, Alt, L
				Clipboard =
				Send, ^l
				Sleep, 10
				Send, ^c
				ClipWait, 1
				;~ MsgBox, , Clipboard Contents, %Clipboard%
				If ErrorLevel
					Exit
				Send, {Delete}
				EditedURL := RegExReplace(Clipboard, "category/-2", "category/2")
				EditedURL := RegExReplace(EditedURL, "/\d+/\d+", "/0/90")
				Clipboard = %EditedURL%
				Send, ^v
				Sleep, 100
				Send, {Enter}
			return

			;~ **Videobox - Parse & Download MP4**
			#IfWinActive VideoBox ahk_exe firefox.exe
			^+F2::
			`::
				SetDefaultMouseSpeed, 0
				CoordMode, Mouse, Client
				CoordMode, Pixel, Client
				KeyWait, Control, L
				KeyWait, Shift, L
				KeyWait, Alt, L
				;~ Send, ^{- 2}
				;~ Sleep, 10
				Clipboard =
				WinGetActiveTitle, WinTitle
				Send, ^0^l
				Sleep, 50
				Send, {Tab}
				Sleep, 50
				Send, ^a
				Sleep, 200
				Send, ^c
				ClipWait, 3, 1
				If ErrorLevel
					Exit
				Send, {Tab}
				Sleep, 100
				RegExMatch(WinTitle, "^(.*) - .*- VideoBox", WinTitle)
				Title := WinTitle1
				If Title =
				{
					MsgBox, 0, Hydrus Notification, Could Not Parse Page, 1
					Exit
				}
				RegExMatch(Clipboard, "Starring: (.*)`r`n", Person)
				Person := Person1
				If Person =
					Person = Uncredited
				RegExMatch(Clipboard, "Niches: (.*)\r", Tag)
				Tag := Tag1
				StringReplace, Title, Title, :, %A_Space%-%A_Space%
				StringReplace, Title, Title, <, , All
				StringReplace, Title, Title, >, , All
				StringReplace, Title, Title, :, , All
				StringReplace, Title, Title, ", , All
				StringReplace, Title, Title, /, , All
				StringReplace, Title, Title, \, , All
				StringReplace, Title, Title, |, , All
				StringReplace, Title, Title, ?, , All
				StringReplace, Title, Title, *, , All
				StringReplace, Person, Person, ++, , All
				StringReplace, Person, Person, --, , All
				StringReplace, Person, Person, `,%A_SPACE%, `}`{, All
				Person = `{%Person%`}
				StringReplace, Tag, Tag, 1080p, , All
				StringReplace, Tag, Tag, 18 Teen, , All
				StringReplace, Tag, Tag, 18+ Teen, , All
				StringReplace, Tag, Tag, All Girl, [Girls Only], All
				StringReplace, Tag, Tag, Amateur, [Amateur], All
				StringReplace, Tag, Tag, Anal, [Anal], All
				StringReplace, Tag, Tag, Asian, , All
				StringReplace, Tag, Tag, Ass to Mouth, [Ass To Mouth], All
				StringReplace, Tag, Tag, BBW, , All
				StringReplace, Tag, Tag, BDSM, [BDSM], All
				StringReplace, Tag, Tag, Babysitter, [Babysitter], All
				StringReplace, Tag, Tag, Beach, , All
				StringReplace, Tag, Tag, Big Boobs, , All
				StringReplace, Tag, Tag, Big Butt, , All
				StringReplace, Tag, Tag, Big Cock, , All
				StringReplace, Tag, Tag, Black, [Black], All
				StringReplace, Tag, Tag, Blonde, , All
				StringReplace, Tag, Tag, Blowjob, [Fellatio], All
				StringReplace, Tag, Tag, Bondage, [Bondage], All
				StringReplace, Tag, Tag, Brunette, , All
				StringReplace, Tag, Tag, CG Porn, , All
				StringReplace, Tag, Tag, Cheerleader, , All
				StringReplace, Tag, Tag, Chinese, , All
				StringReplace, Tag, Tag, Classic Porn, , All
				StringReplace, Tag, Tag, College-girl, , All
				StringReplace, Tag, Tag, Cream Pie, , All
				StringReplace, Tag, Tag, Cum Swapping, , All
				StringReplace, Tag, Tag, Cumshot, , All
				StringReplace, Tag, Tag, Cunnilingus, , All
				StringReplace, Tag, Tag, DP, [Double Penetration], All
				StringReplace, Tag, Tag, Double Anal, [Double Anal], All
				StringReplace, Tag, Tag, Electro Pussy, , All
				StringReplace, Tag, Tag, Enema, , All
				StringReplace, Tag, Tag, Extras, , All
				StringReplace, Tag, Tag, Facials, , All
				StringReplace, Tag, Tag, Feature, , All
				StringReplace, Tag, Tag, Femdom, , All
				StringReplace, Tag, Tag, Fetish, , All
				StringReplace, Tag, Tag, Fisting, [Fisting], All
				StringReplace, Tag, Tag, GILF, , All
				StringReplace, Tag, Tag, Gangbang, [Gangbang], All
				StringReplace, Tag, Tag, Gaping, , All
				StringReplace, Tag, Tag, Gonzo, , All
				StringReplace, Tag, Tag, Group Sex, , All
				StringReplace, Tag, Tag, HD, , All
				StringReplace, Tag, Tag, Hairy, , All
				StringReplace, Tag, Tag, Handjob, , All
				StringReplace, Tag, Tag, Hentai, , All
				StringReplace, Tag, Tag, Housewife, , All
				StringReplace, Tag, Tag, Indian, , All
				StringReplace, Tag, Tag, Interracial, [Interracial], All
				StringReplace, Tag, Tag, Japanese, , All
				StringReplace, Tag, Tag, Latex, [Latex], All
				StringReplace, Tag, Tag, Latinas, , All
				StringReplace, Tag, Tag, Leather, , All
				StringReplace, Tag, Tag, Legs and Feet, , All
				StringReplace, Tag, Tag, Lesbian, , All
				StringReplace, Tag, Tag, Location, , All
				StringReplace, Tag, Tag, MFF, , All
				StringReplace, Tag, Tag, MILF, , All
				StringReplace, Tag, Tag, MMF, , All
				StringReplace, Tag, Tag, Machine, [Machine], All
				StringReplace, Tag, Tag, Male Dominant, [Male Dominant], All
				StringReplace, Tag, Tag, Mardi Gras, , All
				StringReplace, Tag, Tag, Masturbation, [Masturbation], All
				StringReplace, Tag, Tag, Middle Eastern, , All
				StringReplace, Tag, Tag, Midgets, , All
				StringReplace, Tag, Tag, Nurse, , All
				StringReplace, Tag, Tag, Office, , All
				StringReplace, Tag, Tag, Older Men, , All
				StringReplace, Tag, Tag, One-on-One, , All
				StringReplace, Tag, Tag, Oral, , All
				StringReplace, Tag, Tag, Outdoors, , All
				StringReplace, Tag, Tag, POV, , All
				StringReplace, Tag, Tag, Petite, , All
				StringReplace, Tag, Tag, Pool, , All
				StringReplace, Tag, Tag, Pregnant, , All
				StringReplace, Tag, Tag, Prison, , All
				StringReplace, Tag, Tag, Public, , All
				StringReplace, Tag, Tag, Redhead, [Redhead], All
				StringReplace, Tag, Tag, Rimming, , All
				StringReplace, Tag, Tag, Roleplay, , All
				StringReplace, Tag, Tag, Ropes, [Shibari], All
				StringReplace, Tag, Tag, Rough Sex, , All
				StringReplace, Tag, Tag, Schoolgirl, , All
				StringReplace, Tag, Tag, Shower, , All
				StringReplace, Tag, Tag, Sixty-nine, , All
				StringReplace, Tag, Tag, Small Tits, , All
				StringReplace, Tag, Tag, Spanking, [Spanking], All
				StringReplace, Tag, Tag, Squirting, , All
				StringReplace, Tag, Tag, Stocking, , All
				StringReplace, Tag, Tag, Straight Sex, , All
				StringReplace, Tag, Tag, Strap-On, [Strap-On], All
				StringReplace, Tag, Tag, Stripper, , All
				StringReplace, Tag, Tag, Swallowing, , All
				StringReplace, Tag, Tag, Tattooed, , All
				StringReplace, Tag, Tag, Teacher, , All
				StringReplace, Tag, Tag, Threesome, , All
				StringReplace, Tag, Tag, Tit Fucking, , All
				StringReplace, Tag, Tag, Toys, , All
				StringReplace, Tag, Tag, Transsexual, [Transsexual], All
				StringReplace, Tag, Tag, Twins, , All
				StringReplace, Tag, Tag, Wood, , All
				StringReplace, Tag, Tag, `,%A_Space%, , All
				ImageSearch, ProfileX, ProfileY, 0, 0, 2560, 1440, *60 C:\Dropbox\AHK\Images\MP41080.png
				If ErrorLevel=1
				{
					ImageSearch, ProfileX, ProfileY, 0, 0, 2560, 1440, *60 C:\Dropbox\AHK\Images\MP410802.png
					If ErrorLevel=1
					{
						ImageSearch, ProfileX, ProfileY, 0, 0, 2560, 1440, *30 C:\Dropbox\AHK\Images\MP4720.png
						If ErrorLevel=1
						{
							ImageSearch, ProfileX, ProfileY, 0, 0, 2560, 1440, *30 C:\Dropbox\AHK\Images\H264HD.png
							If ErrorLevel=1
							{
								ImageSearch, ProfileX, ProfileY, 0, 0, 2560, 1440, *30 C:\Dropbox\AHK\Images\H264L.png
								If ErrorLevel=1
								{
									ImageSearch, ProfileX, ProfileY, 0, 0, 2560, 1440, *30 C:\Dropbox\AHK\Images\H264L2.png
									If ErrorLevel=1
									{
										MsgBox, 0, Hydrus Notification, Link Not Found, 1
										Exit
									}
								}
							}
						}
					}
				}
				Clipboard = %Title%%Person%%Tag%.mp4
				MouseGetPos, MouseX, MouseY
				MouseMove, %ProfileX%, %ProfileY%
				;~ Sleep 100
				Send, ^{F1}
				IfWinNotExist, DownThemAll
				{
					WinWaitActive, Add Downloads
					Sleep, 250
					Send, {Tab}^v
					Sleep, 250
					Send, {Tab 4}*refer*\*name*.*ext*{Tab}{Space}
					Sleep, 100
					Send, {Enter}
					WinWaitClose, Add Downloads
					WinActivate, %WinTitle% ahk_exe firefox.exe
					Sleep, 100
					WinActivate, DownThemAll
					WinWaitActive, DownThemAll
					Sleep, 100
					Send, #{Numpad3}
					Sleep, 100
					WinActivate, %WinTitle% ahk_exe firefox.exe
				}
				else
				{
					WinWaitActive, Add Downloads
					Sleep, 250
					Send, {Tab}^v
					Sleep, 250
					Send, {Tab 4}*refer*\*name*.*ext*{Tab}{Space}
					Sleep, 100
					Send, {Enter}
					WinWaitClose, Add Downloads
					WinActivate, %WinTitle% ahk_exe firefox.exe
				}
				Clipboard =
				ImageSearch, VBStarringX, VBStarringY, 0, 0, 2560, 1440, *60 C:\Dropbox\AHK\Images\Starring.png
				If ErrorLevel
					{
						MouseMove, %MouseX%, %MouseY%
						;~ Send, ^{+ 2}
						;~ Sleep, 10
						Exit
					}
				VBStarringX2 := VBStarringX + 60
				MouseMove, %VBStarringX2%, %VBStarringY%, 0
				;~ Send, ^{+ 2}
				;~ Sleep, 10
			return

				;~ **Save File - General**
			#IfWinActive, ahk_exe firefox.exe
			^+F2::
				KeyWait, Control, LAlt
				KeyWait, Shift, LAlt
				Click, Right
				Sleep, 250
				Send, v
				Sleep, 500
				WinWaitActive, ahk_class #32770, , 5
				Sleep, 1000
				ControlSend, Edit1, {Enter}, ahk_class #32770
				Sleep, 500
				IfWinActive, Confirm Save As ahk_exe firefox.exe
					{
						Send, n
						Sleep, 500
						Send, {Esc}
					}
			return


		}

		{ ;~ ----------------------------------------------------F3---------------------------------------------------

			;~ **DownThemAll - Add Artist Name (Clipboard) to Bottom-Most File**
			#IfWinActive DownThemAll ahk_exe firefox.exe
			^+!F3::
				KeyWait, Control, L
				KeyWait, Shift, L
				KeyWait, Alt, L
				KeyWait, F2, L
				If Clipboard =
				{
					MsgBox, 0, Hydrus Notification, Clipboard Is Empty, 1
					Exit
				}
				Person := RegExReplace(Clipboard, "^(\s*)", "")
				PersonFinal := RegExReplace(Person, "(\s*)$", "")
				Send, {End}
				Sleep, 100
				Send, +{F10}
				Sleep, 100
				Send, {Down 3}{Enter}
				Sleep, 100
				Clipboard =
				Send, ^c
				ClipWait, 3
				If ErrorLevel
					Exit
				FoundPos := RegExMatch(Clipboard, "\}")
				Send, {Home}
				Sleep, 100
				Send, {Right %FoundPos% + 1}{{}%PersonFinal%{}}
				Sleep, 50
				Send, {Enter}
				WinActivate, .*VideoBox ahk_exe firefox.exe
			return

			;~ **General - Previous Tab & Check for Errors**
			#IfWinActive Mozilla Firefox ahk_exe firefox.exe
			^+F3::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, ^{PGUP}
				;~ Sleep, 250
				;~ IfWinActive, 502: Bad gateway
					;~ Send, ^{F5}
				;~ IfWinActive, 503
					;~ Send, ^{F5}
				;~ IfWinActive, 429 Too Many Requests
					;~ Send, ^{F5}
			return
		}

		{ ;~ ----------------------------------------------------F4---------------------------------------------------

			;~ **DownThemAll - Replace ALL Performer Names In Bottom-Most Download**
			#IfWinActive DownThemAll ahk_exe firefox.exe
			^+!F4::
				KeyWait, Control, L
				KeyWait, Shift, L
				KeyWait, Alt, L
				KeyWait, F2, L
				If Clipboard =
					{
						MsgBox, 0, Hydrus Notification, Clipboard Is Empty, 1
						Exit
					}
				Person := RegExReplace(Clipboard, "^(\s*)", "")
				PersonFinal := RegExReplace(Person, "(\s*)$", "")
				Send, {End}
				Sleep, 100
				Send, +{F10}
				Sleep, 100
				Send, {Down 3}{Enter}
				Sleep, 100
				Clipboard =
				Send, ^c
				ClipWait, 3
				If ErrorLevel
					Exit
				NewString := RegExReplace(Clipboard, "\{(.*)\}", "{}")
				StringReplace, FinalString, NewString, {}, {%PersonFinal%}
				Send, ^a{Delete}
				SendRaw, %FinalString%
				Sleep, 100
				Send, {Enter}
				WinActivate, .*VideoBox ahk_exe firefox.exe
			return

			;~ **General - Next Tab & Check for Errors**
			#IfWinActive ahk_exe firefox.exe
			^+F4::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, ^{PGDN}
			return
		}

		{ ;~ ----------------------------------------------------F7---------------------------------------------------

			;~ **Pirate Bay (Torrent Screen) - Download Torrent File**  (NEW!!!!)
			#IfWinActive download torrent ahk_exe firefox.exe
			^+!F7::
				KeyWait, Control, L
				KeyWait, Shift, L
				SetDefaultMouseSpeed, 0
				CoordMode, Mouse, Client
				CoordMode, Pixel, Client
				Clipboard = ;~ Clear Clipboard
				Send, ^l ;~ Move Cursor to URL
				Sleep, 50
				Send, {Home}^{Right 4}+^{Right}+{Left 2}^c ;~ Copy Torrent ID# To Clipboard
				ClipWait, , 2 ;~ Wait until Clipboard has Content
				TorrentID := Clipboard
				WinGetActiveStats, WinTitle, WinWidth, WinHeight, WinX, WinY
				If WinX = -5
				{
					WinX = 0
				}
				WinX = 0
				If WinWidth > 965
				{
					BorderX1 := WinX + 145
				}
				BorderX2 := BorderX1 + 630
				ImageSearch, ProfileX, ProfileY, 0, 0, A_ScreenWidth, A_ScreenHeight, *40 C:\Dropbox\AHK\Images\TPB.png
				If ErrorLevel=1
				{
					ImageSearch, ProfileX, ProfileY, 0, 0, A_ScreenWidth, A_ScreenHeight, *40 C:\Dropbox\AHK\Images\TPB2.png
					If ErrorLevel=1
					{
						ImageSearch, ProfileX, ProfileY, 0, 0, A_ScreenWidth, A_ScreenHeight, *40 C:\Dropbox\AHK\Images\TPB3.png
						If ErrorLevel=1
						{
							MsgBox, 0, Hydrus Notification, Video Not Found, 1
							Exit
						}
					}
				}
				MouseMove, %ProfileX%, %ProfileY%
				Sleep 100
				Click
				WinWaitActive, ahk_exe qbittorrent.exe
				Sleep, 100
				Send, {Enter}
				Sleep, 50
				WinActivate, ahk_exe firefox.exe
				MouseMove, 300, 0, , R
				Sleep, 100
				Send, ^w
				Sleep, 150
				If WinActive("thepiratebay.org | 502:Bad gateway")
				{
					Send, ^{F5}
				}
			return

			;~ **General - Toggle Link Visited Status**
			#IfWinActive ahk_exe firefox.exe
			^+!F7::
				KeyWait, Control, L
				KeyWait, Alt
				KeyWait, Shift, L
				Click, Right
				Sleep, 50
				Send, {Up 6}
				Sleep, 50
				Send, {Right}
				Sleep, 50
				Send, {Enter}
			return
		}

		{ ;~ ----------------------------------------------------F8---------------------------------------------------

			;~ **Google Image Search Clipboard Contents**
			#IfWinActive - TPB ahk_exe firefox.exe
			`::
			^+F8::
				KeyWait, Control, L
				KeyWait, Shift, L
				Clipboard =
				Send, ^a
				Sleep, 100
				Send, ^c
				ClipWait, 2
				Send, ^l{Tab}
				RegExMatch(Clipboard, "Audio Video Applications Games Porn Other\r\n(.*)\r\n\r\nType:", SearchTerms)
				Send, ^t
				Sleep, 250
				Send, https://www.google.com/search?tbm=isch`&q=%SearchTerms1%
				Sleep, 250
				Send, {Enter}
				Sleep, 250
				Send, ^{PgUp 2}
			return

			;~ **Reddit - Upvote**
			;~ #IfWinActive reddit ahk_exe firefox.exe
			;~ ^+F8::
				;~ KeyWait, Control, L
				;~ KeyWait, Shift, L
				;~ KeyWait, Alt, L
				;~ Send, a
				;~ KeyWait, Control, L
				;~ KeyWait, Shift, L
				;~ KeyWait, Alt, L
			;~ return
		}

		{ ;~ ----------------------------------------------------F9---------------------------------------------------

			;~ **Reddit - Downvote**
			;~ #IfWinActive reddit ahk_exe firefox.exe
			;~ ^+F9::
				;~ KeyWait, Control, L
				;~ KeyWait, Shift, L
				;~ KeyWait, Alt, L
				;~ Send, z
				;~ KeyWait, Control, L
				;~ KeyWait, Shift, L
				;~ KeyWait, Alt, L
			;~ return

			;~ **General - Far-Right Tab**
			#IfWinActive Mozilla Firefox ahk_exe firefox.exe
			^+!F9::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, ^9
				Sleep, 250
				IfWinActive, 502: Bad gateway
					Send, ^{F5}
				IfWinActive, 503
					Send, ^{F5}
			return
		}

		{ ;~ ---------------------------------------------------F12---------------------------------------------------

			;~ **General - Maximize / Restore Down**
			#IfWinActive ahk_exe firefox.exe
			^+F12::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, {LWin Down}{Up}{LWin Up}
			return

		}

		{ ;~ ---------------------------------------------------F13---------------------------------------------------

			;~ **General - Refresh Page**
			#IfWinActive ahk_exe firefox.exe
			^+!F3::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, ^{F5}
			return

		}

		{ ;~ ---------------------------------------------------F4---------------------------------------------------

			;~ **General - Reopen Open Closed Tab**
			#IfWinActive ahk_exe firefox.exe
			^+!F4::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, ^+t
			return
		}

		{ ;~ ---------------------------------------------------F15---------------------------------------------------

			;~ **General - Alt+Tab**
			#IfWinActive ahk_exe firefox.exe
			^+F5::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, !{Tab}
			return
		}

		{ ;~ ---------------------------------------------------F16---------------------------------------------------

			;~ **General - Left Mouse Click**
			#IfWinActive ahk_exe firefox.exe
			^+F6::
				KeyWait, Control, L
				KeyWait, Shift, L
				Click
			return
		}

		{ ;~ ---------------------------------------------------F7---------------------------------------------------

			;~ **General - Close Tab & Check for Errors**
			#IfWinActive ahk_exe firefox.exe
			^+F7::
				KeyWait, Control, L
				KeyWait, Shift, L
				KeyWait, Alt, L
				Send, ^w
				Sleep, 100
				;~ IfWinActive, 502: Bad gateway
					;~ Send, ^{F5}
				;~ IfWinActive, 503
					;~ Send, ^{F5}
				;~ IfWinActive, 429 Too Many Requests
					;~ Send, ^{F5}
				KeyWait, Control, L
				KeyWait, Shift, L
				KeyWait, Alt, L
			return
		}

		{ ;~ ---------------------------------------------------F8---------------------------------------------------

			;~ **VideoBox - Copy Name to DownThemAll, Replace In Bottom-most File**
			#IfWinActive VideoBox ahk_exe firefox.exe
			^+!F8::
				KeyWait, Control, L
				KeyWait, Shift, L
				KeyWait, LButton, L
				CoordMode, Pixel, Client
				Clipboard =
				Send, ^c
				ClipWait, 1
				If ErrorLevel = 1
					{
						Exit
					}
				WinActivate, DownThemAll!
				WinWaitActive, DownThemAll!
				Sleep, 100
				Send, Click, 200, 100
				Sleep, 100
				Person := RegExReplace(Clipboard, "^(\s*)", "")
				PersonFinal := RegExReplace(Person, "(\s*)$", "")
				Send, {End}
				Sleep, 100
				Send, +{F10}
				Sleep, 100
				Send, {Down 3}{Enter}
				Sleep, 100
				Clipboard =
				Send, ^c
				ClipWait, 3
				If ErrorLevel
					Exit
				NewString := RegExReplace(Clipboard, "\{(.*)\}", "{}")
				StringReplace, FinalString, NewString, {}, {%PersonFinal%}
				Send, ^a{Delete}
				SendRaw, %FinalString%
				Sleep, 100
				Send, {Enter}
				WinActivate, .*VideoBox ahk_exe firefox.exe
			return

			;~ **Add-ons Manager - Copy Clipboard to Add-ons Manager screen, Adding "--" Prefix and Suffix**
			#IfWinActive Add-ons Manager ahk_exe firefox.exe
			^+F18::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, %CLIPBOARD%{Tab}--%CLIPBOARD%--{Tab}{Space}{Tab 4}{Space}
			return

			;~ **Hentai-Foundry - Bookmark Page**
			#IfWinActive Hentai Foundry ahk_exe firefox.exe
			^+F8::
				KeyWait, Control, L
				KeyWait, Shift, L
				Clipboard =
				Send, ^l
				Sleep, 100
				Send, {Tab}
				Sleep, 100
				Send, ^a
				Sleep, 100
				Send, ^c
				ClipWait, 2
				If ErrorLevel = 1
					Exit
				Send, ^l
				Sleep, 100
				Send, {Tab}
				RegExMatch(Clipboard, "» (.*) »", Creator)
				If ErrorLevel = 1
				{
					MsgBox, 0, Hydrus Notification, Creator Name Not Found. Exiting Script., 1
					Exit
				}
				Send, ^d
				Sleep, 250
				Send, %Creator1%
				Sleep, 300
				Send, {Tab}
				Sleep, 300
				Send, h
				Sleep, 250
				Send, {Enter}
			return

			;~ **Kink - Bookmark Profile**
			#IfWinActive on Kink | Watch ahk_exe firefox.exe
			^+F8::
				KeyWait, Control, L
				KeyWait, Shift, L
				Clipboard =
				WinGetActiveTitle, WinTitle
				Artist := RegExReplace(WinTitle, "\son Kink.*", "")
				StringReplace, Artist, Artist, :, %A_Space%-%A_Space%
				StringReplace, Artist, Artist, <, , All
				StringReplace, Artist, Artist, >, , All
				StringReplace, Artist, Artist, ", ', All
				StringReplace, Artist, Artist, /, , All
				StringReplace, Artist, Artist, \, , All
				StringReplace, Artist, Artist, |, -, All
				StringReplace, Artist, Artist, ?, , All
				StringReplace, Artist, Artist, *, , All
				StringReplace, Artist, Artist, ., , All
				Clipboard =
				Send, ^d
				Sleep, 500
				Send, %Artist%
				Sleep, 500
				Send, {Tab}k
				Sleep, 250
				Send, {Enter}
			return

			;~ **Pirate Bay - Open Image Links In New Window (Drag-Select)** ----ORIGINAL----
			;~ #IfWinActive TPB ahk_exe firefox.exe
			;~ ^+F8::
				;~ PLACEHOLDER, PART OF MULTI-TRIGGER HOTKEY (SEARCH FOR "^+F8::" TO LOCATE)

			;~ **Pixiv - Bookmark Profile**
			#IfWinActive pixiv ahk_exe firefox.exe
			^+F8::
				Send, ^d
				Sleep, 1000
				Send, {Tab}p
				Sleep, 250
				Send, {Enter}
			return

			;~ **VideoBox - Bookmark Profile OR Open First Actress In Tab (VideoBox Profiles)**
			#IfWinActive VideoBox ahk_exe firefox.exe
			^+F8::
				KeyWait, Control, L
				KeyWait, Shift, L
				WinGetActiveTitle, WinTitle
				GetSceneCount:
				Clipboard =
				Scenes =
				Person =
				Send, ^l
				Sleep, 250
				Send, {Tab}
				Sleep, 250
				Send, ^a
				Sleep, 250
				Send, ^c
				Clipwait, 2
				If ErrorLevel
					Exit
				Send, {Tab}
				RegExMatch(Clipboard, "m) with star: '(.*)'$", Person)
				RegExMatch(Clipboard, "m)^(\d*) Most Popular Scenes", Scenes)
				SceneCount := Scenes1
				If InStr(SceneCount, "Most Popular Scenes")
				{
					Goto GetSceneCount
					Exit
				}
				String := StrLen(SceneCount)
				If String = 3
					SceneCount = %SceneCount%
				If String = 2
					SceneCount = 0%SceneCount%
				If String = 1
					SceneCount = 00%SceneCount%
				If String =
				{
					MsgBox, 0, Hydrus Notification, Failed To Capture Scene Count, 1
					Exit
				}
				Send, ^d
				Sleep, 500
				Send, %SceneCount% - %Person1%
				Sleep, 500
				Send, {Tab}v
				Sleep, 500
				Send, {Enter}
			return
		}

		{ 	;~ ---------------------------------------------------F9---------------------------------------------------

			;~ **Add-ons Manager - Copy Clipboard to Add-ons Manager screen, Adding "++" Prefix and Suffix**
			#IfWinActive Add-ons Manager ahk_exe firefox.exe
			^+F9::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, %CLIPBOARD%{Tab}++%CLIPBOARD%++{Tab}{Space}{Tab 4}{Space}
			return



			;~ **Kink - Next Page**
			#IfWinActive on Kink ahk_exe firefox.exe
			^+F9::
				KeyWait, Control, L
				KeyWait, Shift, L
				Clipboard =
				Send, ^l
				Sleep, 100
				Send, {End}^+{Left}
				Sleep, 50
				Send, ^c
				ClipWait, 2
				NewPage := (Clipboard + 1)
				Send, %NewPage%
				Sleep, 100
				Send, {Enter}
			return

			;~ **LuxureTV - Next Page**
			#IfWinActive LuxureTV ahk_exe firefox.exe
			^+F9::
				KeyWait, Control, L
				KeyWait, Shift, L
				Clipboard =
				Send, ^l
				Sleep, 100
				Send, ^a^c
				ClipWait, 2
				If ErrorLevel
					Exit
				StringPos := RegExMatch(Clipboard, "page\d+\.html")
				If StringPos = 0
				{
					Send, ^l
					Sleep, 100
					Send, {End}page2.html
					Send, {Enter}
					Exit
				}
				Else
				{
					RegExMatch(Clipboard, "/page(\d+)\.html", Page)
					NewPage := (Page1 + 1)
					Send, {End}^+{Left 2}
					Sleep, 100
					Send, {Delete}
					Sleep, 100
					Send, page%NewPage%.html
					Sleep, 100
					Send, {Enter}
					Exit
				}
			return

			;~ **Pirate Bay (Search Result) - Next Page (One of Several)**
			#IfWinActive - TPB ahk_exe firefox.exe
			^+F9::
				KeyWait, Control, L
				KeyWait, Shift, L
				Clipboard =
				Send, ^l
				Sleep, 100
				Send, ^a^c
				ClipWait, 3
				If ErrorLevel
					Exit
				If Clipboard Contains browse/500/0/7/0
				{
					Clipboard =
					Send, ^a
					Sleep, 100
					Send, {Delete}
					Sleep, 100
					Send, https://thepiratebay.org/browse/500/1/7
					Sleep, 100
					Send, {Enter}
					Exit
				}
				If Clipboard Contains thepiratebay.org/user/
				{
					Clipboard =
					Send, {Home}^{Right 5}^+{Right}+{Left}
					Sleep, 100
					Send, ^c
					ClipWait, 3
					If ErrorLevel
						Exit
					Base := Clipboard
					New := (Base + 1)
					Send, %New%
					Sleep, 100
					Send, {Enter}
					Exit
				}
				If Clipboard Contains /7/500
				{
					Clipboard =
					Send, {End}^{Left 3}+^{Right}+{Left}
					Sleep, 250
					Send, ^c
					ClipWait, 3
					If ErrorLevel
						Exit
					Base := Clipboard
					New := (Base + 1)
					Send, %New%
					Sleep, 100
					Send, {Enter}
					Exit
				}
				Clipboard =
				Send, ^l{End}^{Left}{Left}^+{Left}^c
				ClipWait, 5
				If ErrorLevel
					Exit
				Base := Clipboard
				New := (Base + 1)
				Send, %New%{Enter}
			return

			;~ **Pirate Bay (Search Result) - Next Page (One of Several)**
			#IfWinActive Pirate Bay ahk_exe firefox.exe
			^+F9::
				KeyWait, Control, L
				KeyWait, Shift, L?
				Clipboard =
				Send, ^l
				Sleep, 100
				Send, ^a^c
				ClipWait, 3
				If ErrorLevel
					Exit
				If Clipboard Contains browse/500/0/7/0
				{
					Clipboard =
					Send, ^a
					Sleep, 100
					Send, {Delete}
					Sleep, 100
					Send, https://thepiratebay.org/browse/500/1/7
					Sleep, 100
					Send, {Enter}
					Exit
				}
				If Clipboard Contains thepiratebay.org/user/
				{
					Clipboard =
					Send, {Home}^{Right 5}^+{Right}+{Left}
					Sleep, 100
					Send, ^c
					ClipWait, 3
					If ErrorLevel
						Exit
					Base := Clipboard
					New := (Base + 1)
					Send, %New%
					Sleep, 100
					Send, {Enter}
					Exit
				}
				If Clipboard Contains /7/500
				{
					Clipboard =
					Send, {End}^{Left 3}+^{Right}+{Left}
					Sleep, 250
					Send, ^c
					ClipWait, 3
					If ErrorLevel
						Exit
					Base := Clipboard
					New := (Base + 1)
					Send, %New%
					Sleep, 100
					Send, {Enter}
					Exit
				}
				If Clipboard Contains /99/500
				{
					Clipboard =
					Send, {End}^{Left 3}+^{Right}+{Left}
					Sleep, 250
					Send, ^c
					ClipWait, 3
					If ErrorLevel
						Exit
					Base := Clipboard
					New := (Base + 1)
					Send, %New%
					Sleep, 100
					Send, {Enter}
					Exit
				}
				Clipboard =
				Send, ^l{End}^{Left}{Left}^+{Left}^c
				ClipWait, 5
				If ErrorLevel
					Exit
				Base := Clipboard
				New := (Base + 1)
				Send, %New%{Enter}
			return

			;~ **Rule34Hentai - Next Page**
			#IfWinActive Rule34Hentai ahk_exe firefox.exe
			^+F9::
				KeyWait, Control, L
				KeyWait, Shift, L
				Clipboard =
				Send, ^l
				Sleep, 100
				Send, {End}^+{Left}^c
				ClipWait, 5
				If ErrorLevel
					Exit
				Base := Clipboard
				New := (Base + 1)
				Send, %New%
				Sleep, 50
				Send, {Enter}
			return

			;~ **VideoBox - Toggle Anal Inclusion in URL**
			#IfWinActive VideoBox ahk_exe firefox.exe
			^+F9::
				KeyWait, Control, L
				KeyWait, Shift, L
				Clipboard =
				Send, ^l
				Sleep, 10
				Send, ^c
				ClipWait, 1
				If ErrorLevel
					Exit
				Clipboard =
				Send, ^l{End}^{Left 2}
				Send, ^+{Right}+{Left}
				Send, ^c
				ClipWait, 2
				If ErrorLevel
					Exit
				Base := Clipboard
				New := (Base + 1)
				Send, %New%
				Sleep, 50
				Send, {Enter}
			return

			;~ **General - KEEP AT END OF F12 LIST - Activate DownThemAll Fast Button** KEEP AT END OF F12 LIST
			;~ #IfWinActive ahk_exe firefox.exe
			;~ ^+!F12::
			;~ ^+F5::
				;~ KeyWait, Control, L
				;~ KeyWait, Shift, L
				;~ SetDefaultMouseSpeed, 0
				;~ CoordMode, Mouse, Client
				;~ CoordMode, Pixel, Client
				;~ MouseGetPos, MX, MY
				;~ ImageSearch, ProfileX, ProfileY, 0, 0, 2560, 1440, *40 C:\Dropbox\AHK\Images\DTMAFast.png
				;~ If ErrorLevel=1
				;~ {
					;~ MsgBox, 0, Hydrus Notification, uBlock Button Not Found, 1
					;~ Exit
				;~ }
				;~ MouseClick, Left, %ProfileX%, %ProfileY%
				;~ Sleep, 100
				;~ MouseMove, %MX%, %MY%
			;~ return

			;~ **FlashGot Media**  (DO NOT DELETE - USE SITE-SPECIFIC WHEN NEEDED)
			;~ #IfWinActive ahk_exe firefox.exe
			;~ ^+!F12::
				;~ KeyWait, Control, L
				;~ KeyWait, Shift, L
				;~ Send, ^{F7}
				;~ WinWaitActive, Add list of downloads, , 3
				;~ If ErrorLevel
				;~ {
					;~ Exit
				;~ }
				;~ If ErrorLevel=1
				;~ {
					;~ Exit
				;~ }
				;~ Send, {Tab}{Space}
				;~ WinWaitActive, Filter, , 3
				;~ If ErrorLevel
				;~ {
					;~ Exit
				;~ }
				;~ Send, {Enter}
				;~ WinWaitActive, Add list of downloads, , 3
				;~ If ErrorLevel
				;~ {
					;~ Exit
				;~ }
				;~ Send, +{Tab}{End}+{Home}+{Down}{Delete}
				;~ Sleep, 100
				;~ Send, {Space}
				;~ WinWaitActive, Add list of downloads, , 3
				;~ If ErrorLevel
				;~ {
					;~ Exit
				;~ }
				;~ Sleep, 500
				;~ ControlClick, Button13, Add list of downloads
				;~ WinWaitNotActive, Add list of downloads
				;~ Sleep, 100
				;~ WinActivate, ahk_exe firefox.exe
			;~ return
		}

		{ ;~ --------------------------------------------------INSERT-------------------------------------------------

			;- **Motherless - Prior Video**
			#IfWinActive MOTHERLESS ahk_exe firefox.exe
			^+Insert::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, +{Tab 3}
			return

			;~ **General - Shift-Tab**
			#IfWinActive ahk_exe firefox.exe
			^+Insert::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, +{Tab}
			return
		}

		{ ;~ ---------------------------------------------------HOME--------------------------------------------------

			;- **Motherless - Next Video**
			#IfWinActive MOTHERLESS ahk_exe firefox.exe
			^+Home::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, {Tab 3}
			return

			;- **PirateBay - Load Largest Image - All Right To Right**
			#IfWinActive TPB ahk_exe firefox.exe
			^+Home::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, ^.
			return

			;~ **General - Tab**
			#IfWinActive ahk_exe firefox.exe
			^+Home::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, {Tab}
			return
		}

		{ ;~ -------------------------------------------------PAGE UP-------------------------------------------------

			;~ **PirateBay - Open URLs in Tabs (Test by 'Links' Add-On)**
			#IfWinActive TPB ahk_exe firefox.exe
			+^PGUP::
				CoordMode, Pixel, Client
				CoordMode, Mouse, Client
				KeyWait, Control, L
				KeyWait, Shift, L
				WinTitle =
				ImageX =
				ImageY =
				WinGetActiveStats, WinTitle, WinWidth, WinHeight, WinX, WinY
				ImageSearch, Border1X, Border1Y, %WinX%, 250, %WinWidth%, %WinHeight%, *60 C:\Dropbox\AHK\Images\TPBBorder1.png
				If ErrorLevel=1
				{
					ImageSearch, Border1X, Border1Y, %WinX%, 250, %WinWidth%, %WinHeight%, *60 C:\Dropbox\AHK\Images\TPBBorder1a.png
					If ErrorLevel=1
						Exit
				}
				ImageSearch, Border2X, Border2Y, %Border1X%, %Border1Y%, %WinWidth%, %WinHeight%, *60 C:\Dropbox\AHK\Images\TPBBorder2.png
				If ErrorLevel=1
				{
					ImageSearch, Border2X, Border2Y, %Border1X%, %Border1Y%, %WinWidth%, %WinHeight%, *60 C:\Dropbox\AHK\Images\TPBBorder2a.png
					If ErrorLevel=1
						Exit
				}
				MouseMove, %Border1X%, %Border1Y%
				Click, Down, Right
				;~ SendEvent, {Click, %Border2X%, %Border2Y%, 0}
				Sleep, 500
				Click, Up, Right
				Sleep, 100
				Send, {Enter}
				Sleep, 500
				WinActivate, ahk_exe firefox.exe
				Send, ^{PgUp}
				WinWaitNotActive, %WinTitle%, , 2
				Sleep, 100
				IfWinActive, 502: Bad gateway
					Send, ^{F5}
			return

			;~ **File Save Prompt - Replace Default Filename with Content of Clipboard, Save File**
			#IfWinActive Enter name of file to save to ahk_class #32770
			^+PGUP::
				KeyWait, Control, L
				KeyWait, Shift, L
				ControlFocus, ToolbarWindow323, Enter name of file to save to
				Sleep, 100
				ControlFocus, Edit1, Enter name of file to save to
				Sleep, 100
				Send, ^a{Delete}^v{End}
				Sleep, 100
				ControlFocus, Button1, Enter name of file to save to
				Sleep, 100
				Send, {Space}
			return

			;~ **Pixiv - Copy Tab Name to Clipboard, Replace "/" with Space Char**
			#IfWinActive pixiv ahk_exe firefox.exe
			^+PGUP::
				KeyWait, Control, L
				KeyWait, Shift, L
				WinGetActiveTitle, WinTitle
				StringTrimRight, WinTitle, WinTitle, 18
				StringReplace, WinTitle, WinTitle, /, %A_Space%
				Clipboard = %WinTitle%
			return

			;~ **Motherless - Open Mouseover Link in New Tab**
			#IfWinActive MOTHERLESS ahk_exe firefox.exe
			^+PGUP::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, ^{Enter}
			return

			;~ **VideoBox - Set FDM Title + Tags**
			#IfWinActive VideoBox ahk_exe firefox.exe
			^+PGUP::
				KeyWait, Control, L
				KeyWait, Shift, L
				SetDefaultMouseSpeed, 0
				CoordMode, Pixel, Screen
				Clipboard =
				WinActivate, ahk_exe firefox.exe
				Send, ^l
				Sleep, 100
				Send, {Tab}
				Sleep, 100
				Send, ^a
				Sleep, 100
				Send, ^c
				ClipWait, 2
				If ErrorLevel
					Exit
				Send, {Tab}
				RegExMatch(Clipboard, "Deals`r`n`r`n(.*)`r`n", Title)
				Title := Title1
				RegExMatch(Clipboard, "Starring: (.*)`r`n", Person)
				Person := Person1
				If Person =
					Person = Uncredited
				RegExMatch(Clipboard, "Niches: (.*)\r", Tag)
				Tag := Tag1
				StringReplace, Title, Title, :, %A_Space%-%A_Space%
				StringReplace, Title, Title, <, , All
				StringReplace, Title, Title, >, , All
				StringReplace, Title, Title, :, , All
				StringReplace, Title, Title, ", , All
				StringReplace, Title, Title, /, , All
				StringReplace, Title, Title, \, , All
				StringReplace, Title, Title, |, , All
				StringReplace, Title, Title, ?, , All
				StringReplace, Title, Title, *, , All
				StringReplace, Person, Person, `,%A_SPACE%, `}`{, All
				Person = `{%Person%`}
				StringReplace, Tag, Tag, 1080p, , All
				StringReplace, Tag, Tag, 18 Teen, [Teenager], All
				StringReplace, Tag, Tag, 18+ Teen, [Teenager], All
				StringReplace, Tag, Tag, All Girl, [Girls Only], All
				StringReplace, Tag, Tag, Amateur, [Amateur], All
				StringReplace, Tag, Tag, Anal, [Anal], All
				StringReplace, Tag, Tag, Asian, , All
				StringReplace, Tag, Tag, Ass to Mouth, [Oral:Ass To Mouth], All
				StringReplace, Tag, Tag, BBW, , All
				StringReplace, Tag, Tag, BDSM, [BDSM], All
				StringReplace, Tag, Tag, Babysitter, [Babysitter], All
				StringReplace, Tag, Tag, Beach, , All
				StringReplace, Tag, Tag, Big Boobs, , All
				StringReplace, Tag, Tag, Big Butt, , All
				StringReplace, Tag, Tag, Big Cock, , All
				StringReplace, Tag, Tag, Black, , All
				StringReplace, Tag, Tag, Blonde, , All
				StringReplace, Tag, Tag, Blowjob, , All
				StringReplace, Tag, Tag, Bondage, [Bondage], All
				StringReplace, Tag, Tag, Brunette, , All
				StringReplace, Tag, Tag, CG Porn, , All
				StringReplace, Tag, Tag, Cheerleader, [Cheerleader], All
				StringReplace, Tag, Tag, Chinese, , All
				StringReplace, Tag, Tag, Classic Porn, [Vintage Porn], All
				StringReplace, Tag, Tag, College-girl, , All
				StringReplace, Tag, Tag, Cream Pie, [Cream Pie], All
				StringReplace, Tag, Tag, Cum Swapping, , All
				StringReplace, Tag, Tag, Cumshot, , All
				StringReplace, Tag, Tag, Cunnilingus, , All
				StringReplace, Tag, Tag, DP, [Double Penetration], All
				StringReplace, Tag, Tag, Double Anal, [Double Anal], All
				StringReplace, Tag, Tag, Electro Pussy, , All
				StringReplace, Tag, Tag, Enema, , All
				StringReplace, Tag, Tag, Extras, , All
				StringReplace, Tag, Tag, Facials, , All
				StringReplace, Tag, Tag, Feature, , All
				StringReplace, Tag, Tag, Femdom, , All
				StringReplace, Tag, Tag, Fetish, , All
				StringReplace, Tag, Tag, Fisting, [Fisting], All
				StringReplace, Tag, Tag, GILF, , All
				StringReplace, Tag, Tag, Gangbang, [Gangbang], All
				StringReplace, Tag, Tag, Gaping, , All
				StringReplace, Tag, Tag, Gonzo, , All
				StringReplace, Tag, Tag, Group Sex, [Group Sex], All
				StringReplace, Tag, Tag, HD, , All
				StringReplace, Tag, Tag, Hairy, , All
				StringReplace, Tag, Tag, Handjob, , All
				StringReplace, Tag, Tag, Hentai, , All
				StringReplace, Tag, Tag, Housewife, , All
				StringReplace, Tag, Tag, Indian, , All
				StringReplace, Tag, Tag, Interracial, [Interracial], All
				StringReplace, Tag, Tag, Japanese, , All
				StringReplace, Tag, Tag, Latex, , All
				StringReplace, Tag, Tag, Latinas, , All
				StringReplace, Tag, Tag, Leather, , All
				StringReplace, Tag, Tag, Legs and Feet, , All
				StringReplace, Tag, Tag, Lesbian, , All
				StringReplace, Tag, Tag, Location, , All
				StringReplace, Tag, Tag, MFF, [Group Sex - MFF], All
				StringReplace, Tag, Tag, MILF, , All
				StringReplace, Tag, Tag, MMF, [Group Sex - MMF], All
				StringReplace, Tag, Tag, Machine, [Machine], All
				StringReplace, Tag, Tag, Male Dominant, , All
				StringReplace, Tag, Tag, Mardi Gras, , All
				StringReplace, Tag, Tag, Masturbation, [Masturbation], All
				StringReplace, Tag, Tag, Middle Eastern, , All
				StringReplace, Tag, Tag, Midgets, , All
				StringReplace, Tag, Tag, Nurse, [Nurse], All
				StringReplace, Tag, Tag, Office, , All
				StringReplace, Tag, Tag, Older Men, , All
				StringReplace, Tag, Tag, One-on-One, , All
				StringReplace, Tag, Tag, Oral, , All
				StringReplace, Tag, Tag, Outdoors, , All
				StringReplace, Tag, Tag, POV, [POV], All
				StringReplace, Tag, Tag, Petite, , All
				StringReplace, Tag, Tag, Pool, , All
				StringReplace, Tag, Tag, Pregnant, , All
				StringReplace, Tag, Tag, Prison, , All
				StringReplace, Tag, Tag, Public, [Exhibitionism], All
				StringReplace, Tag, Tag, Redhead, [Red Hair], All
				StringReplace, Tag, Tag, Rimming, [Oral:Anilingus], All
				StringReplace, Tag, Tag, Roleplay, , All
				StringReplace, Tag, Tag, Ropes, , All
				StringReplace, Tag, Tag, Schoolgirl, [Schoolgirl], All
				StringReplace, Tag, Tag, Shower, , All
				StringReplace, Tag, Tag, Sixty-nine, , All
				StringReplace, Tag, Tag, Small Tits, , All
				StringReplace, Tag, Tag, Spanking, , All
				StringReplace, Tag, Tag, Squirting, , All
				StringReplace, Tag, Tag, Stocking, [Stockings], All
				StringReplace, Tag, Tag, Straight Sex, , All
				StringReplace, Tag, Tag, Strap-On, [Strap-On], All
				StringReplace, Tag, Tag, Stripper, , All
				StringReplace, Tag, Tag, Swallowing, [Swallowing], All
				StringReplace, Tag, Tag, Tattooed, [Tattooed], All
				StringReplace, Tag, Tag, Teacher, , All
				StringReplace, Tag, Tag, Threesome, [Group Sex - Threesome], All
				StringReplace, Tag, Tag, Tit Fucking, , All
				StringReplace, Tag, Tag, Toys, [Sex Toy], All
				StringReplace, Tag, Tag, Transsexual, [Transsexual], All
				StringReplace, Tag, Tag, Twins, [Twins], All
				StringReplace, Tag, Tag, Wood, , All
				StringReplace, Tag, Tag, `,%A_Space%, , All
				WinActivate, Free Download Manager
				Send, {End}
				Sleep, 50
				Send, {Enter}
				WinWaitActive, Download properties, , 3
				If ErrorLevel
					Exit
				ControlFocus, Edit4, Download properties
				Sleep, 50
				Send, {End}
				Sleep, 50
				SendRaw, %Title%%Person%%Tag%.mp4
				Sleep, 100
				Send, {Enter}
				Sleep, 100
				Send, {End}+s
				Sleep, 100
				FDMPendingRename = No
				WinActivate, VideoBox ahk_exe firefox.exe
				WinWaitActive, VideoBox ahk_exe firefox.exe, , 3
				If ErrorLevel
					Exit
			return

			;~ **NOTHING**
			#IfWinActive ahk_exe firefox.exe
			^+PGUP::
			return
		}

		{ ;~ --------------------------------------------------DELETE-------------------------------------------------

			;~ **xHamster - Like Video**
			#IfWinActive xHamster ahk_exe firefox.exe
			^+Delete::
				KeyWait, Control, L
				KeyWait, Shift, L
				SetDefaultMouseSpeed, 0
				CoordMode, Mouse, Client
				CoordMode, Pixel, Client
				MouseMove, 0,0
				Sleep, 100
				ImageSearch, X, Y, 0, 0, 250, 1080, *30 C:\Dropbox\AHK\Images\Like.png
				If ErrorLevel=1
				{
					ErrorLevel=0
					ImageSearch, X, Y, 0, 0, 250, 1080, *30 C:\Dropbox\AHK\Images\Like2.png
					If ErrorLevel=1
					{
						MsgBox, 0, Hydrus Notification, Link Not Found, 1
						Exit
					}
					MouseMove, %X%, %Y%
					Sleep 100
					Click
					Exit
				}
				XPos := X + 37
				YPos := Y + 24
				MouseMove, %XPos%, %YPos%
				Sleep 100
				Click
			return

			;~ **General - Close All Tabs To The Left**
			#IfWinActive ahk_exe firefox.exe
			^+Delete::
				Send, ^+{Left}
			return
		}

		{ ;~ ---------------------------------------------------END---------------------------------------------------

			;~ **General - Close All Other Tabs**
			#IfWinActive ahk_exe firefox.exe
			^+End::
				Send, ^+{Up}
			return
		}

		{ ;~ ------------------------------------------------PAGE DOWN------------------------------------------------

			;~ **General - Close Other Tabs**
			#IfWinActive ahk_exe firefox.exe
			^+PGDN::
				Send, ^+!w
			return
		}
	}

}

{ ;~ -------------------------------------------HYDRUS NETWORK-------------------------------------------

	{ ;~ ------------------------------------------DUPLICATE CHECKER-----------------------------------------

		;~ **Delete Both**
		#IfWinActive, Are you sure?
		^+F7::
			KeyWait, Control, L
			KeyWait, Shift, L
			Send, {Tab}
			Sleep, 50
			Send, {Space}
		return

	}

	{ ;~ --------------------------------MANAGE TAGS/PARENTS/SIBLINGS" WINDOWS-------------------------------

		{ ;~ ----------------------------------------"MANAGE TAGS" WINDOW----------------------------------------

			;~ **Copy Selected Tag(s)**
			#IfWinActive manage tags
			^+F2::
				KeyWait, Control, L
				KeyWait, Shift, L
				Clipboard =
				BlockInput, MouseMove
				Send, {Click Right}
				Sleep, 50
				IfWinActive, main - Hydrus Client
					{
						Send, {Down}
					}
				IfWinActive, manage tags
					{
						Send, {Down 4}
					}
				Sleep, 50
				Send, {Enter}
				Sleep, 50
				Send, {Enter}
				BlockInput, MouseMoveOff
			return

			;~ **Add Parents to Selected Tag(s)**
				#IfWinActive manage tags ahk_exe hydrus_client.exe
				^+F3::
					KeyWait, Control, L
					KeyWait, Shift, L
					BlockInput, MouseMove
					Send, {Click Right}
					Sleep, 50
					Send, {Down}
					Sleep, 50
					Send, {Down}
					Sleep, 50
					Send, {Down}
					Sleep, 50
					Send, {Enter}
					Sleep, 50
					Send, {Enter}
					WinWaitActive, manage tag parents
					Sleep, 100
					ControlFocus, , manage tag parents
					Send, +{Tab 5}
					Sleep, 100
					Send, ^v
					BlockInput, MouseMoveOff
				return

			;~ **Add Siblings to Selected Tag(s)**
				#IfWinActive main - manage tags ahk_exe hydrus_client.exe
				^+F4::
					KeyWait, Control, L
					KeyWait, Shift, L
					BlockInput, MouseMove
					Send, {Click Right}
					Sleep, 50
					Send, {Down}
					Sleep, 50
					Send, {Down}
					Sleep, 50
					Send, {Enter}
					Sleep, 50
					Send, {Enter}
					WinWaitActive, manage tag siblings
					Sleep, 100
					ControlFocus, , manage tag siblings
					Send, +{Tab 5}
					Sleep, 100
					Send, ^v
					BlockInput, MouseMoveOff
				return
		}

		{ ;~ ------------------------------------"MANAGE TAG PARENTS" WINDOW-----------------------------------

			;~ **[ENTER] Button (Main Search Field)**
			#IfWinActive manage tag parents
			^+F7::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, {Enter}
			return

			;~ **Submit Parent Changes**
			#IfWinActive manage tag parents
			^+F8::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, +{Tab 6}
				Sleep, 10
				Send, {Space}
				Sleep, 10
				Send, {Tab 6}
			return

			;~ **TAB to and press [APPLY] button**
			#IfWinActive manage tag parents
			^+F9::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, {Tab 5}
				Sleep, 10
				Send, {Enter}
			return
		}

		{ ;~ -----------------------------------"MANAGE TAG SIBLINGS" WINDOW-----------------------------------

			;~ **Send Text: character:**
			#IfWinActive manage tag siblings
			^+F2::
				KeyWait, Control, L
				KeyWait, Shift, L
				Sleep, 100
				Send, ^{Left 10}
				Sleep, 10
				Send, character:
			return

			;~ **Send Text: creator:**
			#IfWinActive manage tag siblings
			^+F3::
				KeyWait, Control, L
				KeyWait, Shift, L
				Sleep, 100
				Send, ^{Left 10}
				Sleep, 10
				Send, creator:
			return

			;~ **Send Text: series:**
			#IfWinActive manage tag siblings
			^+F4::
				KeyWait, Control, L
				KeyWait, Shift, L
				Sleep, 100
				Send, ^{Left 10}
				Sleep, 10
				Send, series:
			return

			;~ **[ENTER BUTTON]**
			#IfWinActive manage tag siblings
			^+F7::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, {Enter}
			return

			;~ **Submit Sibling Changes ("Add" Button)**
			#IfWinActive manage tag siblings
			^+F8::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, +{Tab 6}
				Sleep, 10
				Send, {Space}
				Sleep, 10
				Send, {Tab 6}
			return

			;~ **OK Button on Siblings Screen**
			#IfWinActive manage tag siblings
			^+F9::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, {Tab 4}
				Sleep, 10
				Send, {Enter}
			return
		}

		{ ;~ ----------------------------------BOTH PARENTS & SIBLINGS---------------------------------

			;~ **Close 'Manage Tags' Window**
			#IfWinActive manage tag
			^+F12::
				KeyWait, Control, L
				KeyWait, Shift, L
				Send, {F3}
			return

			;~ **Send Text: character:**
			#IfWinActive manage tag
			^+F2::
				KeyWait, Control, L
				KeyWait, Shift, L
				Sleep, 100
				Send, ^{Left 10}
				Sleep, 10
				Send, character:
			return

			;~ **Send Text: creator:**
			#IfWinActive manage tag
			^+F3::
				KeyWait, Control, L
				KeyWait, Shift, L
				Sleep, 100
				Send, ^{Left 10}
				Sleep, 10
				Send, creator:
			return

			;~ **Send Text: series:**
			#IfWinActive manage tag
			^+F4::
				KeyWait, Control, L
				KeyWait, Shift, L
				Sleep, 100
				Send, ^{Left 10}
				Sleep, 10
				Send, series:
			return
		}}

	{ ;~ -------------------------------ARCHIVE/DELETE FILTER-------------------------------

;~ **Confirm Archive/Delete Submissions**
#IfWinActive filtering done ahk_exe hydrus_client.exe
WheelUp::
^+F2::
^+F7::
MButton::
	KeyWait, Control, L
	KeyWait, Shift, L
	ControlFocus, Button1, filtering done ahk_exe hydrus_client.exe
	Send, {Enter}
return

;~ **Set Categories to "No"**
#IfWinActive Hydrus Client Archive Delete Filter
`::
^Home::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Control Down}1234567890{F1}{Control Up}
return

;~ **Set Wallpaper to "Yes", All Other Categories to "No"**
#IfWinActive Hydrus Client Archive Delete Filter
^`::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Control Down}123456789{F1}{Control Up}0
return

;~ **Archive File**
#IfWinActive Hydrus Client Archive Delete Filter
WheelUp::
^+F2::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Up}
	Sleep, 300
return

;~ **Zoom In**
;~ #IfWinActive Hydrus Client Archive Delete Filter
;~ ^+{F2}{WheelUp}::
	;~ KeyWait, Control, L
	;~ KeyWait, Shift, L
	;~ Send, z
;~ return

;~ **Zoom Out**
;~ #IfWinActive Hydrus Client Archive Delete Filter
;~ ^+{F2}{WheelUp}::
	;~ KeyWait, Control, L
	;~ KeyWait, Shift, L
	;~ Send, +z
;~ return

;~ **Re-Apply Last Non-Shortcut Tag**
#IfWinActive Hydrus Client Archive Delete Filter
PGDN::
^+F6::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {F3}
	WinWaitActive, manage tags, , 2
	;~ Sleep, 100
	Send, ^r
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {F3}
return

;~ **Delete File**
#IfWinActive Hydrus Client Archive Delete Filter
WheelDown::
^+F7::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Delete}
	Sleep, 100
	IfWinActive, Are you sure?
	{
		Send, {Tab}
		Send, {Enter}
	}
	Sleep, 300
return

;~ **Edit Tags**
#IfWinActive Hydrus Client Archive Delete Filter
^+F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {F3}
return
}

	{ ;~ --------------------------------------------MEDIA VIEWER--------------------------------------------

;~ **Set Categories to "No"**
#IfWinActive hydrus client media viewer
`::
^Home::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Control Down}1234567890{F1}{Control Up}
return

;~ **Set Wallpaper to "Yes", All Other Categories to "No"**
#IfWinActive hydrus client media viewer
^`::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Control Down}123456789{F1}{Control Up}0
return

;~ **Archive File**
#IfWinActive hydrus client media viewer
^+F2::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, +{Delete}
	Sleep, 20
	Send, {F7}
	Sleep, 300
return

;~ **Re-Apply Last Non-Shortcut Tag**
#IfWinActive hydrus client media viewer
PGDN::
^+F6::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {F3}
	WinWaitActive, manage tags, , 2
	;~ Sleep, 100
	Send, ^r
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {F3}
return

;~ **Delete File**
#IfWinActive hydrus client media viewer
^+F7::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Delete}
	;~ Sleep, 100
	;~ IfWinActive, Are you sure?
	;~ {
		;~ Send, {Tab}
		;~ Send, {Enter}
	;~ }
	Sleep, 300
return

;~ **Next File**
#IfWinActive hydrus client media viewer
WheelDown::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Right}
	Sleep, 100
return

;~ **Edit Tags**
#IfWinActive hydrus client media viewer
^+F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {F3}
return
}

	{ ;~ ------------------------------------------MAIN INTERFACE------------------------------------------

;~ **Select All Thumbnails (Force Focus to Thumbnails First)**
#IfWinActive main - Hydrus Client
^a::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^m
	Sleep, 10
	Send, ^a
return

;~ **Select All Search Terms (Force Focus to Search First)**
;~ #IfWinActive main - Hydrus Client
;~ ^+a::
	;~ KeyWait, Control, L
	;~ KeyWait, Shift, L
	;~ Send, ^s
	;~ Sleep, 10
	;~ Send, ^+a
;~ return

;~ **Force Media Focus >> Open 'Edit Tags' Window**
#IfWinActive ahk_exe hydrus_client.exe
F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^m{F3}
return

;~ **Force Media Focus >> Launch Archive/Delete Filter**
#IfWinActive main - Hydrus Client ahk_exe hydrus_client.exe
F12::
^+!F9::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^m
	Sleep, 100
	Send, {F12}
	WinWaitActive, hydrus client media viewer
	WinSetTitle, hydrus client media viewer, , Hydrus Client Archive Delete Filter
return

;~ **Copy Selected Tag(s)**
#IfWinActive main - Hydrus Client ahk_exe hydrus_client.exe
^+F2::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	BlockInput, MouseMove
	Send, {Click Right}
	Sleep, 50
	IfWinActive, main - Hydrus Client
		{
			Send, {Down}
		}
	IfWinActive, manage tags
		{
			Send, {Down 4}
		}
	Sleep, 50
	Send, {Enter}
	Sleep, 50
	Send, {Enter}
	BlockInput, MouseMoveOff
return

;~ **Add Parents to Selected Tag(s)**
#IfWinActive main - Hydrus Client ahk_exe hydrus_client.exe || media viewer - Hydrus Client
^+F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	BlockInput, MouseMove
	Send, {Click Right}
	Sleep, 50
	Send, {Down}
	Sleep, 50
	Send, {Down}
	Sleep, 50
	Send, {Down}
	Sleep, 50
	Send, {Enter}
	Sleep, 50
	Send, {Enter}
	WinWaitActive, manage tag parents
	Sleep, 100
	ControlFocus, , manage tag parents
	Send, +{Tab 5}
	Sleep, 100
	Send, ^v
	BlockInput, MouseMoveOff
return

;~ **Add Siblings to Selected Tag(s)**
#IfWinActive main - Hydrus Client ahk_exe hydrus_client.exe || media viewer - Hydrus Client
^+F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	BlockInput, MouseMove
	Send, {Click Right}
	Sleep, 50
	Send, {Down}
	Sleep, 50
	Send, {Down}
	Sleep, 50
	Send, {Enter}
	Sleep, 50
	Send, {Enter}
	WinWaitActive, manage tag siblings
	Sleep, 100
	ControlFocus, , manage tag siblings
	;~ Send, +{Tab 5}
	Sleep, 100
	Send, ^v
	BlockInput, MouseMoveOff
return

;~ **Re-Apply Last Non-Shortcut Tag**
#IfWinActive main - Hydrus Client ahk_exe hydrus_client.exe
^+F6::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {F3}
	WinWaitActive, manage tags for
	Send, ^r
	Sleep, 25
	Send, {Enter}
	Sleep, 25
	Send, {F3}
return

;~ **Close Current Page**
#IfWinActive main - Hydrus Client
^+F7::
	KeyWait, Control, L
	KeyWait, Shift, L
	;~ IfWinActive, ahk_class Qt5152QWindowToolSaveBits, WinActivate, ahk_class Qt652QWindowIcon
	Send, ^w
	Sleep, 50
	Send, ^m
return

;~ **Copy Text --> Add Parents to Selection**
;~ #IfWinActive main - Hydrus Client ahk_exe hydrus_client.exe
;~ ^+F8::
	;~ SendMode, Input
	;~ SetKeyDelay, 50
	;~ BlockInput, MouseMove
	;~ Send, +{F10}
	;~ Sleep, 200
	;~ Send, {Down 2}
	;~ Sleep, 200
	;~ Send, {Enter}
	;~ Sleep, 200
	;~ Send, {Enter}
	;~ WinWaitActive, manage tag parents
	;~ Sleep, 200
	;~ Send, +{Tab 5}
	;~ Sleep, 200
	;~ WinActivate, manage tag parents
	;~ Sleep, 200
	;~ Send, ^v
	;~ BlockInput, MouseMoveOff
;~ return

;~ **Re-Apply Twice-Prior Non-Shortcut Tag**
#IfWinActive main - Hydrus Client ahk_exe hydrus_client.exe
^+F11::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {F3}
	WinWaitActive, manage tags for
	Send, ^r
	Sleep, 25
	Send, {Down}
	Sleep, 25
	Send, {Enter}
	Sleep, 25
	Send, {F3}
return

;~ **Select All, Edit Tags**
#IfWinActive main - Hydrus Client
^+F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	IfWinExist, manage tags for
		{
		WinActivate manage tags for
		Exit
		}
	Send, ^m
	Sleep, 50
	Send, ^a
	Sleep, 200
	Send, {F3}
return

;~ **Remove Current Thumbnails from View**
#IfWinActive main - Hydrus Client
^+!F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Sleep, 25
	Send, ^m
	Sleep, 25
	Send, +{F10}
	Sleep, 100
	Send, {Down 4}
	Sleep, 10
	Send, {Right}
	Sleep, 10
	Send, {Enter}
return

;~ **Set 'Limit' to 1,000,000**
#IfWinActive, main - Hydrus Client ahk_exe hydrus_client.exe
^+!F8::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^s
	Sleep, 20
	Send, {End}{Up 8}
	Sleep, 20
	Send, {Enter}
	WinWaitActive, input predicate
	Sleep, 10
	Send, +{Tab}
	Sleep, 10
	Send, 1000000
	Sleep, 100
	Send, {Enter}
return

;~ **Open Archive/Delete Window**
#IfWinActive main - Hydrus Client
^+!F9::
	KeyWait, Control, L
	KeyWait, Shift, L
	IfWinActive, ahk_class Qt5152QWindowToolSaveBits
	{
		WinActivate, ahk_class Qt652QWindowIcon
	}
	;~ Send, ^s
	;~ Sleep, 100
	Send, ^m
	Sleep, 100
	Send, {Esc}
	Sleep, 100
	Send, {F12}
	WinGetActiveStats, WinTitle, WinWidth, WinHeight, WinX, WinY
	MouseMove, WinWidth - 10, % Round(WinHeight / 2)
return

;~ **Return Focus to Main Screen, Launch**
;~ #IfWinActive ahk_class Qt5152QWindowToolSaveBits ahk_exe hydrus_client.exe
;~ Add "$" character to trigger below if it doesn't work.
;~ ^+!F9:: ;~
	;~ KeyWait, Control, L
	;~ KeyWait, Shift, L
	;~ WinActivate, ahk_class Qt652QWindowIcon ahk_exe hydrus_client.exe
	;~ Sleep, 250
	;~ Send, ^m{F12}
;~ return
}

	{ ;~ -------------------------------RORY'S AHK TAG APPLICATION INTERFACE-------------------------------

;~ ----------------------------------------------(IN PROGRESS)----------------------------------------------

;~ THIS ENTIRE SECTION IS UNDER DEVELOPMENT. EXPAND TO VIEW/EDIT.


;~ **Create "Tag Application" Submission GUI**
;~ #IfWinActive main - Hydrus Client media viewer ahk_exe client.exe
;~ ^+!F11::
	;~ KeyWait, Control, L
	;~ KeyWait, Shift, L
	;~ WinGetActiveStats, Title, Width, Height, X, Y
	;~ PopUpX := (X + (Width / 2) - 217)
	;~ PopUpY := (Y + (Height / 2) - 162)
	;~ ***********
	;~ **COPY/PASTE, DO NOT USE ORIGINAL** "PARENT/CHILD LABEL" TEMPLATE FOR NEW TreeView GUI Entries BELOW
	;~ P1 := TV_Add("TEXT_FOR_PARENT1")
		;~ P1C1 := TV_Add("TEXT_FOR_PARENT1_FIRST_CHILD", P1) ;IC: [Specify P1 to be this item's parent.]
	;~ P2 := TV_Add("TEXT_FOR_PARENT2")
		;~ P2C1 := TV_Add("TEXT_FOR_PARENT2_CHILD1", P2)
		;~ P2C2 := TV_Add("TEXT_FOR_PARENT2_CHILD2", P2)
			;~ P2C2C1 := TV_Add("TEXT_FOR_PARENT2_CHILD2_CHILD1", P2C2)
	;~ ***********
	;~ GUI, Add, TreeView, Checked
	;~ P1 := TV_Add("TEXT_FOR_PARENT1")
		;~ P1C1 := TV_Add("TEXT_FOR_PARENT1_FIRST_CHILD", P1) ;IC: [Specify P1 to be this item's parent.]
	;~ P2 := TV_Add("TEXT_FOR_PARENT2")
		;~ P2C1 := TV_Add("TEXT_FOR_PARENT2_CHILD1", P2)
		;~ P2C2 := TV_Add("TEXT_FOR_PARENT2_CHILD2", P2)
			;~ P2C2C1 := TV_Add("TEXT_FOR_PARENT2_CHILD2_CHILD1", P2C2)
	;~ ***********
	;~ GUI, Show  ; Show the window and its TreeView.
;~ return

;~ GUIClose:  ; Exit the script when the user closes the TreeView's GUI window.
;~ ExitApp

;~ **TAG PLACEMENT MENU**
;~ #IfWinActive main - Hydrus Client media viewer ahk_exe client.exe
;~ ^+F9::
	;~ KeyWait, Control, L
	;~ KeyWait, Shift, L
	;~ WinGetActiveStats, Title, Width, Height, X, Y
	;~ PopUpX := (X + (Width / 2) - 217)
	;~ PopUpY := (Y + (Height / 2) - 162)
	;~ GUI, Add, Button, , Demon
	;~ GUI, Add, Button, , Dragon
	;~ GUI, Add, Button, , Panther
	;~ GUI, Add, Button, , Pokemon
	;~ GUI, Add, Button, , Robot
	;~ GUI, Add, Button, , Tentacles
	;~ GUI, Add, Button, , Werewolf
	;~ GUI, Show, x%PopUpX% y%PopUpY%, Select Species:
	;~ WinActivate, Select Species:
;~ return

;~ GuiEscape:
;~ GuiClose:
	;~ Gui, Destroy
	;~ WinActivate, ahk_class SciTEWindow
;~ Exit

;~ ButtonDemon:
	;~ GUI, Submit
	;~ WinActivate, ahk_class SciTEWindow
	;~ WinWaitActive, ahk_class SciTEWindow, , 3
	;~ If ErrorLevel
		;~ Exit
	;~ Send, ^{End}^f
	;~ Sleep, 50
	;~ Send, {-}-HYDRUS (ARCHIVE/DELETE VIEWER)-{-}{Enter}
	;~ Sleep, 100
	;~ Send, {Escape}{Home}
	;~ Gui, Destroy
;~ Exit

;~ ButtonDragon:
	;~ GUI, Submit
	;~ WinActivate, ahk_class SciTEWindow
	;~ WinWaitActive, ahk_class SciTEWindow, , 3
	;~ If ErrorLevel
		;~ Exit
	;~ Send, ^{End}^f
	;~ Sleep, 50
	;~ Send, {-}-FIREFOX-{-}{Enter}
	;~ Sleep, 100
	;~ Send, {Escape}{Home}
	;~ Gui, Destroy
;~ Exit

;~ ButtonPanther:
	;~ GUI, Submit
	;~ WinActivate, ahk_class SciTEWindow
	;~ WinWaitActive, ahk_class SciTEWindow, , 3
	;~ If ErrorLevel
		;~ Exit
	;~ Send, ^{End}^f
	;~ Sleep, 50
	;~ Send, {-}-HYDRUS (MAIN)-{-}{Enter}
	;~ Sleep, 100
	;~ Send, {Escape}{Home}
	;~ Gui, Destroy
;~ Exit

;~ ButtonPokemon:
	;~ GUI, Submit
	;~ WinActivate, ahk_class SciTEWindow
	;~ WinWaitActive, ahk_class SciTEWindow, , 3
	;~ If ErrorLevel
		;~ Exit
	;~ Send, ^{End}^f
	;~ Sleep, 50
	;~ Send, {-}-HYDRUS (MEDIA VIEWER)-{-}{Enter}
	;~ Sleep, 100
	;~ Send, {Escape}{Home}
	;~ Gui, Destroy
;~ Exit

;~ ButtonRobot:
	;~ GUI, Submit
	;~ WinActivate, ahk_class SciTEWindow
	;~ WinWaitActive, ahk_class SciTEWindow, , 3
	;~ If ErrorLevel
		;~ Exit
	;~ Send, ^{End}^f
	;~ Sleep, 50
	;~ Send, {-}-CHROME-{-}{Enter}
	;~ Sleep, 100
	;~ Send, {Escape}{Home}
	;~ Gui, Destroy
;~ Exit

;~ ButtonTentacles:
	;~ GUI, Submit
	;~ WinActivate, ahk_class SciTEWindow
	;~ WinWaitActive, ahk_class SciTEWindow, , 3
	;~ If ErrorLevel
		;~ Exit
	;~ Send, ^{End}^f
	;~ Sleep, 50
	;~ Send, {-}-FREE DOWNLOAD MANAGER-{-}{Enter}
	;~ Sleep, 100
	;~ Send, {Escape}{Home}
	;~ Gui, Destroy
;~ Exit

;~ ButtonWerewolf:
	;~ GUI, Submit
	;~ WinActivate, ahk_class SciTEWindow
	;~ WinWaitActive, ahk_class SciTEWindow, , 3
	;~ If ErrorLevel
		;~ Exit
	;~ Send, ^{End}^f
	;~ Sleep, 50
	;~ Send, --{G}LOBAL (MUST STAY AT TOP)--{Enter}
	;~ Sleep, 100
	;~ Send, {Escape}{Home}
	;~ Gui, Destroy
;~ Exit
}}

{ ;~ --------------------------------------------INTERNET EDGE-------------------------------------------

;~ **Navigate Tabs - Left**
#IfWinActive ahk_class Chrome_WidgetWin_1 ahk_exe msedge.exe
^+F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^{PGUP}
return

;~ **Navigate Tabs - Right**
#IfWinActive ahk_class Chrome_WidgetWin_1 ahk_exe msedge.exe
^+F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^{PGDN}
return

;~ **Close Active Tab**
#IfWinActive ahk_class Chrome_WidgetWin_1 ahk_exe msedge.exe
^+F7::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^w
return
}

{ ;~ ---------------------------------------------IDLE GAMES---------------------------------------------

;~ **Send '`' Key** (NOTE: THE AUTOCLICKER MUST BE OFF FOR THE TOGGLE TO WORK TURNING OFF THE HOTKEY)
#IfWinActive DPS Idle ahk_class YYGameMakerYY
^+!F12::
#IfWinActive Idle Champions ahk_exe IdleDragons.exe
^+!F12::
#IfWinActive Realm Grinder
^+!F12::
#IfWinActive Zombidle
^+!F12::
#IfWinActive IdleWizard
^+!F12::
#IfWinActive Cookie Clicker
^+!F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Flag1:=!Flag1
	Send, {F6}
	;~ If flag1
		;~ ToolTip, Autoclicker Active`nPress [CTRL+Shift+F12] To Deactivate
	;~ else
		;~ ToolTip,
return

;~ **Kiwi Clicker - Send Ctrl+Shift Right-Click**
#IfWinActive, Kiwi Clicker
RButton::
	KeyWait, Control, LAlt
	KeyWait, Shift, LAlt
	Send, ^{RButton}
return

;~ **Kiwi Clicker - Buy Max On All Stations (T >> Q)**
#IfWinActive, Kiwi Clicker
`::
	KeyWait, Control, LAlt
	KeyWait, Shift, LAlt
	Send, t
	Sleep, 400
	Send, 4
	Sleep, 400
	Send, r
	Sleep, 400
	Send, 4
	Sleep, 400
	Send, e
	Sleep, 400
	Send, 4
	Sleep, 400
	Send, w
	Sleep, 400
	Send, 4
	Sleep, 400
	Send, q
	Sleep, 400
	Send, 4
	Sleep, 400
	Send, q
return

;~ **Kiwi Clicker - Buy Max On All Stations (Q >> T)**
#IfWinActive, Kiwi Clicker
^`::
	KeyWait, Control, LAlt
	KeyWait, Shift, LAlt
	Send, q
	Sleep, 400
	Send, 4
	Sleep, 400
	Send, w
	Sleep, 400
	Send, 4
	Sleep, 400
	Send, e
	Sleep, 400
	Send, 4
	Sleep, 400
	Send, r
	Sleep, 400
	Send, 4
	Sleep, 400
	Send, t
	Sleep, 400
	Send, 4
	Sleep, 400
	Send, t
return

;~ **Kiwi Clicker - Buy Max On Q Station**
#IfWinActive, Kiwi Clicker
q::
	KeyWait, Control, LAlt
	KeyWait, Shift, LAlt
	Send, q
	Sleep, 250
	Send, 4
	Sleep, 250
	Send, q
return

;~ **Kiwi Clicker - Buy Max On W Station**
#IfWinActive, Kiwi Clicker
w::
	KeyWait, Control, LAlt
	KeyWait, Shift, LAlt
	Send, w
	Sleep, 250
	Send, 4
	Sleep, 250
	Send, w
return

;~ **Kiwi Clicker - Buy Max On E Station**
#IfWinActive, Kiwi Clicker
e::
	KeyWait, Control, LAlt
	KeyWait, Shift, LAlt
	Send, e
	Sleep, 250
	Send, 4
	Sleep, 250
	Send, e
return

;~ **Kiwi Clicker - Buy Max On R Station**
#IfWinActive, Kiwi Clicker
r::
	KeyWait, Control, LAlt
	KeyWait, Shift, LAlt
	Send, r
	Sleep, 250
	Send, 4
	Sleep, 250
	Send, r
return

;~ **Kiwi Clicker - Buy Max On T Station**
#IfWinActive, Kiwi Clicker
t::
	KeyWait, Control, LAlt
	KeyWait, Shift, LAlt
	Send, t
	Sleep, 250
	Send, 4
	Sleep, 250
	Send, t
return
}

{ ;~ -----------------------------------------------ITUNES-----------------------------------------------

;~ **Jump Backward Within Song**
#IfWinActive ahk_class iTunes
$^+F3::
	SendMode, Input
	KeyWait, Control, L
	KeyWait, Shift, L
	;~ Send, {Control Down}{Alt Down}
	Send, ^!{Left}
	;~ Send, {Alt Up}{Control Up}
return

;~ **Jump Forward Within Song**
#IfWinActive ahk_class iTunes
^+F4::
	SendMode, Input
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Control Down}{Alt Down}{Right}{Alt Up}{Control Up}
return

;~ **Beginning of Song / Prior Song**
#IfWinActive ahk_class iTunes
^+F8::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Left}
return

;~ **Next Song**
#IfWinActive ahk_class iTunes
^+F9::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Right}
return
}

{ ;~ -------------------------------------------LOSSLESS CUT-------------------------------------------

;~ **Pause/Resume  Media**
#IfWinActive ahk_exe LosslessCut.exe
MButton::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Space}
return

;~ **Begin Export**
#IfWinActive ahk_exe LosslessCut.exe
^+F2::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, e
return

;~ **Keyframe Jump Back**
#IfWinActive ahk_exe LosslessCut.exe
^+F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, !{Left}
return

;~ **Keyframe Jump Forward**
#IfWinActive ahk_exe LosslessCut.exe
^+F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, !{Right}
return

;~ **Close Project**
#IfWinActive ahk_exe LosslessCut.exe
^+F7::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^w
return

;~ **Large Jump Back**
#IfWinActive ahk_exe LosslessCut.exe
^+F8::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^{Left}
return


;~ **Large Jump Forward**
#IfWinActive ahk_exe LosslessCut.exe
^+F9::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^{Right}
return

;~ **Add Segment**
#IfWinActive ahk_exe LosslessCut.exe
^+F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {NumpadAdd}
return

;~ **Mark Segment Begin Time**
#IfWinActive ahk_exe LosslessCut.exe
^+!F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, i
return

;~ **Mark Segment End Time**
#IfWinActive ahk_exe LosslessCut.exe
^+!F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, o
return

;~ **Delete Current Segment**
#IfWinActive ahk_exe LosslessCut.exe
^+!F7::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Backspace}
return
}

{ ;~ ---------------------------------------------NOTEPAD----------------------------------------------

;~ **Porn Stars.txt File - Copy Current Line, Edit Clipboard to PirateBay URL Search Parameters (First Last|First.Last)**
#IfWinActive Porn Stars`.txt ahk_class Notepad++
^+!F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	Send, {End}+{Home}^c
	ClipWait, 2
	If ErrorLevel
		Exit
	PornStarOrig := Clipboard
	PornStarURL1 := RegExReplace(PornStarOrig, "\s", "`%20")
	PornStarURL2 := RegExReplace(PornStarOrig, "\s", "`.")
	FinalURL = https://thepiratebay10.org/search/%PornStarURL1%|%PornStarURL2%/1/7/500
	Clipboard = %FinalURL%
	IfWinExist, The Pirate Bay ahk_exe firefox.exe
	{
		WinActivate, The Pirate Bay ahk_exe firefox.exe
		Send, ^l
		Sleep, 100
		Send, %FinalURL%
		Sleep, 100
		Send, {Enter}
		Exit
	}
return

;~ **Copy Current Line to Firefox, Search VideoBox for String**
#IfWinActive Hydrus Tag Search ahk_class Notepad++
^+!F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	Send, {End}+{Home}^c
	ClipWait, 2
	If ErrorLevel
		Exit
	IfWinNotExist, ahk_exe client.exe
		{
		MsgBox, Hydrus Not Active
		Exit
		}
	WinActivate, ahk_exe client.exe
	Sleep, 100
	Send, ^s
	Sleep, 100
	Send, {Tab 5}{Space}
	Sleep, 25
	Send, {Down 3}
	Sleep, 25
	Send, {Enter}
	Sleep, 100
	Send, ^v
	Sleep, 100
	Send, {Enter}
return

;~ **Copy Current Line to Firefox, Search VideoBox for String**
#IfWinActive ahk_class Notepad++
^+!F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	Send, {End}+{Home}^c
	ClipWait, 2
	If ErrorLevel
		Exit
	IfWinNotExist, ahk_exe firefox.exe
		{
		MsgBox, Firefox Not Active
		Exit
		}
	WinActivate, ahk_exe firefox.exe
	Sleep, 50
	Send, ^l{Tab 2}
	Sleep, 100
	Send, ^v
	Sleep, 100
	Send, {Enter}
return
}

{ ;~ ---------------------------------------------PAINT.NET--------------------------------------------

;~ **Maximize/Restore Window**
#IfWinActive ahk_exe PaintDotNet.exe
^+F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, #{Up}
return

;~ **Crop to Selection**
#IfWinActive ahk_exe PaintDotNet.exe
^+!F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^+x
return

;~ **Close Image**
#IfWinActive ahk_exe PaintDotNet.exe
^+F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^w
return

;~ **Increase Brush Size**
#IfWinActive ahk_exe PaintDotNet.exe
^+F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, [
return

;~ **Decrease Brush Size**
#IfWinActive ahk_exe PaintDotNet.exe
F15::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ]
return
}

{ ;~ ---------------------------------------------PHOTOSHOP--------------------------------------------

;~ **Resize Horizontal Image to Greater of Width or Height**
#IfWinActive ahk_class Photoshop
^+F2::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	ControlFocus, OWL.Dock5, ahk_class Photoshop
	Send, ^!i
	WinWaitActive, Image Size, , 3
	If ErrorLevel
		Exit
	Send, ^c
	ClipWait, 2
	If ErrorLevel
		Exit
	W := Clipboard
	Clipboard =
	Send, {Tab 2}^c
	ClipWait, 2
	If ErrorLevel
		Exit
	H := Clipboard
	Ratio := W / H
	;~ MsgBox, Width: %W%`r`nHeight: %H%`r`nRatio: %Ratio%
	Perfect := 2560 / 1440
	If W = 2560
	{
		If H = 1440
		{
			WinActivate, Image Size
			Send, {Esc}
			MsgBox, , Hydrus Notification, Image Already at Target Resolution, 1
		}
	}
	If Ratio = %Perfect%
	{
		WinActivate, Image Size
		Sleep, 100
		Send, 1440
		Sleep, 100
		Send, {Enter}
	}
	If Ratio < 1
	{
		WinActivate, Image Size
		Sleep, 100
		Send, 1440
		Sleep, 100
		Send, {Enter}
	}
	If Ratio > %Perfect%
	{
		WinActivate, Image Size
		Sleep, 100
		Send, 1440
		Sleep, 100
		Send, {Enter}
	}
	If Ratio < %Perfect%
	{
		WinActivate, Image Size
		Sleep, 100
		Send, +{Tab 2}2560
		Sleep, 100
		Send, {Enter}
	}
	Send, ^0^-
return

;~ **Resize Canvas (Centered)**
#IfWinActive ahk_class Photoshop
^+F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	ControlFocus, OWL.Dock5, ahk_class Photoshop
	Send, ^!c
	WinWaitActive, Canvas Size, , 3
	If ErrorLevel
		Exit
	Send, {Tab}2560{Tab 2}1440{Enter}
	WinWaitNotActive, Canvas Size
	WinWaitActive, ahk_exe photoshop.exe
	Send, ^0^-
return

;~ **Resize Canvas (Non-Centered)**
#IfWinActive ahk_class Photoshop
^+F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	ControlFocus, OWL.Dock5, ahk_class Photoshop
	Send, ^!c
	WinWaitActive, Canvas Size, , 3
	If ErrorLevel
		Exit
	Send, {Tab}2560{Tab 2}1440
	WinWaitNotActive, Canvas Size
	WinWaitActive, ahk_exe photoshop.exe
	Send, ^0^-
return

;~ **Close Image**
#IfWinActive ahk_class Photoshop
^+F7::
	KeyWait, Control, L
	KeyWait, Shift, L
	ControlFocus, OWL.Dock5, ahk_class Photoshop
	Send, ^w
	Sleep, 250
	Send, n
return

;~ **Save as PNG**
#IfWinActive ahk_class Photoshop
^+F8::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	WinGetActiveTitle, WinTitle
	Send, ^+s
	WinWaitActive, Save As, , 2
	If ErrorLevel
		Exit
	If WinTitle Contains `.png
	{
		Send, {End} (Modified)
		Sleep, 50
		Send, {Enter}
		WinWaitActive, PNG Format Options
		Sleep, 100
		Send, {Enter}
		Exit
	}
	FormatTime, Timestamp, A_now, yyyy-MM-dd HHmmss
	Send, {Delete}
	Sleep, 20
	Send, %Timestamp%
	Sleep, 50
	Send, {Tab}{p 5}{Enter}
	WinWaitActive, PNG Format Options
	WinActivate, PNG Format Options
	Sleep, 100
	Send, {Enter}
	;~ Sleep, 500
	;~ IfWinActive, Confirm Save As
	;~ {
		;~ Send, n
		;~ Sleep, 100
		;~ Send, +{Tab}
		;~ Send, {End}
	;~ }
return

;~ **Crop to Selection**
#IfWinActive ahk_class Photoshop
^+F9::
	KeyWait, Control, L
	KeyWait, Shift, L
	ControlFocus, OWL.Dock5, ahk_class Photoshop
	Send, !ip
	Sleep, 25
	Send, ^0^-
return


;~ **New Document, Paste**
;~ #IfWinActive ahk_class Photoshop
;~ ^+!F12::
	;~ KeyWait, Control, L
	;~ KeyWait, Shift, L
	;~ Send, ^n
	;~ Sleep, 250
	;~ Send, {Enter}
	;~ Sleep, 250
	;~ Send, ^v
;~ return
}

{ ;~ ----------------------------------------------QUICKEN---------------------------------------------

;~ **Submit Password**
#IfWinActive Enter Data File Password
^+!F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	SendRaw, C@$hM0n3y!
	Sleep, 50
	Send, {Enter}
return
}

{ ;~ ------------------------------------------SCITE4AUTOHOTKEY------------------------------------------

;~ **Insert Category Divider**
#IfWinActive SciTE4AutoHotkey ahk_class SciTEWindow
^+F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	InputBox, DividerTitle, Creating A Category Divider, Please Enter The Category Divider's Title Below:
	If ErrorLevel
		Exit
	StringLen, TitleLen, DividerTitle
	OpenDash := Round((100 - TitleLen) / 2)
	CloseDash := (100 - TitleLen - OpenDash)
	WinActivate, SciTE4AutoHotkey ahk_class SciTEWindow
	Send, {Home}`;~ {- %OpenDash%}%DividerTitle%{- %CLoseDash%}{Enter 2}
return

;~ **Insert New Hotkey Template** ##CAUSING FORMATTING CONFLICTS FOLLOWING SCALING CHANGE##
#IfWinActive SciTE4AutoHotkey ahk_class SciTEWindow
^+F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	;~ Send, `n`n{Up 2} ##CAUSING FORMATTING CONFLICTS FOLLOWING SCALING CHANGE##
	Send, {Home}`;~ **DESCRIPTION**`n{#}IfWinActive, [WINDOW TITLE] [AHK CLASS/EXE]`n{^}{+}HOTKEY::`n{Tab}KeyWait, Control, L`nKeyWait, Shift, L`n`n{Backspace}return{Esc}{Up}{End}
return

;~ **Reload Script**
#IfWinActive SciTE4AutoHotkey ahk_class SciTEWindow
F5::
	KeyWait, Control, L
	KeyWait, Shift, L
	Reload
	Sleep 500
	;~ If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
	MsgBox, 4, Hydrus Notification, The script could not be reloaded. Open script for editing?
	IfMsgBox, Yes, Edit
return

;~ ---------------------------------------SELECTION PROMPT GUI---------------------------------------

;~ **Go-To Section Prompt**
#IfWinActive SciTE4AutoHotkey ahk_class SciTEWindow
^+F2::
	KeyWait, Control, L
	KeyWait, Shift, L
	WinGetActiveStats, Title, Width, Height, X, Y
	PopUpX := (X + (Width / 2) - 217)
	PopUpY := (Y + (Height / 2) - 162)
	Gui, Add, Button, , Global
	Gui, Add, Button, , Chrome
	Gui, Add, Button, , Final Fantasy 14
	Gui, Add, Button, , Firefox
	Gui, Add, Button, , Hydrus
	Gui, Add, Button, , Internet Edge
	Gui, Add, Button, , iTunes
	Gui, Add, Button, , Lossless Cut
	Gui, Add, Button, , Notepad++
	Gui, Add, Button, ym, Paint.Net
	Gui, Add, Button, , Photoshop
	Gui, Add, Button, , SciTE4AutoHotKey
	Gui, Add, Button, , Slack
	Gui, Add, Button, , Steam
	Gui, Add, Button, , ThumbsPlus
	Gui, Add, Button, , VLC Player
	Gui, Add, Button, , Windows Explorer
	Gui, Show, x%PopUpX% y%PopUpY%, Select Section:
	WinActivate, Select Section:
return

ButtonGlobal:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, --{G}LOBAL (MUST STAY AT TOP)--{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtonChrome:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}-CHROME-{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtonFinalFantasy14:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}-FINAL FANTASY 14-{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtonFirefox:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}-FIREFOX-{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtonFreeDownloadManager:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}-FREE DOWNLOAD MANAGER-{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtonHydrus:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}-HYDRUS NETWORK-{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtonInternetEdge:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}-INTERNET EDGE-{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtoniTunes:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}-ITUNES-{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtonLosslessCut:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}-LOSSLESS CUT-{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtonNotepad++:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}{-}NOTEPAD{+}{+}{-}{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtonPaint.Net:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}-PAINT.NET-{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtonPhotoshop:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}-PHOTOSHOP-{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtonSciTE4AutoHotKey:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}-SCITE4AUTOHOTKEY-{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtonSlack:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}-SLACK-{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtonSteam:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}-STEAM-{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtonThumbsPlus:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}-ThumbsPlus (MAIN)-{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtonVLCPlayer:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}-VLC PLAYER-{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit

ButtonWindowsExplorer:
	GUI, Submit
	WinActivate, ahk_class SciTEWindow
	WinWaitActive, ahk_class SciTEWindow, , 3
	If ErrorLevel
		Exit
	Send, ^{End}^f
	Sleep, 50
	Send, {-}-WINDOWS EXPLORER-{-}{Enter}
	Sleep, 100
	Send, {Escape}{Home}
	Gui, Destroy
Exit
}

{ ;~ ----------------------------------------------SPOTIFY---------------------------------------------

;~ **Back 10 Seconds**
#IfWinActive ahk_exe Spotify.exe
^+F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, +{Left}
return

;~ **Forward 10 Seconds**
#IfWinActive ahk_exe Spotify.exe
^+F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, +{Right}
return

;~ **Prior Song**
#IfWinActive ahk_exe Spotify.exe
^+F8::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^{Left}
return

;~ **Next Song**
#IfWinActive ahk_exe Spotify.exe
^+F9::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^{Right}
return

;~ **Activate Chrome 'iTunes >> Spotify' Window, Mark Current Line Complete, Copy Next Artist & Search Spotify**
#IfWinActive ahk_exe Spotify.exe
^+F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	IfWinNotExist, iTunes `>`> Spotify - Google Sheets ahk_exe chrome.exe
	{
		MsgBox, 'iTunes >> Spotify' Window Not Found, Ending Script
		Exit
	}
	WinActivate, iTunes >> Spotify - Google Sheets ahk_exe chrome.exe
	Send, {Home}
	Sleep, 100
	Send, TRUE
	Sleep, 100
	Send, {Down}{Right}
	Sleep, 100
	Send, ^c
	ClipWait, 2
	WinActivate, ahk_exe Spotify.exe
	Sleep, 250
	Send, ^l
	Sleep, 100
	Send, ^a
	Sleep, 200
	Send, {Delete}
	Sleep, 100
	Send, %Clipboard%
	;~ Sleep, 200
	;~ Send, {Enter}
return

;~ **Spotify Volume Up**
#IfWinActive ahk_exe Spotify.exe
^+!F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	SoundSet, +2
return

;~ **System Volume Up**
#IfWinActive ahk_exe Spotify.exe
^+!F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^{Up}
return

;~ **Spotify Volume Down**
#IfWinActive ahk_exe Spotify.exe
^+!F8::
	KeyWait, Control, L
	KeyWait, Shift, L
	SoundSet, -2
return

;~ **System Volume Down**
#IfWinActive ahk_exe Spotify.exe
^+!F9::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^{Down}
return
}

{ ;~ --------------------------------------------------STEAM--------------------------------------------------

;~ **Steam Login (Rory)**
#IfWinActive Steam Sign In
^+F2::
	KeyWait, Control, L
	KeyWait, Shift, L
	SendRaw, rlgurney
	Sleep, 100
	Send, {Tab}
	Sleep, 100
	Send, ^a
	Sleep, 100
	Send, {Delete}
	Sleep, 100
	SendRaw, ^p3Hg!F54Z7fQTk
	Sleep, 250
	Send, {Enter}
return

;~ **Purchase Page**
#IfWinActive Steam ahk_class vguiPopupWindow
^+F2::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Tab 3}
	Sleep, 100
	SendRaw, 693
	Sleep, 100
	Send, {Tab 2}
	Sleep, 100
	Send, {Space}
	Sleep, 100
	Send, {Tab 2}
	Sleep, 100
	Send, {Enter}
return

;~ **Steam Login (GurneyKids)**
#IfWinActive Steam Sign In
^+F7::
	KeyWait, Control, L
	KeyWait, Shift, L
	SendRaw, gurneykids
	Sleep, 100
	Send, {Tab}
	Sleep, 100
	Send, ^a
	Sleep, 100
	Send, {Delete}
	Sleep, 100
	SendRaw, Awes0mest!
	Sleep, 250
	Send, {Enter}
return
}

{ ;~ -------------------------------------------THUMBSPLUS (MAIN)-------------------------------------------

;~ **Scan Folder**
#IfWinActive ThumbsPlus 10 - Thumbs.tpdb8 ahk_exe Thumbs10.exe
^+F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^+{F3}
return

;~ **Move Folder (Current Location)**
#IfWinActive ThumbsPlus 10 - Thumbs.tpdb8 ahk_exe Thumbs10.exe
^+!F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, +!{F5}
	WinWaitActive, Move Folder, , 3
	If ErrorLevel
		Exit
	Send, {Enter}
return

;~ **Delete Folder**
#IfWinActive ThumbsPlus 10 - Thumbs.tpdb8 ahk_exe Thumbs10.exe
^+!F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	ControlFocus SysTreeView321, ThumbsPlus 10 - Thumbs.tpdb8 ahk_exe Thumbs10.exe
	Send, ^+{F6}
	Sleep, 100
	IfWinActive, ThumbsPlus ahk_class #32770, , 3
		Send, +{Tab}{SPACE}
return

;~ **Mass Rename (Selected)**
#IfWinActive ThumbsPlus 10 - Thumbs.tpdb8 ahk_exe Thumbs10.exe
^+!F7::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	ControlFocus SysTreeView321, ThumbsPlus 10 - Thumbs.tpdb8 ahk_exe Thumbs10.exe
	Send, {F2}
	Sleep, 50
	Send, ^c
	ClipWait, 2
	If ErrorLevel
		Exit
	Send, {Esc}
	Sleep, 50
	Send, +!{F2}
	WinWaitActive, Automatic File Rename, , 2
	If ErrorLevel
		Exit
	Send, ^v p{Tab}1{Enter}
return

;~ **Mass Rename 1, 2, 3, etc (All)**
#IfWinActive ThumbsPlus 10 - Thumbs.tpdb8 ahk_exe Thumbs10.exe
^+!F8::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	Send, +!{F2}
	WinWaitActive, Automatic File Rename, , 2
	If ErrorLevel
		Exit
	Send, {Tab}1{Enter}
	Sleep, 500
	Send, {F5}
return

;~ **Start Slide Show, Set WinTitle to "SlideShow"**
#IfWinActive ThumbsPlus 10 - Thumbs.tpdb8 ahk_exe Thumbs10.exe
^+!F9::
F8::
	KeyWait, Control, L
	KeyWait, Shift, L
	ControlFocus AfxWnd110u1, ThumbsPlus 10 - Thumbs.tpdb8 ahk_exe Thumbs10.exe
	Send, {Right}{Left}{F8}
	WinWaitActive, ahk_class cswThumbsPlusView, , 3
	If ErrorLevel
		Exit
	WinSetTitle, SlideShow
return

;~ **Move File (Current Location)**
#IfWinActive ThumbsPlus 10 - Thumbs.tpdb8 ahk_exe Thumbs10.exe
^+!F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, +{F2}
	WinWaitActive, Move Files, , 3
	If ErrorLevel
		Exit
	Send, {ENTER}
	;~ Sleep, 250
	;~ IfWinActive, Confirm File Replacement
	;~ {
		;~ Send, u
	;~ }
return

;~ **F9 = No Action**
;~ #IfWinActive ThumbsPlus 10 - Thumbs.tpdb8 ahk_exe Thumbs10.exe
;~ ^+F4::
;~ return

;~ **Copy File Name to Firefox (HD)**
#IfWinActive ThumbsPlus 10 - Thumbs.tpdb8 ahk_exe Thumbs10.exe
^+F7::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	Send, {F2}
	Sleep, 100
	Send, ^c
	Sleep, 100
	Send, {Escape}
	Sleep, 100
	WinActivate, ahk_exe firefox.exe
	Sleep, 100
	Send, ^l
	Sleep, 100
	Send, https://xhamster.com/movies/^v^+{Left}+{Left}{Delete}{Enter}
return

;~ **Copy File Name to Firefox (Non-HD)**
#IfWinActive ThumbsPlus 10 - Thumbs.tpdb8 ahk_exe Thumbs10.exe
^+F8::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	Send, {F2}
	Sleep, 100
	Send, ^c
	Sleep, 100
	Send, {Escape}
	Sleep, 100
	WinActivate, ahk_exe firefox.exe
	Sleep, 100
	Send, ^l
	Sleep, 100
	Send, https://xhamster.com/movies/^v{Enter}
return

{ ;~ ------------------------------------------------THUMBSPLUS (SLIDESHOW)-----------------------------------------------

;~ **Close Slideshow, Refresh Files**
#IfWinActive SlideShow
MButton::
Esc::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Esc}
	Sleep, 500
	Send, {F5}
return


;~ **Exit Slideshow, Scan Folder**
#IfWinActive SlideShow
^+F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Esc}
	WinWaitActive, ThumbsPlus 10 - Thumbs.tpdb8 ahk_exe Thumbs10.exe, , 3
	If ErrorLevel
		Exit
	Send, ^+{F3}
	Sleep, 100
	Send, {Down}
return

;~ **Exit SlideShow, Move Folder**
#IfWinActive SlideShow
^+!F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Esc}
	WinWaitActive, ThumbsPlus 10 - Thumbs.tpdb8 ahk_exe Thumbs10.exe, , 3
	If ErrorLevel
		Exit
	Send, +!{F5}
	WinWaitActive, Move Folder, , 3
	If ErrorLevel
		Exit
	Send, {Enter}
return

;~ **Exit SlideShow, Delete Folder**
#IfWinActive SlideShow
^+!F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Esc}
	WinWaitActive, ThumbsPlus 10 - Thumbs.tpdb8 ahk_exe Thumbs10.exe, , 3
	If ErrorLevel
		Exit
	Send, ^+{F6}
	WinWaitActive, ThumbsPlus ahk_class #32770
		Send, +{Tab}{SPACE}
return

;~ **Move File (Current Location)**
#IfWinActive SlideShow
^+!F7::
	KeyWait, Control, L
	KeyWait, Shift, L
	;~ SetKeyDelay, -1
	Send, +{F2}
	WinWaitActive, Move Files
	If ErrorLevel
		Exit
	Send, {ENTER}
return

;~ **Close Slideshow, Mass Rename 1, 2, 3, etc (All)**
#IfWinActive SlideShow
^+!F8::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	Send, {Esc}
	Sleep, 500
	Send, {F5}
	Sleep, 500
	Send, ^a
	Sleep, 50
	Send, +!{F2}
	WinWaitActive, Automatic File Rename, , 2
	If ErrorLevel
		Exit
	Send, p{Tab}1{Enter}
	Sleep, 500
	Send, {F5}
return

;~ **Move File (Prompt for Location)**
;~ #IfWinActive SlideShow
;~ ^+!F8::
	;~ KeyWait, Control, L
	;~ KeyWait, Shift, L
	;~ SetKeyDelay, 1
	;~ Send, +{F2}
	;~ WinWaitActive, Move Files
	;~ If ErrorLevel
		;~ Exit
	;~ WinWaitActive, ahk_class cswThumbsPlusView, , 3
	;~ If ErrorLevel
		;~ Exit
	;~ WinWaitNotActive, SlideShow
	;~ IfWinActive, ahk_class cswThumbsPlusView
		;~ WinSetTitle, SlideShow
	;~ WinActivate, SlideShow
	;~ Click, WD
;~ return

;~ **Copy File (Prompt for Location)**
#IfWinActive SlideShow
^+!F9::
	KeyWait, Control, L
	KeyWait, Shift, L
	;~ SetKeyDelay, -1
	Send, ^{F2}
	WinWaitActive, Copy Files
	If ErrorLevel
		Exit
	WinWaitActive, ahk_class cswThumbsPlusView, , 3
	If ErrorLevel
		Exit
	WinWaitNotActive, SlideShow
	IfWinActive, ahk_class cswThumbsPlusView
		WinSetTitle, SlideShow
	WinActivate, SlideShow
	Click, WD
return

;~ **Move File (Current Location)**
#IfWinActive SlideShow
^+!F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	;~ SetKeyDelay, -1
	Send, +{F2}
	WinWaitActive, Move Files
	If ErrorLevel
		Exit
	Send, {ENTER}
	;~ IfWinExist, Confirm File Replacement
	;~ {
		;~ WinActivate, Confirm File Replacement
		;~ Send, u
	;~ }
	WinWaitActive, ahk_class cswThumbsPlusView, , 3
	If ErrorLevel
		Exit
	WinSetTitle, SlideShow
	Click, WD
return

;~ **Previous Image**
#IfWinActive SlideShow ahk_class cswThumbsPlusView
^+F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	Click, WheelUp
return

;~ **Next Image**
#IfWinActive SlideShow ahk_class cswThumbsPlusView
^+F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Click, WheelDown
return

;~ **Delete Image**
#IfWinActive SlideShow
^+F3::
^+F7::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {Delete}
return

;~ **Move File (Dist.\Gallery)**
;~ #IfWinActive SlideShow
;~ ^+Insert::
	;~ KeyWait, Control, L
	;~ KeyWait, Shift, L
	SetKeyDelay, -1
	;~ Send, +{F2}
	;~ WinWaitActive, Move Files, , 3
	;~ If ErrorLevel
		;~ Exit
	;~ Send, F:\Rory's Collection\Workshop\Distribute\Gallery{ENTER}
	;~ WinWaitActive, ahk_class cswThumbsPlusView, , 3
	;~ If ErrorLevel
		;~ Exit
	;~ WinWaitNotActive, SlideShow
	;~ IfWinActive, ahk_class cswThumbsPlusView
		;~ WinSetTitle, SlideShow
	;~ WinActivate, SlideShow
	;~ Click, WD
;~ return

;~ **Move File (Dist.\Animation)**
#IfWinActive SlideShow
^+PGUP::
	KeyWait, Control, L
	KeyWait, Shift, L
	;~ SetKeyDelay, -1
	Send, +{F2}
	WinWaitActive, Move Files, , 3
	If ErrorLevel
		Exit
	Send, F:\Rory's Collection\Workshop\Distribute\Animation{ENTER}
	WinWaitActive, ahk_class cswThumbsPlusView, , 3
	If ErrorLevel
		Exit
	WinWaitNotActive, SlideShow
	IfWinActive, ahk_class cswThumbsPlusView
		WinSetTitle, SlideShow
	WinActivate, SlideShow
	Click, WD
return

;~ **Move File (Wallpaper\Import\Adult)**
#IfWinActive SlideShow
^+Delete::
	KeyWait, Control, L
	KeyWait, Shift, L
	;~ SetKeyDelay, -1
	Send, +{F2}
	WinWaitActive, Move Files, , 3
	If ErrorLevel
		Exit
	Send, C:\Hydrus\Import\Auto\Wallpaper\Desktop\002 - Adult{ENTER}
	WinWaitActive, ahk_class cswThumbsPlusView, , 3
	If ErrorLevel
		Exit
	WinWaitNotActive, SlideShow
	IfWinActive, ahk_class cswThumbsPlusView
		WinSetTitle, SlideShow
	WinActivate, SlideShow
	Click, WD
return
}
}

{ ;~ ------------------------------------------------VLC PLAYER-----------------------------------------------

;~ **Close VLC Window**
#IfWinActive VLC media player
Esc::
	Send, ^q
return

;~ **Open Hydrus Tagging Window**
#IfWinActive VLC media player
F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, #{F9}
	WinActivate, main - Hydrus Client ; ahk_class Qt652QWindowIcon
	Send, {F3}
	WinWaitActive, manage tags
	Sleep, 100
	Send, #{F9}
	WinWaitClose, manage tags
	Sleep, 100
	WinActivate, VLC media player
	Send, #{F9}
	return

;~ **Open Hydrus Ratings Window**
#IfWinActive VLC media player
F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, #{F9}
	WinActivate, main - Hydrus Client ; ahk_class Qt652QWindowIcon
	Send, {F4}
	WinWaitActive, manage ratings
	Sleep, 100
	Send, #{F9}
	WinWaitClose, manage ratings
	Sleep, 100
	WinActivate, VLC media player
	Send, #{F9}
	return

;~ **Set '#interspecies:canid (reality)' Tag**
#IfWinActive VLC media player
^+!F1::
	KeyWait, Control, L
	KeyWait, Shift, L
	WinActivate, main - Hydrus Client ; ahk_class Qt652QWindowIcon
	Send, ^m
	Sleep, 200
	Send, ^+{F1}
	Sleep, 200
	WinActivate, VLC media player
	MsgBox, 0, Hydrus Notification, The Following Tag(s) Have Been Applied: #interspecies:canid (reality) Tag, 1
	WinActivate, VLC media player
	Sleep, 100
return

;~ **Archive in Hydrus, Load Next Movie Externally**
#IfWinActive VLC media player
^+F2::
	KeyWait, Control, L
	KeyWait, Shift, L
	;~ Send, #{F9}
	;~ Send, {Space}
	WinClose, VLC media player
	WinActivate, main - Hydrus Client ; ahk_class Qt652QWindowIcon
	Sleep, 200
	Send, ^m
	Sleep, 200
	Send, {F7}
	Sleep, 500
	Send, {Right}
	Sleep, 200
	Send, ^{Enter}
	Sleep, 100
	WinActivate, VLC media player
	;~ Sleep, 500
	;~ Send, #{Numpad9}
	;~ Send, #{F9}
return

;~ **1 Minute Jump Back**
#IfWinActive VLC media player
^+F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^{Left}
return

;~ **1 Minute Jump Forward**
#IfWinActive VLC media player
^+F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^{Right}
return

;~ **Volume Up**
#IfWinActive VLC media player
^+F5::
	KeyWait, Control, L
	KeyWait, Shift, L
	WinGetActiveStats, WinTitle, WinWidth, WinHeight, WinX, WinY
	MouseMove, %WinX%, %WinY%
	Send, {WheelUp}
return

;~ **Delete Media in Hydrus, Load Next Movie Externally**
#IfWinActive VLC media player
^+F7::
	KeyWait, Control, L
	KeyWait, Shift, L
	;~ Send, #{F9}
	;~ Send, {Space}
	WinClose, VLC media player
	WinActivate, main - Hydrus Client ; ahk_class Qt652QWindowIcon
	Send, ^m
	Sleep, 100
	Send, {Delete}
	Sleep, 500
	Send, {Right}
	Sleep, 100
	Send, ^{Enter}
	Sleep, 100
	WinActivate, VLC media player
	;~ Sleep, 500
	;~ Send, #{Numpad9}
return

;~ **5 Minute Jump Back**
#IfWinActive VLC media player
^+F8::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^!{Left}
return

;~ **5 Minute Jump Forward**
#IfWinActive VLC media player
^+F9::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, ^!{Right}
return

;~ **Volume Down**
#IfWinActive VLC media player
^+F10::
	KeyWait, Control, L
	KeyWait, Shift, L
	WinGetActiveStats, WinTitle, WinWidth, WinHeight, WinX, WinY
	MouseMove, %WinX%, %WinY%
	Send, {WheelDown}
return

;~ **Open Tag Edit Window (F3)**
#IfWinActive VLC media player
^+F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	WinActivate, main - Hydrus Client ; ahk_class Qt652QWindowIcon
	Send, ^m
	Sleep, 100
	Send, {F3}
	Sleep, 200
	WinWaitActive, manage tags
	WinWaitNotActive, manage tags
	WinActivate, VLC media player
return

;~ **Mini Jump Back**
#IfWinActive VLC media player
^+!F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, +{Left}
return

;~ **Mini Jump Forward**
#IfWinActive VLC media player
^+!F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, +{Right}
return

;~ **Set 'export:trim video' Tag**
#IfWinActive VLC media player
^+!F7::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, #{F9}
	WinActivate, main - Hydrus Client ; ahk_class Qt652QWindowIcon
	Send, ^+{F7}
	Sleep, 100
	WinActivate, VLC media player
	Sleep, 100
	Send, #{F9}
	MsgBox, 0, Hydrus Notification, 'Export:Trim Video' Tag Applied, 1
	WinActivate, VLC media player
return

;~ **10 Second Jump Back**
#IfWinActive VLC media player
^+!F8::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, !{Left}
return

;~ **10 Second Jump Forward**
#IfWinActive VLC media player
^+!F9::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, !{Right}
return

;~ **Set '#inter:black male / white female' Tag**
#IfWinActive VLC media player
^+!F11::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, #{F9}
	WinActivate, main - Hydrus Client ; ahk_class Qt652QWindowIcon
	Send, +{F6}
	Sleep, 100
	WinActivate, VLC media player
	Sleep, 100
	Send, #{F9}
	MsgBox, 0, Hydrus Notification, -- The Following Tag(s) Have Been Applied: --`r`n`r`n#inter:black male / white female, 1
	WinActivate, VLC media player
return
}

{ ;~ ---------------------------------------------WALLPAPER ENGINE--------------------------------------------

;~ **Move to Bottom-Left Quarter of Screen**
#IfWinActive ahk_exe ui32.exe
#Numpad1::
	KeyWait, Control, L
	KeyWait, Shift, L
	KeyWait, LWin, L
	KeyWait, RWin, L
	WinMove, ahk_exe ui32.exe, , 0, 700, 1280, 700
return

;~ **Move to Bottom Half of Screen**
#IfWinActive ahk_exe ui32.exe
#Numpad2::
	KeyWait, Control, L
	KeyWait, Shift, L
	KeyWait, LWin, L
	KeyWait, RWin, L
	WinMove, ahk_exe ui32.exe, , 0, 700, 2560, 700
return

;~ **Move to Bottom-Right Quarter of Screen**
#IfWinActive ahk_exe ui32.exe
#Numpad3::
	KeyWait, Control, L
	KeyWait, Shift, L
	KeyWait, LWin, L
	KeyWait, RWin, L
	WinMove, ahk_exe ui32.exe, , 1280, 700, 1280, 700
return

;~ **Move to Left Half of Screen**
#IfWinActive ahk_exe ui32.exe
#Numpad4::
	KeyWait, Control, L
	KeyWait, Shift, L
	KeyWait, LWin, L
	KeyWait, RWin, L
	WinMove, ahk_exe ui32.exe, , 0, 0, 1280, 1400
return

;~ **Move to Right Half of Screen**
#IfWinActive ahk_exe ui32.exe
#Numpad6::
	KeyWait, Control, L
	KeyWait, Shift, L
	KeyWait, LWin, L
	KeyWait, RWin, L
	WinMove, ahk_exe ui32.exe, , 1280, 0, 1280, 1400
return

;~ **Move to Top-Left Quarter of Screen**
#IfWinActive ahk_exe ui32.exe
#Numpad7::
	KeyWait, Control, L
	KeyWait, Shift, L
	KeyWait, LWin, L
	KeyWait, RWin, L
	WinMove, ahk_exe ui32.exe, , 0, 0, 1280, 700
return

;~ **Move to Top Half of Screen**
#IfWinActive ahk_exe ui32.exe
#Numpad8::
	KeyWait, Control, L
	KeyWait, Shift, L
	KeyWait, LWin, L
	KeyWait, RWin, L
	WinMove, ahk_exe ui32.exe, , 0, 0, 2560, 700
return

;~ **Move to Top-Right Quarter of Screen**
#IfWinActive ahk_exe ui32.exe
#Numpad9::
	KeyWait, Control, L
	KeyWait, Shift, L
	KeyWait, LWin, L
	KeyWait, RWin, L
	WinMove, ahk_exe ui32.exe, , 1280, 0, 1280, 700
return
}

{ ;~ ---------------------------------------------WINDOWS EXPLORER--------------------------------------------

;~ **Copy Current File/Directory Name to Clipboard**
#IfWinActive ahk_class CabinetWClass
^+F12::
	KeyWait, Control, L
	KeyWait, Shift, L
	Clipboard =
	ControlGetFocus, Control1, A
	Send, {F2}^a^c{Escape}
	If %Control1% = SysTreeView321
		Send, {Tab}{Down}{Home}
return

;~ **Rename File with Clipboard Prefix**
#IfWinActive ahk_class CabinetWClass
^+!F3::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {F2}^{Home}^v - {Enter}
return

;~ **Rename File with Clipboard (Replace Entire File Name)**
#IfWinActive ahk_class CabinetWClass
^+!F4::
	KeyWait, Control, L
	KeyWait, Shift, L
	Send, {F2}^v{Enter}
return
}

{ ;~ ------------------------------------------GLOBAL (LOW PRIORITY)------------------------------------------

;~ **Volume Up**
;~ ^+F10::
	;~ Send, {Volume_Up}
;~ return

;~ **Mute Volume**
;~ ^+F11::
	;~ Send, {Volume_Mute}
;~ return

;~ **Volume Down**
;~ ^+F12::
	;~ Send, {Volume_Down}
;~ return

;~ **Left Mouse Click**
;~ ^+F6::
	;~ KeyWait, Control, L
	;~ KeyWait, Shift, L
	;~ Send, {Click}
;~ return

;~ **Maximize Window**
;~ #Up::
	;~ KeyWait, Control, L
	;~ KeyWait, Shift, L
	;~ SysGet, Mon2, MonitorWorkArea
	;~ WinMove, , , 0, 0, 2560, 1400
;~ return
}

{ ;~ ------------------------------------------------TEMP------------------------------------------------


;~ **Notepad - Add Wildcard and Copy line to Hydrus, Search in OR Format**
#IfWinActive, Notepad++
^+F2::
	KeyWait, Control, LAlt
	KeyWait, Shift, LAlt
	BlockInput, MouseMove
	Clipboard =
	Send, {Home}
	Sleep, 100
	Send, +{End}
	Sleep, 100
	Send, ^c
	ClipWait, 3
	WinActivate, ahk_exe hydrus_client.exe
	WinWaitActive, ahk_exe hydrus_client.exe
	Send, ^s
	Sleep, 100
	Send, {Tab 6}
	Sleep, 100
	Send, {Space}
	Sleep, 200
	Send, {Down 3}
	Sleep, 200
	Send, {Enter}
	Sleep, 200
	Send, ^s
	Sleep, 200
	Send, `*^v
	Sleep, 200
	Send, +{Down 3}
	Sleep, 200
	Send, +{Enter}
	Sleep, 200
	Send, {Up}
	Sleep, 200
	Send, {Enter}
	BlockInput, MouseMoveOff
return
}