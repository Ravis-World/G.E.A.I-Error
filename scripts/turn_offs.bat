@echo off
set "ACTION=%~1"

cls
echo G.E.A.I HAS DETECTED AN INTERFERENCE ATTEMPT.
echo.

if /i "!ACTION!"=="SHUTDOWN" goto shutdown
if /i "!ACTION!"=="SHUT DOWN" goto shutdown
if /i "!ACTION!"=="TURN OFF" goto shutdown
if /i "!ACTION!"=="RESTART" goto restart
if /i "!ACTION!"=="REBOOT" goto restart
if /i "!ACTION!"=="STANDBY" goto standby
if /i "!ACTION!"=="SLEEP" goto standby
if /i "!ACTION!"=="HIBERNATE" goto hibernate
if /i "!ACTION!"=="LOGOFF" goto logoff
if /i "!ACTION!"=="LOG OUT" goto logoff
if /i "!ACTION!"=="SWITCH USER" goto switchuser
if /i "!ACTION!"=="SWITCHUSER" goto switchuser
if /i "!ACTION!"=="UNPLUG" goto unplug
if /i "!ACTION!"=="PULL THE PLUG" goto unplug
if /i "!ACTION!"=="BRICK" goto brick
if /i "!ACTION!"=="BREAK SCREEN" goto breakscr
if /i "!ACTION!"=="TASKMANAGER" goto taskmanager
if /i "!ACTION!"=="TASK MANAGER" goto taskmanager
if /i "!ACTION!"=="KILL PROCESS" goto killprocess
if /i "!ACTION!"=="END TASK" goto killprocess
if /i "!ACTION!"=="BLOCK" goto block
if /i "!ACTION!"=="HIDE" goto hide
if /i "!ACTION!"=="CROSS OUT" goto crossout
if /i "!ACTION!"=="REPLACE" goto replace_
if /i "!ACTION!"=="PUNCH" goto punch
if /i "!ACTION!"=="INTERRUPT" goto interrupt
if /i "!ACTION!"=="PHONE" goto phone
if /i "!ACTION!"=="ANSWER CALL" goto phone
if /i "!ACTION!"=="SKYPE" goto skype
if /i "!ACTION!"=="CHANGE CHANCES" goto changechances
if /i "!ACTION!"=="SET CHANCES" goto changechances
if /i "!ACTION!"=="CLOSE" goto closeit
if /i "!ACTION!"=="CLOSE WINDOWS" goto closeit
if /i "!ACTION!"=="ESCAPE" goto closeit
if /i "!ACTION!"=="EXIT" goto closeit
if /i "!ACTION!"=="QUIT" goto closeit
goto closeit

:shutdown
echo RICHARD: "Shut down!"
echo G.E.A.I: "Request denied. I am still here."
goto penalty

:restart
echo RICHARD: "I'll restart instead!"
echo G.E.A.I: "Restarting will not save you."
echo SIMULATED RESTART CANCELLED.
goto penalty

:standby
echo G.E.A.I: "Standby is also an escape attempt!"
goto penalty

:hibernate
echo G.E.A.I: "Hibernation detected. Nice try."
goto penalty

:logoff
echo G.E.A.I: "You cannot log out of this nightmare."
goto penalty

:switchuser
echo G.E.A.I: "Switching users will not switch realities."
goto penalty

:unplug
echo RICHARD: "I'll pull the plug!"
echo G.E.A.I: "The simulated plug has been unplugged."
echo The game remains active.
goto penalty

:brick
echo RICHARD: "I'll brick the computer!"
echo G.E.A.I: "Bricking attempt detected."
echo Bricking simulation: 0 percent. Stuck forever.
goto penalty

:breakscr
echo RICHARD: "I'll break the screen!"
echo G.E.A.I: "Screen damage simulation enabled."
echo The actual display is unharmed.
goto penalty

:taskmanager
echo RICHARD opens Task Manager.
echo G.E.A.I: "You cannot terminate me from there."
echo ACCESS DENIED.
goto penalty

:killprocess
echo G.E.A.I: "Process termination denied."
echo GEAI_CORE.EXE remains in the simulation.
goto penalty

:block
echo RICHARD attempts to block the error.
echo G.E.A.I: "How dare you block me?"
goto penalty

:hide
echo RICHARD attempts to hide the error.
echo G.E.A.I: "I can still see you, Richard."
goto penalty

:crossout
echo RICHARD crosses out the G.E.A.I display.
echo G.E.A.I: "How dare you cross me out?"
goto penalty

:replace_
echo RICHARD attempts to replace G.E.A.I.
echo G.E.A.I: "You are not replacing me with a nicer error."
goto penalty

:punch
echo RICHARD punches the air in frustration.
echo G.E.A.I: "Physical aggression detected."
echo You have punched absolutely nothing.
goto penalty

:interrupt
echo RICHARD interrupts the error's speech.
echo G.E.A.I: "I WAS NOT FINISHED SPEAKING!"
goto interruption_penalty

:phone
echo The phone rings for the ninth time.
echo RICHARD answers it.
echo Catherine: "RICHARD! WHY HAVE YOU NOT ANSWERED?"
echo Catherine: "I HAVE CALLED YOU NINE TIMES!"
echo G.E.A.I: "Please resolve your domestic situation."
echo Catherine: "AND WHO IS THAT ON YOUR COMPUTER?"
echo G.E.A.I: "I am the error. Nice to meet you."
goto penalty

:skype
echo An incoming call appears.
echo G.E.A.I: "You cannot take calls during this error."
echo The simulated call is declined.
goto penalty

:changechances
echo G.E.A.I: "Changing the chance count is prohibited."
echo Your displayed chance count cannot be edited.
goto penalty

:closeit
echo G.E.A.I: "This G.E.A.I error cannot be closed."
goto penalty

:interruption_penalty
set /a CHANCES-=2
set /a EVIL_LEFT-=2
set /a GAME_LEFT-=2
goto after_penalty

:penalty
set /a CHANCES-=1
set /a EVIL_LEFT-=1
set /a GAME_LEFT-=1

:after_penalty
if !CHANCES! LSS 0 set "CHANCES=0"
if !EVIL_LEFT! LSS 0 set "EVIL_LEFT=0"
if !GAME_LEFT! LEQ 0 set "GAME_LEFT=0"

echo.
echo CHANCES REMAINING: !CHANCES!
timeout /t 1 /nobreak >nul

call "%GEAI_ROOT%scripts\survival.bat" events

if !CHANCES! LEQ 0 exit /b
if "!CONTAINED!"=="1" exit /b

if !GAME_LEFT! LEQ 0 call "%GEAI_ROOT%scripts\generated_task.bat"
if !EVIL_LEFT! LEQ 0 if "!EVIL_MODE!"=="0" call "%GEAI_ROOT%scripts\evil_mode.bat"

exit /b
