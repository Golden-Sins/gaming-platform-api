@echo off
echo 🎮 Running Game Management Tests...
echo.

newman run ..\collections\game-management.json -e ..\environments\development.json -d ..\data\game-launch-data.csv --reporters cli,htmlextra --reporter-htmlextra-export "..\reports\game-tests-%date:~-4,4%%date:~-10,2%%date:~-7,2%.html" --reporter-htmlextra-title "Game Launch Tests" --delay-request 1000

echo.
echo ✅ Game management tests completed!
pause