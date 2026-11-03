@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"
title Shivaay Enterprises - Local Website
echo.
echo  Starting your website...
echo.
set PY=
where python >nul 2>nul && set PY=python
if "%PY%"=="" where py >nul 2>nul && set PY=py
if "%PY%"=="" (
  echo  Python is not installed. Download it from https://www.python.org/downloads/
  echo  and tick "Add Python to PATH" during installation. Then run this file again.
  pause
  exit /b
)
echo  On this computer : http://localhost:8000
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
  set ip=%%a
  set ip=!ip: =!
  echo  Same Wi-Fi users : http://!ip!:8000
)
echo.
echo  Keep this window open. Close it to stop the website.
echo.
start "" http://localhost:8000
%PY% -m http.server 8000
pause
