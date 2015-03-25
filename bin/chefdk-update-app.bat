@ECHO OFF
SETLOCAL

SET MYPATH=%~dp0

%SYSTEMDRIVE%\opscode\chefdk\embedded\bin\ruby.exe "%MYPATH:~0,-1%\chefdk-update-app.rb" %*

SET "RUBY_EXIT_STATUS=%ERRORLEVEL%"
exit /b %RUBY_EXIT_STATUS%
