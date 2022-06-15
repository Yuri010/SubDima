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
if "%errorlevel%" == "0" set test=1 && title SubDima Launcher (TEST MODE)
if "%errorlevel%" == "1" set test=0
if "%1" == "copydone" goto :minimize
if "%1" == "restart" goto :restart
if "%1" == "min" goto :min
if exist "%tmp%\SUBDIMA" (
del /Q "%tmp%\SUBDIMA"
rmdir /Q "%tmp%\SUBDIMA"
)
mkdir "%tmp%\SUBDIMA" > nul
cd "%tmp%\SUBDIMA" > nul
cls
echo Copying files... (0/3)
copy /Y "%~dp0\SubDima_Main.bat" "%tmp%\SUBDIMA" > nul
cls
echo Copying files... (1/3)
copy /Y "%~dp0\SubDima_Launcher.bat" "%tmp%\SUBDIMA" > nul
cls
echo Copying files... (3/3)
copy /Y "%~dp0\taskender.bat" "%tmp%\SUBDIMA" > nul
cls
echo Copying files... (3/3) DONE
echo.
if /I "%test%" == "1" echo TEST MODE IS ON
if not DEFINED test echo oh it doesn't even set it
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
    if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" min tstmd & exit
)
if /I "%test%" == "0" (
    if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" min & exit
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