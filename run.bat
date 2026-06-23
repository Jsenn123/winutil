@echo off
cd /d "%~dp0"

if not exist "winutil.ps1" (
    echo [ERROR] winutil.ps1 not found. Run Compile.ps1 first.
    pause
    exit /b 1
)

:: Check admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting admin privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Prefer pwsh, fallback to powershell
where pwsh >nul 2>&1
if %errorlevel% equ 0 (
    pwsh -NoProfile -ExecutionPolicy Bypass -File "%~dp0winutil.ps1"
) else (
    powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0winutil.ps1"
)

pause
