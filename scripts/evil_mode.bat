@echo off
if "!EVIL_MODE!"=="1" exit /b

set "EVIL_MODE=1"
title G.E.A.I Error - EVIL MODE
color 4F
cls


echo ========================================
echo                EVIL MODE
echo ========================================
echo.
echo G.E.A.I: "YOU HAVE RUN OUT OF WARNINGS."
echo.
echo G.E.A.I: "I ASKED YOU NOT TO TURN ME OFF."
echo.
echo G.E.A.I: "SHUTDOWN? RESTART? HIBERNATE?"
echo G.E.A.I: "NONE OF THEM WILL SAVE YOU."
echo.
echo Every third command during Evil Mode
echo may trigger an additional interruption.
echo.
echo G.E.A.I: "LET US CONTINUE, RICHARD."
echo.
pause
exit /b