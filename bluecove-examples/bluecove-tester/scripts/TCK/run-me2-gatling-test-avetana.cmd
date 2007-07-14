@echo off
rem @version $Revision$ ($Author$)  $Date$
SETLOCAL

call %~dp0environment.cmd %*
if errorlevel 1 (
    echo Error calling environment.cmd
    endlocal
    pause
    exit /b 1
)
set BLUECOVE_JAR=%BLUECOVE_HOME%\3p\avetanaBluetooth\avetanaBluetooth.jar
SET STACK=avetana-widcomm
title %STACK%-BluetoothTCK

set JVM_ARGS=
set JVM_ARGS=%JVM_ARGS% -Dde.avetana.bluetooth.debug=true

java %JVM_ARGS% -cp %MICROEMULATOR_HOME%\microemulator.jar;%BLUECOVE_JAR% org.microemu.app.Main -Xautotest:http://localhost:8080/getNextApp.jad >  run-%STACK%.cmd.log

if errorlevel 1 goto errormark
echo [Launched OK]
goto endmark
:errormark
	ENDLOCAL
	echo Error in start
	pause
:endmark
ENDLOCAL
