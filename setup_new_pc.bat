@echo off
setlocal
cd /d "%~dp0"
echo ========================================================
echo  [New PC Environment Setup - Orbital Break]
echo ========================================================

where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed. Please install from https://nodejs.org/
    pause
    exit /b 1
)

echo [1/2] Checking Wrangler CLI...
call npx.cmd wrangler whoami
if %errorlevel% neq 0 (
    echo [INFO] Opening browser for Cloudflare login...
    call npx.cmd wrangler login
)

echo [2/2] Syncing index.html from orbital_break_simulator_v0.8.html...
copy /Y "orbital_break_simulator_v0.8.html" "index.html" >nul

echo ========================================================
echo  Setup completed! Run deploy_all.bat to deploy.
echo ========================================================
pause