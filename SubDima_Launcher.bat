::========================= Info =========================
::
:: Version:	2.0
:: Harmful:	No
:: Folder(s):	%tmp%\SubDima
::
::========================================================
@echo on
title SubDima Launcher
echo %* | findstr /I "tstmd"
if /I "%errorlevel%" == "0" (
set test=1
title SubDima Launcher TEST MODE
)
if /I "%errorlevel%" == "1" set test=0
if /I "%1" == "copydone" goto :minimize
if /I "%1" == "restart" goto :restart
if /I "%1" == "min" goto :min
goto :ver

:ver
echo EXECUTING THIS WILL LEAVE THE COMPUTER IN A (TEMPORARILY) UNUSABLE STATE
echo DO YOU WANT TO CONTINUE? [Y/N]
choice /c YN /N
if /I "%errorlevel%" GEQ "2" exit
if /I "%errorlevel%" == "1" goto ver2

:ver2
cls
echo ARE YOU VERY, VERY SURE YOU WANT TO CONTINUE? [Y/N]
choice /c YN /N
if /I "%errorlevel%" GEQ "2" exit
if /I "%errorlevel%" == "1" goto continue

:continue
if exist "%tmp%\SUBDIMA" (
del /Q "%tmp%\SUBDIMA"
rmdir /Q "%tmp%\SUBDIMA"
)
mkdir "%tmp%\SUBDIMA" > nul
cd "%tmp%\SUBDIMA" > nul
cls
echo Copying files... (0/4)
copy /Y "%~dp0\SubDima_Main.bat" "%tmp%\SUBDIMA" > nul
cls
echo Copying files... (1/4)
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
echo GOOD LUCK
timeout /t 2 /nobreak > nul
if /I "%test%" == "1" (
    echo This displays when test mode is on and the launcher is about to restart
    start "" "%tmp%\SUBDIMA\SubDima_Launcher.bat" copydone tstmd
    exit
)
if /I "%test%" == "0" (
    start "" "%tmp%\SUBDIMA\SubDima_Launcher.bat" copydone
    exit
)

:minimize
if /I "%test%" == "1" (
    if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%tmp%\SUBDIMA\SubDima_Launcher.bat" min tstmd & exit
)
if /I "%test%" == "0" (
    if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%tmp%\SUBDIMA\SubDima_Launcher.bat" min & exit
)


:min
if /I "%test%" == "1" (
start /w /max "" "%tmp%\SUBDIMA\SubDima_Main.bat" init tstmd
)
if /I "%test%" == "0" (
start /w /max "" "%tmp%\SUBDIMA\SubDima_Main.bat" init
)
goto :restart

:restart
if /I "%test%" == "1" (
start /w /max "" "%tmp%\SUBDIMA\SubDima_Main.bat" restart tstmd
)
if /I "%test%" == "0" (
start /w /max "" "%tmp%\SUBDIMA\SubDima_Main.bat" restart
goto :restart