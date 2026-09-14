@echo off
setlocal EnableExtensions

set "SRC=%~dp0"
set "DEST=%LOCALAPPDATA%\EldenRingCursorPack"

echo.
echo ==========================================
echo    Elden Ring Cursor Pack - Installer
echo ==========================================
echo.

if not exist "%DEST%" mkdir "%DEST%"

echo Copying cursor files...
copy /Y "%SRC%*.cur" "%DEST%\" >nul
copy /Y "%SRC%*.ani" "%DEST%\" >nul

echo Registering cursor scheme...

rem Scheme order:
rem Arrow, Help, AppStarting, Wait, Crosshair, IBeam, NWPen,
rem No, SizeNS, SizeWE, SizeNWSE, SizeNESW, SizeAll, UpArrow, Hand

reg add "HKCU\Control Panel\Cursors\Schemes" /v "Elden Ring Cursor Pack" /t REG_SZ /d "%DEST%\eldenarrow.cur,%DEST%\eldenarrow.cur,%DEST%\eldenwait.ani,%DEST%\eldenbusy.ani,%DEST%\eldenprecision.cur,%DEST%\eldentext.cur,%SystemRoot%\Cursors\aero_pen.cur,%DEST%\eldenunavailable.cur,%DEST%\eldenvertical.cur,%DEST%\eldenhorizontal.cur,%DEST%\eldendiagonal1.cur,%DEST%\eldendiagonal2.cur,%DEST%\eldenmove.cur,%DEST%\eldenarrow.cur,%DEST%\eldenlink.cur" /f >nul

echo Applying scheme...

reg add "HKCU\Control Panel\Cursors" /v "(Default)" /t REG_SZ /d "Elden Ring Cursor Pack" /f >nul

reg add "HKCU\Control Panel\Cursors" /v Arrow /t REG_EXPAND_SZ /d "%DEST%\eldenarrow.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v Help /t REG_EXPAND_SZ /d "%DEST%\eldenarrow.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v AppStarting /t REG_EXPAND_SZ /d "%DEST%\eldenwait.ani" /f >nul
reg add "HKCU\Control Panel\Cursors" /v Wait /t REG_EXPAND_SZ /d "%DEST%\eldenbusy.ani" /f >nul
reg add "HKCU\Control Panel\Cursors" /v Crosshair /t REG_EXPAND_SZ /d "%DEST%\eldenprecision.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v IBeam /t REG_EXPAND_SZ /d "%DEST%\eldentext.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v NWPen /t REG_EXPAND_SZ /d "%SystemRoot%\Cursors\aero_pen.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v No /t REG_EXPAND_SZ /d "%DEST%\eldenunavailable.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v SizeNS /t REG_EXPAND_SZ /d "%DEST%\eldenvertical.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v SizeWE /t REG_EXPAND_SZ /d "%DEST%\eldenhorizontal.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v SizeNWSE /t REG_EXPAND_SZ /d "%DEST%\eldendiagonal1.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v SizeNESW /t REG_EXPAND_SZ /d "%DEST%\eldendiagonal2.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v SizeAll /t REG_EXPAND_SZ /d "%DEST%\eldenmove.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v UpArrow /t REG_EXPAND_SZ /d "%DEST%\eldenarrow.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v Hand /t REG_EXPAND_SZ /d "%DEST%\eldenlink.cur" /f >nul

rundll32 user32.dll,UpdatePerUserSystemParameters

echo.
echo ==========================================
echo    Installation complete!
echo ==========================================
echo.
echo The scheme "Elden Ring Cursor Pack" is now active.
echo.
pause
