# Radial-Gear-Controller
A lightweight, borderless on-screen display (OSD) that turns your gamepad's analog stick into a fully functional 8-position H-shifter. Designed for simulation titles (eg:ETS 2), this tool provides instant visual feedback without stealing window focus from your game.
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
