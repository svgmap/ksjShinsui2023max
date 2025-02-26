@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
    echo Usage: %0 ^<search_directory^>
    exit /b 1
)

set "search_dir=%~1"

for /d %%d in ("%search_dir%\*") do (
    for %%f in ("%%d\rootImgMap.svg") do if exist "%%f" echo %%~ff
)
pause
