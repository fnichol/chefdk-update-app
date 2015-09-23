@ECHO OFF
SETLOCAL

SET MYPATH=%~dp0

%SYSTEMDRIVE%\opscode\%1\embedded\bin\ruby.exe "%MYPATH:~0,-1%\appbundle-updater.rb" %*

SET "RUBY_EXIT_STATUS=%ERRORLEVEL%"
exit /b %RUBY_EXIT_STATUS%
