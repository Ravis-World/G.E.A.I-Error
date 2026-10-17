@echo off
title G.E.A.I Error - FINAL GAME
color 0C
cls


echo ========================================
echo                FINAL GAME
echo ========================================
echo.

if "!CONTAINED!"=="1" (
    echo Richard has been contained by G.E.A.I.
    echo The final game is no longer available.
    call "%GEAI_ROOT%scripts\fake_bsod.bat"
    exit /b
)

echo G.E.A.I: "ONE LAST CHANCE, RICHARD."
echo.
echo Enter the correct code to attempt
echo to break free of the error.
echo.
set "FINAL_INPUT="
set /p "FINAL_INPUT=FINAL RESPONSE> "

if /i "!FINAL_INPUT!"=="4 8 15 16 23 42" goto final_success
goto failure

:success
cls
color 0A
echo ========================================
echo           TEMPORARY ESCAPE
echo ========================================
echo.
echo G.E.A.I has lost control of the session.
echo.
echo You escaped this time, Richard.
echo This is not a permanent victory.
echo.
pause
exit /b

:failure
call "%GEAI_ROOT%scripts\fake_bsod.bat"
exit /b