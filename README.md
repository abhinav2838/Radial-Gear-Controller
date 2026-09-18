# Radial Gear Shifter OSD

A lightweight, borderless on-screen display (OSD) that turns your gamepad's right analog stick into a fully functional 8-position H-shifter. Originally designed for heavy simulation titles like Euro Truck Simulator 2, this tool provides instant visual feedback without stealing window focus from your game.

## Features
* **Visual Gear Overlay:** A clean, high-contrast radial menu displays your current gear in real-time.
* **Plug-and-Play Detection:** Automatically binds to your active USB gamepad (fully compatible with EvoFox Elite X2, Xbox controllers, and generic gamepads).
* **8-Way Octant Mapping:** Translates precise analog stick angles directly into digital Numpad inputs.
* **Quick Neutral:** Click the right analog stick (R3) to instantly drop the transmission into Neutral.

## Installation & Usage
1. Navigate to the **Releases** page on the right side of this repository.
2. Download the latest `Radial-Gear-Shifter.exe` file.
3. Right-click the `.exe` file and select **Run as Administrator**. *(Note: Running as an administrator is strictly required for the script to successfully send keystrokes into active full-screen game windows).*
4. To close the script when you are done playing, look for the green "H" icon in your Windows system tray (bottom right corner of your screen), right-click it, and select **Exit**.

## In-Game Setup
Because Euro Truck Simulator restricts mapping keyboard keys to H-shifter positions through the settings menu when a gamepad is active, you must manually route the script's Numpad outputs to your transmission by editing your controls file.

1. Open File Explorer and navigate to your profiles directory: 
   `Documents\Euro Truck Simulator 2\profiles`
2. Open your specific profile folder (the folder name will be a long string of numbers and letters).
3. Right-click the `controls.sii` file and open it with Notepad.
4. Press **Ctrl + F** to locate the gear mix lines. Change the text inside the quotation marks to match the exact lines below. *(Note: Do not alter the `config_lines[Number]` at the start of your rows, only replace the bindings inside the quotes).*

   ```text
   config_lines[XXX]: "mix gearrev `keyboard.num1?0`"
   config_lines[XXX]: "mix gear1 `keyboard.num2?0`"
   config_lines[XXX]: "mix gear2 `keyboard.num3?0`"
   config_lines[XXX]: "mix gear3 `keyboard.num4?0`"
   config_lines[XXX]: "mix gear4 `keyboard.num5?0`"
   config_lines[XXX]: "mix gear5 `keyboard.num6?0`"
   config_lines[XXX]: "mix gear6 `keyboard.num7?0`"
   config_lines[XXX]: "mix gear7 `keyboard.num8?0`"

## How to Modify the Script
If you want to change the visual layout, screen coordinates, or specific Numpad keybinds, you can edit the raw source code rather than using the pre-compiled `.exe`.

1. Download the `Radial-Gear-Shifter.ahk` file from this repository.
2. Install [AutoHotkey v1](https://www.autohotkey.com/).
3. Right-click the `.ahk` file and select **Edit Script** (or open it in Notepad).

**Changing the Menu Position**
By default, the radial menu appears at a fixed coordinate on the screen. To center it perfectly for your specific monitor's resolution, scroll to the very bottom of the script and locate this line:

`Gui, Radial:Show, x350 y500 w160 h160 NoActivate, GearRadial`[cite: 2]

Adjust the `x350` (horizontal positioning) and `y500` (vertical positioning) values to fit your screen[cite: 2]. Once you have made your changes, save the file, right-click the `.ahk` document, and select **Compile Script** to generate your own customized `.exe` file.
