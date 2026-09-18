#Persistent
/*
8-Zone Radial Gear Shifter OSD
--------------------------------
In-game Setup: Map Gears 1-8 to Numpad 1-8. 
Controls: Push the Right Analog Stick in any of the 8 directions to shift. Click R3 for Neutral.

Note: If the radial menu appears in the wrong spot, scroll to the bottom of the script 
and adjust the x350 y500 coordinates to match your screen resolution.
*/
SetKeyDelay, 50, 50
CurrentGear := 0

; --- SETUP RADIAL OSD GUI ---
; Creates a borderless, click-through overlay
Gui, Radial:New, +AlwaysOnTop -Caption +ToolWindow +LastFound +E0x20
Gui, Radial:Color, FF00FF ; Use pure magenta to prevent dark anti-aliasing
WinSet, TransColor, FF00FF ; Make magenta completely transparent
Gui, Radial:Font, s24 wBold, Segoe UI

; Create the circular layout matching your 8-zone stick directions
Gui, Radial:Add, Text, x65 y10 w30 h35 vG5 Center cWhite, 4   ; Up
Gui, Radial:Add, Text, x105 y20 w30 h35 vG6 Center cWhite, 5  ; Up-Right
Gui, Radial:Add, Text, x120 y60 w30 h35 vG7 Center cWhite, 6  ; Right
Gui, Radial:Add, Text, x105 y100 w30 h35 vG8 Center cWhite, N ; Down-Right
Gui, Radial:Add, Text, x65 y115 w30 h35 vG1 Center cWhite, R  ; Down
Gui, Radial:Add, Text, x25 y100 w30 h35 vG2 Center cWhite, 1  ; Down-Left
Gui, Radial:Add, Text, x10 y60 w30 h35 vG3 Center cWhite, 2   ; Left
Gui, Radial:Add, Text, x25 y20 w30 h35 vG4 Center cWhite, 3   ; Up-Left

; Keep the center Neutral indicator for your R3 stick click
Gui, Radial:Add, Text, x65 y60 w30 h35 vGN Center cLime, -

; --- AUTO-DETECT CONTROLLER ID ---
JoyID := 0
Loop, 16 {
    GetKeyState, JoyName, %A_Index%JoyName
    if (JoyName != "") {
        JoyID := A_Index
        break
    }
}

if (JoyID = 0) {
    MsgBox, No controller detected! Please wake up your controller and reload the script.
    ExitApp
}

; Show the menu immediately upon starting the script
ShowRadialGear(0) 

SetTimer, WatchStick, 50
return

WatchStick:
; Dynamically reads from whichever ID Windows assigned
GetKeyState, rX, %JoyID%JoyU
GetKeyState, rY, %JoyID%JoyR
GetKeyState, rClick, %JoyID%Joy10 ; Right Stick Button (R3)

; --- NEUTRAL BUTTON LOGIC ---
if (rClick = "D") {
    Loop, 8 {
        Send {Numpad%A_Index% up}
    }
    CurrentGear := 0
    LastStickZone := 0 ; Reset stick state
    
    ShowRadialGear(0) ; 0 indicates Neutral
    
    ; Wait for button release to prevent rapid toggling
    KeyWait, %JoyID%Joy10 
    return
}

StickZone := 0

; --- 8-ZONE LOGIC (Octants) ---
if (rX > 35 and rX < 65 and rY > 75)
    StickZone := 1
else if (rX < 35 and rY > 65)
    StickZone := 2
else if (rX < 25 and rY > 35 and rY < 65)
    StickZone := 3
else if (rX < 35 and rY < 35)
    StickZone := 4
else if (rX > 35 and rX < 65 and rY < 25)
    StickZone := 5
else if (rX > 65 and rY < 35)
    StickZone := 6
else if (rX > 75 and rY > 35 and rY < 65)
    StickZone := 7
else if (rX > 65 and rY > 65)
    StickZone := 8

; --- EXECUTION ---
if (StickZone != LastStickZone) {
    if (StickZone != 0) {
        
        ; Only trigger mechanical keyboard outputs if the gear is actually changing
        if (StickZone != CurrentGear) {
            Loop, 8 {
                Send {Numpad%A_Index% up}
            }
            Sleep, 20
            Send {Numpad%StickZone% down}
            CurrentGear := StickZone
        }
        
        ; Update the visual menu to highlight the new gear
        ShowRadialGear(CurrentGear)
    }
    LastStickZone := StickZone
}

SetTimer, WatchStick, 50
return

; --- GUI FUNCTIONS ---
ShowRadialGear(Active) {
    ; Reset all text to pure white
    Gui, Radial:Font, cWhite
    Loop, 8 {
        GuiControl, Radial:Font, G%A_Index%
    }
    GuiControl, Radial:Font, GN
    
    ; Highlight the active gear to bright lime green
    Gui, Radial:Font, cLime
    if (Active = 0)
        GuiControl, Radial:Font, GN
    else
        GuiControl, Radial:Font, G%Active%
        
    ; Show the GUI on the left side (x50) and vertically centered
    Gui, Radial:Show, x400 y500 w160 h160 NoActivate, GearRadial
}
