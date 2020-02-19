;Twitch AutoCollector
;Credit: Mamorri

; ;Pixel Values For a 1920x1080 resolution
; RCP_x = 1690
; RCP_y = 1030

Gui, Add, Text,, Resolution Width:
Gui, Add, Text,, Resolution Height:
Gui, Add, Text,, Channel Name (Optional):

Gui, Add, Edit, w40 Number vResWidth ym, 1920  ; The ym option starts a new column of controls.
Gui, Add, Edit, w40 Number vResHeight, 1080

Gui, Add, Edit, w120 Limit vChannelName, Twitch
Gui, Add, Button, default xm, OK
Gui, Show,, Twitch AutoCollector
return ;End auto-execution, wait for user input

GuiClose:
ExitApp
ButtonOK:
Gui, submit


;Pixel Values For a Set resolution (ex. 1920x1080)
; RCP_x = %ResWidth% 
; RCP_y = %ResHeight% 

;For Dynamic Resolution
RCP_x = %ResWidth% 
RCP_y = %ResHeight% 
RCP_x := RCP_x * .885
RCP_y := RCP_y * .954

;Set this to 1 for starts with, 2 for includes, 3 for exact
SetTitleMatchMode, 2

WinGet, OutputVar, ProcessName, %ChannelName%                               ;DEBUGGING
; MsgBox % "process found " . OutputVar                                     ;DEBUGGING

WinGetTitle, FoundWindow , %ChannelName%
; MsgBox % "twitch window " . FoundWindow                                   ;DEBUGGING


SetTitleMatchMode, 3
Loop 
{
    if WinExist(FoundWindow) AND (FoundWindow > 1)
    {   
        ; MsgBox % "The found window's ID is " . WinExist(FoundWindow)      ;DEBUGGING
        WinActivate, %FoundWindow%  ; Blank will use the last found window.
        WinMaximize, %FoundWindow%
        Sleep 1000
        Click %RCP_x% %RCP_y% 1
        Sleep 1000
        ; WinMinimize, %FoundWindow%
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