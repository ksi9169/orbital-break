@echo off
setlocal
cd /d "%~dp0"
echo [1/3] Syncing orbital_break_simulator_v0.8.html to index.html...
copy /Y "orbital_break_simulator_v0.8.html" "index.html" >nul

echo [2/3] Deploying to Cloudflare Workers (orbital-break.h1s.workers.dev)...
call npx.cmd wrangler deploy
if %errorlevel% neq 0 (
    echo [ERROR] Cloudflare deployment failed.
    pause
    exit /b 1
)

echo [3/3] Pushing to GitHub (origin main)...
git add -A
git commit -m "chore: sync and deploy orbital-break"
git push origin main
echo [OK] All deployments completed!
pause