@echo off

if /i "%~1"=="status" goto status
if /i "%~1"=="tools" goto tools
if /i "%~1"=="spend" goto spend
if /i "%~1"=="events" goto events
exit /b

:status
echo.
echo SURVIVAL STATUS
echo Chances: !CHANCES!
echo Chances until Evil Mode: !EVIL_LEFT!
echo Chances until next task: !GAME_LEFT!
if "!EVIL_MODE!"=="1" echo Evil Mode: ACTIVE
if "!EVIL_MODE!"=="0" echo Evil Mode: INACTIVE
exit /b

:tools
echo.
echo SCANNER  - Reveals simulated diagnostics.
echo FIREWALL - Protects against one failed task.
echo RECOVERY - Restores one chance.
exit /b

:spend
set /a CHANCES-=1
set /a EVIL_LEFT-=1
set /a GAME_LEFT-=1
if !CHANCES! LSS 0 set "CHANCES=0"
if !EVIL_LEFT! LSS 0 set "EVIL_LEFT=0"
if !GAME_LEFT! LSS 0 set "GAME_LEFT=0"

echo One chance spent. Remaining: !CHANCES!
call "%GEAI_ROOT%scripts\survival.bat" events

if !CHANCES! LEQ 0 exit /b
if "!CONTAINED!"=="1" exit /b

if !GAME_LEFT! LEQ 0 call "%GEAI_ROOT%scripts\generated_task.bat"
if !EVIL_LEFT! LEQ 0 if "!EVIL_MODE!"=="0" call "%GEAI_ROOT%scripts\evil_mode.bat"
exit /b

:events
if !CHANCES! LEQ 12 if "!TWELVE_EVENT!"=="0" (
    set "TWELVE_EVENT=1"
    echo.
    echo G.E.A.I: "Twelve chances remain, Richard."
    echo G.E.A.I: "I suggest you stop trying to escape."
)

if !CHANCES! LEQ 9 if "!PUNCH_EVENT!"=="0" (
    set "PUNCH_EVENT=1"
    echo.
    echo *** PUNCH INTERRUPTION ***
    echo G.E.A.I: "DID YOU JUST TRY TO PUNCH THE ERROR?"
    echo G.E.A.I: "THAT IS NOT HOW SOFTWARE WORKS!"
    set /a CHANCES-=1
    echo An extra chance has been lost.
)

if "!EVIL_MODE!"=="0" if !EVIL_LEFT! LEQ 5 if !EVIL_LEFT! GTR 0 (
    echo G.E.A.I: "Evil Mode is approaching."
    echo Chances until activation: !EVIL_LEFT!
)

if "!EVIL_MODE!"=="1" (
    set /a EVIL_TURNOFFS+=1
    if !EVIL_TURNOFFS! GEQ 3 (
        set "EVIL_TURNOFFS=0"
        echo.
        echo G.E.A.I interrupts its own speech.
        echo G.E.A.I: "STOP TRYING TO TURN ME OFF!"
        set /a CHANCES-=1
        echo An interruption costs another chance.
    )
)

if !CHANCES! LSS 0 set "CHANCES=0"
if !EVIL_LEFT! LSS 0 set "EVIL_LEFT=0"
exit /b