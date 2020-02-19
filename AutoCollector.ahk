;Window Mode 1024x768
;Pack Coordinates

; VP_x = 160
; VP_y = 490
; SP_x = 160
; SP_y = 540
; PSP_x = 160
; PSP_y = 590
; ;scroll down thrice
; JEP_x = 160
; JEP_y = 490
; AP_x = 160
; AP_y = 540
; RP_x = 160
; RP_y = 590

; Buy_Confirmation_x = 445
; Buy_Confirmation_y = 422

; Buy_Credits_x = 400
; Buy_Credits_y = 400

; Continue_x = 884
; Continue_y = 647




; ;Pixel Values For a 1920x1080 resolution
; RCP_x = 1690
; RCP_y = 1030

;Declare Twitch Channel
;TwitchChannel := "loltyler1 - Twitch"


Gui, Add, Text,, Resolution Width:
Gui, Add, Text,, Resolution Height:
; Gui, Add, Text,, Channel Name:

; Gui, Add, Edit, w40 Number vResWidth ym, 1920  ; The ym option starts a new column of controls.
; Gui, Add, Edit, w40 Number vResHeight, 1080

Gui, Add, Edit, w40 Number vResWidth ym, 1690  ; The ym option starts a new column of controls.
Gui, Add, Edit, w40 Number vResHeight, 1030
; Gui, Add, Edit, w300 Limit vChannelName, Maximilian_DOOD
Gui, Add, Button, default xm, OK
Gui, Show,, Twitch AutoCollector
return ;End auto-execution, wait for user input

GuiClose:
ExitApp
ButtonOK:
Gui, submit

; IfWinExist %TwitchChannel%
; {   
;     WinActivate %TwitchChannel%
; 	WinMaximize 

; TwitchChannel := %ChannelName% + " - Twitch"
TwitchChannel = %ChannelName%
TwitchChannel = %TwitchChannel% - Twitch

;Pixel Values For a 1920x1080 resolution
RCP_x = %ResWidth% 
RCP_y = %ResHeight% 

;For Dynamic Resolution
; RCP_x = %ResWidth% 
; RCP_y = %ResHeight% 
; RCP_x := RCP_x * .899
; RCP_y := RCP_y * .954

;Set this to 1 for starts with, 2 for includes, 3 for exact
SetTitleMatchMode, 2

; WinGet, OutputVar, ProcessName, %TwitchChannel%
; MsgBox % "process found " . OutputVar

WinGetTitle, OutputVar2 , Twitch
; MsgBox % "twitch window " . OutputVar2



SetTitleMatchMode, 3

if WinExist(OutputVar2) 
{   
    Loop 
    {
        ; IfWinExist %TwitchChannel%
        ; if WinExist("ahk_class Notepad") or WinExist("ahk_class" . ClassName)
        ; if WinExist(OutputVar2) 

        IfWinNotExist %OutputVar2%
        {
            MsgBox, "IfWinNotExist Twitch not found"
            break  ; Break out of this loop.
        }
        
        IfWinExist %OutputVar2%
        {   
            ; MsgBox % "The active window's ID is " . WinExist("Twitch")
            WinActivate, %OutputVar2%  ; Uses the last found window.
            ; WinActivate %TwitchChannel%
	        WinMaximize, %OutputVar2%
            ; Sleep 300000
            Sleep 2000
            Click %RCP_x% %RCP_y% 1
            ; Sleep 2000
            Sleep 305000
            ; Sleep 500
            ; Click %Buy_Confirmation_x% %Buy_Confirmation_y%
            ; Sleep 7000
            ; Click %Continue_x% %Continue_y%
            ; Sleep 500

            ; if not IfWinExist %TwitchChannel%  ; The user signaled the loop to stop by pressing Win-Z again.
            ; break  ; Break out of this loop.
        }
        else
        {
            MsgBox, "Twitch not found"
            break  ; Break out of this loop.
        }

        
    }
}
else
{
    MsgBox, "Twitch not found"
    ; break  ; Break out of this loop.
}    
    
; }
; else
; {
;     MsgBox, "Chrome not found"
; }
ExitApp