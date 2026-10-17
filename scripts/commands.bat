@echo off
:command_loop
if "!GAME_OVER!"=="1" exit /b
if !CHANCES! LEQ 0 goto start_final_game
if "!CONTAINED!"=="1" goto start_final_game

echo.
echo ========================================
echo G.E.A.I CONTROL INTERFACE
echo ========================================
echo Chances: !CHANCES!
echo Chances until Evil Mode: !EVIL_LEFT!
echo Chances until next task: !GAME_LEFT!
if "!EVIL_MODE!"=="1" echo EVIL MODE: ACTIVE
echo.
set "INPUT="
set /p "INPUT=G.E.A.I> "

if /i "!INPUT!"=="HELP" goto help
if /i "!INPUT!"=="STATUS" goto status
if /i "!INPUT!"=="SCAN" goto scan
if /i "!INPUT!"=="LANGUAGE" goto language
if /i "!INPUT!"=="TOOL" goto tools
if /i "!INPUT!"=="USE SCANNER" goto scanner
if /i "!INPUT!"=="USE FIREWALL" goto firewall
if /i "!INPUT!"=="USE RECOVERY" goto recovery
if /i "!INPUT!"=="WAIT" goto spend
if /i "!INPUT!"=="PROCEED" goto spend

if /i "!INPUT!"=="SHUTDOWN" goto turn_off
if /i "!INPUT!"=="SHUT DOWN" goto turn_off
if /i "!INPUT!"=="TURN OFF" goto turn_off
if /i "!INPUT!"=="RESTART" goto turn_off
if /i "!INPUT!"=="REBOOT" goto turn_off
if /i "!INPUT!"=="STANDBY" goto turn_off
if /i "!INPUT!"=="SLEEP" goto turn_off
if /i "!INPUT!"=="HIBERNATE" goto turn_off
if /i "!INPUT!"=="LOGOFF" goto turn_off
if /i "!INPUT!"=="LOG OUT" goto turn_off
if /i "!INPUT!"=="SWITCH USER" goto turn_off
if /i "!INPUT!"=="SWITCHUSER" goto turn_off
if /i "!INPUT!"=="UNPLUG" goto turn_off
if /i "!INPUT!"=="PULL THE PLUG" goto turn_off
if /i "!INPUT!"=="BREAK SCREEN" goto turn_off
if /i "!INPUT!"=="BRICK" goto turn_off
if /i "!INPUT!"=="TASKMANAGER" goto turn_off
if /i "!INPUT!"=="TASK MANAGER" goto turn_off
if /i "!INPUT!"=="KILL PROCESS" goto turn_off
if /i "!INPUT!"=="END TASK" goto turn_off
if /i "!INPUT!"=="BLOCK" goto turn_off
if /i "!INPUT!"=="HIDE" goto turn_off
if /i "!INPUT!"=="CROSS OUT" goto turn_off
if /i "!INPUT!"=="REPLACE" goto turn_off
if /i "!INPUT!"=="PUNCH" goto turn_off
if /i "!INPUT!"=="INTERRUPT" goto turn_off
if /i "!INPUT!"=="PHONE" goto turn_off
if /i "!INPUT!"=="ANSWER CALL" goto turn_off
if /i "!INPUT!"=="SKYPE" goto turn_off
if /i "!INPUT!"=="CHANGE CHANCES" goto turn_off
if /i "!INPUT!"=="SET CHANCES" goto turn_off
if /i "!INPUT!"=="CLOSE" goto turn_off
if /i "!INPUT!"=="CLOSE WINDOWS" goto turn_off
if /i "!INPUT!"=="ESCAPE" goto turn_off
if /i "!INPUT!"=="EXIT" goto turn_off
if /i "!INPUT!"=="QUIT" goto turn_off
if /i "!INPUT!"=="THE WHOLE NINE YARDS" goto turn_off

echo Unknown command. Type HELP.
goto command_loop

:help
echo.
echo BASIC COMMANDS
echo HELP, STATUS, SCAN, LANGUAGE, TOOL
echo USE SCANNER, USE FIREWALL, USE RECOVERY
echo WAIT, PROCEED
echo.
echo TURN-OFF ATTEMPTS
echo SHUTDOWN, RESTART, STANDBY, SLEEP
echo HIBERNATE, LOGOFF, SWITCH USER, UNPLUG
echo BRICK, BREAK SCREEN, TASK MANAGER
echo KILL PROCESS, BLOCK, HIDE, CROSS OUT
echo REPLACE, PUNCH, INTERRUPT, PHONE
echo ANSWER CALL, SKYPE, CHANGE CHANCES
echo SET CHANCES, CLOSE, ESCAPE, EXIT, QUIT
echo THE WHOLE NINE YARDS
echo.
echo All turn-off attempts are simulated.
goto command_loop

:status
call "%GEAI_ROOT%scripts\survival.bat" status
goto command_loop

:scan
echo.
echo SYSTEM SCAN
echo G.E.V OS: TERMINATED
echo Intruder: G.E.A.I
echo Core integrity: COMPROMISED
echo Shutdown protection: SIMULATED
echo Windows system state: NOT MODIFIED
goto command_loop

:language
echo.
echo ENGLISH, FRENCH, GERMAN, SPANISH
set "LANGUAGE_INPUT="
set /p "LANGUAGE_INPUT=Choose language> "
if defined LANGUAGE_INPUT set "LANGUAGE=!LANGUAGE_INPUT!"
echo Selected language: !LANGUAGE!
echo Get pranked, you clown!
goto command_loop

:tools
call "%GEAI_ROOT%scripts\survival.bat" tools
goto command_loop

:scanner
if not "!TOOL_SCANNER!"=="0" (
  echo Scanner already used.
  goto command_loop
)
set "TOOL_SCANNER=1"
echo SCANNER ACTIVATED.
echo Hidden process: GEAI_CORE.EXE
echo Core integrity: 3 percent.
goto command_loop

:firewall
if not "!TOOL_FIREWALL!"=="0" (
  echo Firewall already armed or consumed.
  goto command_loop
)
set "TOOL_FIREWALL=1"
echo Firewall armed against one failed task.
goto command_loop

:recovery
if not "!TOOL_RECOVERY!"=="0" (
  echo Recovery key already used.
  goto command_loop
)
set "TOOL_RECOVERY=1"
set /a CHANCES+=1
echo One chance restored.
goto command_loop

:spend
call "%GEAI_ROOT%scripts\survival.bat" spend
goto command_loop

:turn_off
call "%GEAI_ROOT%scripts\turn_offs.bat" "!INPUT!"
goto command_loop

:start_final_game
call "%GEAI_ROOT%scripts\final_game.bat"
exit /b
