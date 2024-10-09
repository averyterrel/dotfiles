@echo off
setlocal enableextensions
set CYGWIN=winsymlinks:nativestrict
set HOME=/home/user
set HOSTNAME=EckoWin
set SHELL=/bin/fish
set WINPATH=%PATH%
set PATH=/bin:/usr/bin:/usr/local/bin:/opt/bin
cd /d "%~dp0bin" && C:\cygwin64\bin\fish.exe --login -i
