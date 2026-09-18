# Radial Gear Shifter OSD

A lightweight, borderless on-screen display (OSD) that turns your gamepad's right analog stick into a fully functional 8-position H-shifter. Originally designed for heavy simulation titles like Euro Truck Simulator 2, this tool provides instant visual feedback without stealing window focus from your game.

## Features
* **Visual Gear Overlay:** A clean, high-contrast radial menu displays your current gear in real-time.
* **Plug-and-Play Detection:** Automatically binds to your active USB gamepad (fully compatible with Xbox controllers, and generic xinput gamepads).
* **8-Way Octant Mapping:** Translates precise analog stick angles directly into digital Numpad inputs(which stays activated until gear is changed to mimic an actual h shifter).

## Installation & Usage
1. Navigate to the **Releases** page on the right side of this repository.
2. Download the latest `Radial-Gear-Shifter.exe` file.
3. Right-click the `.exe` file and select **Run as Administrator**. *(Note: Running as an administrator is strictly required for the script to successfully send keystrokes into active full-screen game windows).*
4. To close the script when you are done playing, look for the application icon in your Windows system tray (bottom right corner of your screen), right-click it, and select **Exit**.

## In-Game Setup

Before modifying your game files, you must configure your base controller settings to prevent the right analog stick from conflicting with the new shifter overlay.

### 1. Input Wizard Configuration
1. Launch Euro Truck Simulator 2 and navigate to **Options > Controls**.
2. Run the **Input Wizard**, select **Controllers**, and choose the **H-Shifter** transmission layout.
3. When prompted for clutch assignment, bind your **Clutch Axis** to the **Left Stick Y-Axis** (Pushing up or down on the left analog stick).(or you can use own preferred control for clutch except the right stick).
4. Unbind the right stick axis used for looking left right and looking up down(to unbind, map the steering to right stick and then change it back to normal left stick).
5. Exit the wizard and scroll through your control keybinds to completely **unbind all Right Stick assignments and numpad 1to8 assignments** (such as looking left/right/up/down). If you skip this step, your camera will spin erratically every time you shift gears.
6. Close the game.

### 2. Controls.sii Configuration
Because Euro Truck Simulator 2 restricts mapping keyboard keys to H-shifter positions through the settings menu when a gamepad is active, you must manually route the script's Numpad outputs to your transmission by editing your controls file.

### Optional: manually edit the controls.sii file

1. Open File Explorer and navigate to your profiles directory: 
   `Documents\Euro Truck Simulator 2\profiles(or steam_profiles)`
2. Open your specific profile folder (the folder name will be a long string of numbers and letters).
3. Right-click the `controls.sii` file and open it with Notepad.
4. Press **Ctrl + F** to locate the `mix gear1` lines. Change the text inside the quotation marks to match the exact lines below. *(Note: Do not alter the `config_lines[Number]` at the start of your rows; just replace the bindings inside the quotes).*

   ```text
   config_lines[XXX]: "mix gear1 `di8.keyboard.num1?0 | semantical.gear1?0`"
   config_lines[XXX]: "mix gear2 `di8.keyboard.num2?0 | semantical.gear2?0`"
   config_lines[XXX]: "mix gear3 `di8.keyboard.num3?0 | semantical.gear3?0`"
   config_lines[XXX]: "mix gear4 `di8.keyboard.num4?0 | semantical.gear4?0`"
   config_lines[XXX]: "mix gear5 `di8.keyboard.num5?0 | semantical.gear5?0`"
   config_lines[XXX]: "mix gear6 `di8.keyboard.num6?0 | semantical.gear6?0`"
   config_lines[XXX]: "mix gear7 `di8.keyboard.num7?0 | semantical.gear7?0`"

5. Save the file (**Ctrl + S**) and close Notepad.
6. Launch the game, navigate to **Options > Controls**, and ensure your Transmission is set to **H-Shifter**.

### Optiona2: Use the Pre-Configured controls.sii

If you prefer not to edit the text file manually, you can download the `controls.sii` file provided in this repository.

1. Download the `controls.sii` file from the main repository page.
2. Navigate to your profile folder at `Documents\Euro Truck Simulator 2\profiles(or steam_profiles)\[Your Profile ID]`.
3. Rename your existing `controls.sii` file to `controls_backup.sii` to safely preserve your old settings.
4. Paste the downloaded `controls.sii` into the folder.
5. Open the new file in Notepad to modify any other personal keybinds or sensitivity settings to match your specific needs.

## How to Modify the Script
If you want to change the visual layout, screen coordinates, or specific Numpad keybinds, you can edit the raw source code rather than using the pre-compiled `.exe`.

1. Download the `Radial-Gear-Shifter.ahk` file from this repository.
2. Install [AutoHotkey v1](https://www.autohotkey.com/).
3. Right-click the `.ahk` file and select **Edit Script** (or open it in Notepad).

**Changing the Menu Position**
By default, the radial menu appears at a fixed coordinate on the screen. To center it perfectly for your specific monitor's resolution, scroll to the very bottom of the script and locate this line:

`Gui, Radial:Show, x350 y500 w160 h160 NoActivate, GearRadial`

Adjust the `x350` (horizontal positioning) and `y500` (vertical positioning) values to fit your screen(it is set at center by default. ie, x and y values will be absent so just add the values like mentioned in the line and edit the values to your liking). Once you have made your changes, save the file, right-click the `.ahk` document, and select **Compile Script** to generate your own customized `.exe` file.
