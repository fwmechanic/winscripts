@echo off
setlocal

REM my installation of Git for Windows is (for reasons which I now forget)
REM installed in %LOCALAPPDATA%\programs\Git rather than the "standard" location
REM which existing answers https://stackoverflow.com/a/17306604 assume.
REM since I want a tool that will work for either case, AND because Git for
REM Windows CAN BE installed with bash and other unix utils it includes
REM OMITTED FROM PATH, this hackery ensues...
REM ... It finds bash.exe relative to git.exe
REM in MY standard git install config, sh.exe is not in PATH, but git.exe is...
REM 20171007 kgoodwin

call :GetAbsPathOfExe "git.exe"
if "%filename%" == "" (
  echo git.exe was not found in PATH?!
  exit 66 /b
)
call :RmvOnePathEl "%filename%"
call :RmvOnePathEl "%filename%"
set "filename=%filename%\bin\bash.exe"
   REM echo %filename%
if exist "%filename%" (
  start "" "%filename%" --login
) else (
  echo weird Git For Windows install; sh.exe not found relative to git.exe path
  exit 66 /b
)

::----------------------------------

REM Windows BATch language sucks SO BAD!!!
REM Certain magical variable substitutions
REM are ONLY available to PARAMETER variables, NOT to NAMED variables,
REM so we create artificial subroutines which exist solely to accept PARAMETER variables
REM and perform PARAMETER variable substitutions on them
REM to obtain values to assign to the GLOBAL NAMED variable "filename".
REM Better code may be possible, but I'm not going to worry
REM as long as it works reliably.

:GetAbsPathOfExe
   REM echo %1
  REM use the internal equivalent of where.exe; faster?
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
