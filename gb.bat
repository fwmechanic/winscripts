@echo off
setlocal

REM my installation of Git for Windows is (for reasons which I now forget)
REM installed in %LOCALAPPDATA%\programs\Git rather than the "standard" location
REM which existing answers https://stackoverflow.com/a/17306604 assume
REM since I want a tool that will work for either case, this hackery ensues...
REM in MY standard git install config, sh.exe is not in PATH, but git.exe is...
REM 20171007 kgoodwin

call :GetAbsPathOfExe "git.exe"
if "%filename%" == "" (
  echo git.exe was not found in PATH?!
  exit /b
)
call :RmvOnePathEl "%filename%"
call :RmvOnePathEl "%filename%"
set "filename=%filename%\bin\sh.exe"
   REM echo %filename%
if exist "%filename%" (
  start "" "%filename%" --login
) else (
  echo weird Git For Windows install; sh.exe not found relative to git.exe path
)
exit /b

::----------------------------------

REM Windows BATch language sucks SO BAD!!!
REM Certain magical variable substitutions are ONLY available
REM to PARAMETER variables, not to NAMED variables,
REM so we create subroutines which accept PARAMETER variables
REM and operate on a GLOBAL (!!!) NAMED variable filename.
REM Better code may be possible, but I'm not going to worry
REM as long as it works reliably.

:GetAbsPathOfExe
   REM echo %1
  set "filename=%~$PATH:1"
   REM echo %filename%
  exit /b

:RmvOnePathEl
    REM echo %1
  set "filename=%~dp1"
   REM echo %filename%
  set "filename=%filename:~0,-1%"
   REM echo %filename%
  exit /b
