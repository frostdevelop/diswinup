::Frost Installer Copyright Frost 2025. 
::CC-BY-NC-SA
@echo off
cls
color 2f
set ver=Frost Installer v0.2a
set soft=Windows Update Disabler v0.1
set comp=frostsoftware
set name=DisableUpdate
set exce=disableupd.bat
set icon=disableupd.ico
title %ver%: %soft%
echo [1m[7m%ver%[0m
echo.
echo [43m[1mInstalling "%soft% by %comp%" to %COMPUTERNAME%[0m[42m
echo.
choice /c yn /n /m "[97mAdd to start menu (y/n)>[93m"
set sm=%ERRORLEVEL%
choice /c yn /n /m "[97mAdd to desktop (y/n)>[93m"
set dsk=%ERRORLEVEL%
choice /c yn /n /m "[97mAdd to startup (y/n)>[93m"
set st=%ERRORLEVEL%
echo [InternetShortcut] >> "%temp%\finsttemp.url"
echo URL=%~dp0\%exce% >> "%temp%\finsttemp.url"
echo IconFile=%~dp0\%icon% >> "%temp%\finsttemp.url"
echo IconIndex=0 >> "%temp%\finsttemp.url"
echo [44m[92m
if %sm% == 2 goto chkst
cd "%AppData%\Microsoft\Windows\Start Menu\Programs"
if not exist %comp% (
mkdir %comp%
)
copy "%temp%\finsttemp.url" "%AppData%\Microsoft\Windows\Start Menu\Programs\%comp%\%name%.url" /v /y /a
echo Installed Start Menu
:chkst
if %st% == 2 goto chkdsk
cd "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup"
copy "%temp%\finsttemp.url" "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\%name%.url" /v /y /a
echo Installed Startup
:chkdsk
if %dsk% == 2 goto end
copy "%temp%\finsttemp.url" "%userprofile%\desktop\%name%.url" /v /y /a
echo Installed Desktop
:end
cd %~dp0
del "%temp%\finsttemp.url"
echo [43m[97m
pause
exit