@echo off
REM All-in-one GitKraken crack script for Windows
REM Run this after each GitKraken update.

setlocal enabledelayedexpansion

REM Find latest GitKraken app directory
set "GK_BASE=%LOCALAPPDATA%\gitkraken"

if not exist "%GK_BASE%" (
    echo Error: GitKraken not found at %GK_BASE%
    exit /b 1
)

REM 1. Kill GitKraken if running
tasklist /FI "IMAGENAME eq gitkraken.exe" 2>NUL | find /I /N "gitkraken.exe" >NUL
if "%ERRORLEVEL%"=="0" (
    echo ==^> Closing GitKraken...
    taskkill /IM gitkraken.exe /F >NUL 2>&1
    timeout /t 3 /nobreak >NUL
)

REM 2. Run patcher
echo ==^> Running patcher...
cd /d "%~dp0"
call yarn gitkrapro patcher
if %ERRORLEVEL% neq 0 (
    echo Error: Patcher failed!
    exit /b 1
)

echo ==^> All done! You can open GitKraken now.
pause
