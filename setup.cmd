@echo off
pushd %~dp0
title autohansung
echo autohansung
pause
netsh wlan add profile filename="profile/hansung.xml" user=all
if not %errorlevel% == 0 (
	pause
)
