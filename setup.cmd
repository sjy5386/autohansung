@echo off
pushd %~dp0
title autohansung
echo autohansung
echo.
echo We will add a network profile.
echo User information will be saved, so please set it on your personal PC only.
echo Wi-Fi connection may be lost during setup.
pause
netsh wlan add profile filename="profile/hansung.xml" user=all
if not %errorlevel% == 0 (
	pause
)
