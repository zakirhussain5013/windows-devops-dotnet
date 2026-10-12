
@echo off
setlocal

echo =====================================
echo       .NET API Deployment
echo =====================================

set "SOURCE=D:\DevOps_Learning\published-api"
set "TARGET=D:\DevOps_Learning\deploy\CiCdDemo.Api"

if not exist "%SOURCE%\CiCdDemo.Api.dll" (
    echo ERROR: Published API files not found.
    echo Check the SOURCE folder.
    exit /b 1
)

if not exist "%TARGET%" mkdir "%TARGET%"

echo.
echo Copying published files...

robocopy "%SOURCE%" "%TARGET%" /E

if errorlevel 8 (
    echo ERROR: File copy failed.
    exit /b 1
)

echo.
echo Deployment files copied successfully.
echo Starting API...

cd /d "%TARGET%"
dotnet CiCdDemo.Api.dll

endlocal
 ]