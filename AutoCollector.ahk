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

; ;Pixel Values For a 1920x1080 resolution
; RCP_x = 1690
; RCP_y = 1030


Gui, Add, Text,, Resolution Width:
Gui, Add, Text,, Resolution Height:
Gui, Add, Text,, Channel Name (Optional):

Gui, Add, Edit, w40 Number vResWidth ym, 1920  ; The ym option starts a new column of controls.
Gui, Add, Edit, w40 Number vResHeight, 1080
; Gui, Add, Edit, w40 Number vResWidth ym, 1690  ; The ym option starts a new column of controls.
; Gui, Add, Edit, w40 Number vResHeight, 1030

Gui, Add, Edit, w120 Limit vChannelName, Twitch
Gui, Add, Button, default xm, OK
Gui, Show,, Twitch AutoCollector
return ;End auto-execution, wait for user input

GuiClose:
ExitApp
ButtonOK:
Gui, submit


; TwitchChannel := %ChannelName% + " - Twitch"
TwitchChannel = %ChannelName%
; TwitchChannel = %TwitchChannel% - Twitch

;Pixel Values For a 1920x1080 resolution
; RCP_x = %ResWidth% 
; RCP_y = %ResHeight% 

;For Dynamic Resolution
RCP_x = %ResWidth% 
RCP_y = %ResHeight% 
RCP_x := RCP_x * .89
RCP_y := RCP_y * .954

;Set this to 1 for starts with, 2 for includes, 3 for exact
SetTitleMatchMode, 2

; WinGet, OutputVar, ProcessName, %TwitchChannel%
; MsgBox % "process found " . OutputVar

WinGetTitle, FoundWindow , %TwitchChannel%
; MsgBox % "twitch window " . FoundWindow



SetTitleMatchMode, 3
Loop 
{
    if WinExist(FoundWindow) AND (FoundWindow > 1)
    {   
        ; MsgBox % "The found window's ID is " . WinExist(FoundWindow)
        WinActivate, %FoundWindow%  ; Blank will use the last found window.
        WinMaximize, %FoundWindow%
        Sleep 1000
        Click %RCP_x% %RCP_y% 1
        ; Sleep 7000
        Sleep 305000
    }
    else
    {
        MsgBox, "Twitch Window not found"
        break  ; Break out of this loop.
    }

    
} 

ExitApp