::========================= Info =========================
::
:: Version:	2.0
:: Harmful:	No
:: Folder(s):	%tmp%\SubDima
::
::========================================================
@echo off
title SubDima Launcher
echo %* | findstr /I "tstmd"
if /I "%errorlevel%" == "0" (
set test=1
title SubDima Launcher TEST MODE
)
if /I "%errorlevel%" == "1" set test=0
if /I "%1" == "copydone" goto :min
if /I "%1" == "restart" goto :restart
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%0" background & exit
goto :ver

:ver
cscript //NoLogo echo.vbs "EXECUTING THIS WILL LEAVE THE COMPUTER IN A (TEMPORARILY) UNUSABLE STATE\n\nDO YOU WANT TO CONTINUE?" "vbYesNo+vbExclamation+vbDefaultButton2+vbSystemModal" "SubDima"
set result=%errorlevel%
if /I "%errorlevel%" == "7" exit
if /I "%errorlevel%" == "6" goto ver2
exit

:ver2
cscript //NoLogo echo.vbs "ARE YOU VERY, VERY SURE YOU WANT TO CONTINUE?" "vbYesNo+vbExclamation+vbDefaultButton2+vbSystemModal" "SubDima"
set result=%errorlevel%
if /I "%errorlevel%" GEQ "7" exit
if /I "%errorlevel%" == "6" goto continue
exit

:continue
if exist "%tmp%\SUBDIMA" (
del /Q "%tmp%\SUBDIMA"
rmdir /Q "%tmp%\SUBDIMA"
)
mkdir "%tmp%\SUBDIMA" > nul
cd "%tmp%\SUBDIMA" > nul
cls
echo Copying files... (1/4)
copy /Y "%~dp0\SubDima_Main.bat" "%tmp%\SUBDIMA" > nul
cls
echo Copying files... (2/4)
copy /Y "%~dp0\SubDima_Launcher.bat" "%tmp%\SUBDIMA" > nul
cls
echo Copying files... (3/4)
copy /Y "%~dp0\taskender.bat" "%tmp%\SUBDIMA" > nul
cls
echo Copying files... (4/4)
copy /Y "%~dp0\notepad.vbs" "%tmp%\SUBDIMA" > nul
cls
echo Copying files... (4/4) DONE
echo.
if /I "%test%" == "1" echo TEST MODE IS ON
echo.
cscript //NoLogo echo.vbs "GOOD LUCK!" "vbOKOnly+vbExclamation" "SubDima"
timeout /t 2 /nobreak > nul
if /I "%test%" == "1" (
    start "" "%tmp%\SUBDIMA\SubDima_Launcher.bat" copydone tstmd
    exit
)
if /I "%test%" == "0" (
    start "" "%tmp%\SUBDIMA\SubDima_Launcher.bat" copydone
    exit
)

:min
set restarts=0
if /I "%test%" == "1" (
echo N | start /w /max "" "%tmp%\SUBDIMA\SubDima_Main.bat" init tstmd
)
if /I "%test%" == "0" (
echo N | start /w /max "" "%tmp%\SUBDIMA\SubDima_Main.bat" init
)
goto :restart

:restart
set /A restarts+=1
echo %restarts% > "%tmp%\SUBDIMA\count"
if /I "%test%" == "1" (
echo N | start /w /max "" "%tmp%\SUBDIMA\SubDima_Main.bat" restart tstmd
)
if /I "%test%" == "0" (
echo N | start /w /max "" "%tmp%\SUBDIMA\SubDima_Main.bat" restart
)
goto :restart