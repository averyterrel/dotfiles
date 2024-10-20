@echo off
setlocal enableextensions
set CYGWIN=winsymlinks:nativestrict
set HOME=/home/user
set HOSTNAME=EckoWin
set SHELL=/bin/fish
set WINPATH=%PATH%
cd /d "%~dp0bin"
set PATH=/bin:/usr/bin:/usr/local/bin:/opt/bin
C:\cygwin64\bin\fish.exe --login -i
