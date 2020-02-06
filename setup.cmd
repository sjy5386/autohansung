@echo off
pushd %~dp0
set session=%random%
goto main

rem Add network profiles.
:add
for %%a in ("profile/*.xml") do (
	netsh wlan add profile filename="profile/%%a" user=all
)
goto :EOF

rem Export network profiles.
rem @param folder
:export
if not exist %1 (
	mkdir %1
)
for %%a in ("profile/*.xml") do (
	netsh wlan export profile name=%%~na folder=%1
)
if not exist "%1/*.xml" (
	rmdir %1
)
goto :EOF

:main
title AutoHansung
echo AutoHansung
echo.
echo This script backs up your existing network profile before continuing.
call :export "%appdata%/AutoHansung/backup/%session%"
echo.
echo This script will add a network profile.
echo User information will be saved, so please set it on your personal PC only.
echo Wi-Fi connection may be lost during setup.
pause
call :add
if not %errorlevel% == 0 (
	pause
)
