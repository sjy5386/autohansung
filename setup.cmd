@echo off
pushd %~dp0
set session=%random%
goto main

:add
for %%a in ("profile/*.xml") do (
	netsh wlan add profile filename="profile/%%a" user=all
)
goto :EOF

:export
if not exist "%appdata%/AutoHansung/backup/%session%" (
	mkdir "%appdata%/AutoHansung/backup/%session%"
)
for %%a in ("profile/*.xml") do (
	netsh wlan export profile name=%%~na folder="%appdata%/AutoHansung/backup/%session%"
)
goto :EOF

:main
echo AutoHansung
echo.
echo This script backs up your existing network profile before continuing.
call :export
echo.
echo This script will add a network profile.
echo User information will be saved, so please set it on your personal PC only.
echo Wi-Fi connection may be lost during setup.
pause
call :add
if not %errorlevel% == 0 (
	pause
)
