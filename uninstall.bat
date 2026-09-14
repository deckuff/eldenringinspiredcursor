@echo off
setlocal EnableExtensions

set "DEST=%LOCALAPPDATA%\EldenRingCursorPack"

echo.
echo Restoring Windows Default...

reg add "HKCU\Control Panel\Cursors" /v "(Default)" /t REG_SZ /d "Windows Default" /f >nul
reg delete "HKCU\Control Panel\Cursors\Schemes" /v "Elden Ring Cursor Pack" /f >nul 2>&1

rundll32 user32.dll,UpdatePerUserSystemParameters

if exist "%DEST%" rmdir /S /Q "%DEST%"

echo.
echo Windows Default restored.
echo.
pause
