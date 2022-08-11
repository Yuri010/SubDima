# SubDima
SubDima is just an educational fake trojan / virus. It copies itself to your temp folder and has a random key (4-20 digits) to exit.

## Origin
I just came up with random things it *is*, and I discovered manually distributed as one of them.
Manually distributed > Manual Distribution > Anagram= Subdural Intimation > Short= SubDima.

Sadly, I lost the original version, so I decided to make a version 2.0.
Here it is!

## How To
To start this script, simply execute the SubDima_Launcher.bat\
OPENING ANY OTHER FILES CAN HAVE UNFORSEEN CONSEQUENCES

To start the script in test mode (disables payload and automatically removes the remaining temporary files after closing):
1. Open a new CMD window in the directory where SubDima is stored
2. execute ``SubDima_Launcher.bat tstmd``

### RECOVERY
**To recover from this script, please folow the steps below.** 
1. Reboot your PC by clicking and / or holding the power button.
2. Start the computer if it hasn't already and log-in (If needed)
3. Navigate to your temporary files folder (This folder is located at %tmp% or C:\Users\<User>\Appdata\Local\Temp) in that folder, delete the subfolder called "SUBDIMA".

**In case you have access to Task Manager and Powershell, you can also follow these steps**:
1. Do Ctrl+Shift+Esc (to open Task Manager)
2. Go to File > New Task and type ``Powershell``
3. In the Powershell window, type ``taskkill -im cmd.exe /f; explorer.exe``. This will kill all the CMD windows and start Explorer so you have a UI again :)

**If you are in test mode**:
1. Simply enter the recovery key ``dimsum`` or the key displayed (4-20 numbers at the "for the sake of testing (...)")
2. It will automatically kill itself and remove the %tmp%\SUBDIMA. Then it starts Explorer again so you have a UI :)

***

## TERMS OF USE AND ADDITIONAL INFORMATION

### General
"I", "me" and "the creator" indicate the initial coder of this script. "one" indicates the person executing.
If you have never heard of subdima, please delete it for your pc's safety.

USE THIS SCRIPT AT YOUR OWN RISK AND RESPONSIBILITIES
 
### About

"the creator" grants you a non-exclusive, limited license to use the program on own property.
Other machines should only be used with this script with the permission of the rightful owner of that pc.
EVEN THOUGH THE NAME IS AN ANAGRAM OF MANUAL DISTRIBUTION, THE CREATOR DOES NOT ENDORSE NOR SUPPORT THIS.
The creator is not responsible to any damage to property, files and others. The one responsible is the "one" executing this script.
 
### LICENSING
This work is licensed under the CIR-License, found at https://github.com/Yuri010/CIR-License

### PRIVACY
This script does NOT collect ANY data of ANY kind.
SubDima only stores itself in the temporary files folder located at %tmp%\subdima. You may delete this folder at any time.
