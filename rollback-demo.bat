@echo off
setlocal

echo ==================================
echo   Release Health Check and Rollback Demo
echo ==================================

echo.
echo Checking V2 on port 5059...

curl --fail --silent http://localhost:5059/health >nul

if errorlevel 1 goto rollback

echo V2 is healthy.
echo Active release choice: V2
goto end

:rollback
echo V2 health check failed.
echo Falling back to V1 on port 5058...

curl --fail --silent http://localhost:5058/health >nul

if errorlevel 1 goto bothfailed

echo V1 is healthy.
echo Active release choice: V1
goto end

:bothfailed
echo ERROR: V1 and V2 health checks failed.
echo Manual investigation required.
exit /b 1

:end
echo.
echo Demo complete.
endlocal