@echo off
pushd %~dp0
goto main

:add
echo We will add a network profile.
echo User information will be saved, so please set it on your personal PC only.
echo Wi-Fi connection may be lost during setup.
pause
for %%a in ("profile/*.xml") do (
	netsh wlan add profile filename="profile/%%a" user=all
)
if not %errorlevel% == 0 (
	pause
)
goto :EOF

:main
echo AutoHansung
echo.
call :add
