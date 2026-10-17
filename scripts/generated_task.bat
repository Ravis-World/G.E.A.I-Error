@echo off
set "TASK_FAILED=0"
set /a TASK_TYPE=%random% %% 3

cls
echo ========================================
echo GENERATED SURVIVAL TASK
echo ========================================
echo.

if !TASK_TYPE! EQU 0 goto math_task
if !TASK_TYPE! EQU 1 goto word_task
goto sequence_task

:math_task
set /a TASK_A=%random% %% 20 + 1
set /a TASK_B=%random% %% 20 + 1
set /a TASK_ANSWER=TASK_A+TASK_B

echo What is !TASK_A! + !TASK_B!?
set "TASK_INPUT="
set /p "TASK_INPUT=Answer> "
if "!TASK_INPUT!"=="!TASK_ANSWER!" goto success
goto failure

:word_task
echo Type CONTINUE to keep the session alive.
set "TASK_INPUT="
set /p "TASK_INPUT=Answer> "
if /i "!TASK_INPUT!"=="CONTINUE" goto success
goto failure

:sequence_task
echo Complete the sequence:
echo 2, 4, 6, 8, ?
set "TASK_INPUT="
set /p "TASK_INPUT=Answer> "
if "!TASK_INPUT!"=="10" goto success
goto failure

:success
echo.
echo TASK PASSED.
set "GAME_LEFT=5"
timeout /t 2 /nobreak >nul
exit /b

:failure
if "!TOOL_FIREWALL!"=="1" (
    set "TOOL_FIREWALL=2"
    echo.
    echo FIREWALL INTERVENTION!
    echo The failed task has been contained.
    set "GAME_LEFT=5"
    timeout /t 2 /nobreak >nul
    exit /b
)

echo.
echo TASK FAILED.
echo G.E.A.I has contained Richard.
set "CONTAINED=1"
set "CHANCES=0"
call "%GEAI_ROOT%scripts\fake_bsod.bat"
set "GAME_OVER=1"
exit /b