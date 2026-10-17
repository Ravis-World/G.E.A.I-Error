@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "GEAI_ROOT=%~dp0"
set "CHANCES=20"
set "EVIL_LEFT=10"
set "GAME_LEFT=5"
set "EVIL_MODE=0"
set "CONTAINED=0"
set "GAME_OVER=0"
set "TASK_FAILED=0"
set "LANGUAGE=ENGLISH"
set "EVIL_TURNOFFS=0"
set "PUNCH_EVENT=0"
set "TWELVE_EVENT=0"

set "TOOL_SCANNER=0"
set "TOOL_FIREWALL=0"
set "TOOL_RECOVERY=0"

title G.E.A.I Error
color 07

call "%GEAI_ROOT%scripts\infection.bat"
call "%GEAI_ROOT%scripts\commands.bat"

endlocal
exit /b
