@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
    echo Usage: %0 ^<input_directory^>
    exit /b 1
)

set "input_dir=%~1"

for %%f in ("%input_dir%\*.json") do (
    set "input_file=%%~f"
    echo Processing: %%~f
    Shape2ImageSVGMap 5-15 -sumUp 16 -colorKey 1#f7f5a9,2#ffd8c0,3#ffb7b7,4#ff9191,5#f285c9,6#dc7adc "%%~f" 1 #000000 0 0
)

echo ˆ—‚ªŠ®—¹‚µ‚Ü‚µ‚½B
pause
