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




;Pixel Values For a 1920x1080 resolution
RCP_x = 1690
RCP_y = 1030

;Declare Twitch Channel
TwitchChannel := "loltyler1 - Twitch"


IfWinExist %TwitchChannel%
{   
    WinActivate %TwitchChannel%
	WinMaximize 

    ;Loop %RCP%
    ;{
        Sleep 500
        Click %RCP_x% %RCP_y% 2
       ; Sleep 500
       ; Click %Buy_Confirmation_x% %Buy_Confirmation_y%
       ; Sleep 7000
       ; Click %Continue_x% %Continue_y%
       ; Sleep 500
    ;}
    
}
else
{
    MsgBox, "Chrome not found"
}
ExitApp