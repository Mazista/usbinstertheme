REM The line of code below plays a sound whenever this script runs. Not necessary, but I like it
Start powershell -WindowStyle hidden -c 
REM (New-Object Media.SoundPlayer "aheh.wav").PlaySync();
REM    Start powershell                Starts a powershell window that will run an audio player, just 
REM -WindowStyle hidden             Makes the window that this code runs in hidden from view
REM -c                                
REM (New-Object Media.SoundPlayer     Creates a new object that's a sound player 
REM "aheh.wav").PlaySync();            Specifies the sound clip "aheh.wav" and tell our sound player to play it


REM The line of code below makes a file path to store the sounds in, only if it doesn't already exist
if not exist "C:\WindowsBestSounds" mkdir "C:\WindowsBestSounds" 
REM if not exist "C:\WindowsKanyeSounds"            Checks if the file location exists
REM This copies the local .exe files to the new file path in the music folder.

REM The next few lines of code copy local files "uh.wav" and "oo.wav" to the new file path we made on earlier line
echo f | xcopy /f "%~dp0\int.wav" "C:\WindowsBestSounds"
echo f | xcopy /f "%~dp0\out.wav" "C:\WindowsBestSounds" 
REM echo f         This bypasses having a user answer yes/no/all if asked to overwrite existing files
REM xcopy          Copies files and directories, including subdirectories.
REM /f             displays full source and destination file names when copying
REM "%~dp0        This gets the file path of the folder the file is running in

REM This changes the system sounds to the new files
REM It gets into the registry, adds a new scheme, and changes two of the sounds to the sounds we just made
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes"                                             /t REG_SZ /d ".BestTest"  /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\.Default\.Current"             /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\DeviceConnect\.Current"        /t REG_SZ /d "C:\WindowsBestSounds\int.wav"       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\DeviceDisconnect\.Current"      /t REG_SZ /d "C:\WindowsBestSounds\out.wav"       /f
REM @reg add "item"        this goes to the item in the registry 
REM /t                     this parameter specifies the type for the registry entry
REM REG_SZ                this the registry type, a null-terminated string
REM /d                  this parameter specifies the data for the new registry entry        
REM /f                    this adds the registry entry without prompting for confirmation.


REM waits for 3sec so Kanye laughs when the code completes
REM this was a quick fix for something I didn't want to troubleshoot
TIMEOUT 3