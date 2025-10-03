@echo off
echo ========================================
echo 🎮 GAMING PLATFORM - COMPLETE TEST SUITE
echo ========================================
echo.

REM Create reports directory
if not exist "..\reports" mkdir ..\reports

set TIMESTAMP=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%
set TIMESTAMP=%TIMESTAMP: =0%

echo.
echo 🔐 Phase 1: Authentication Tests...
echo ========================================
newman run ..\collections\authentication-flow.json -e ..\environments\development.json --reporters cli,htmlextra --reporter-htmlextra-export "..\reports\1-auth-%TIMESTAMP%.html" --delay-request 500

echo.
echo 🎮 Phase 2: Game Management Tests...
echo ========================================
newman run ..\collections\game-management.json -e ..\environments\development.json -d ..\data\game-launch-data.csv --reporters cli,htmlextra --reporter-htmlextra-export "..\reports\2-games-%TIMESTAMP%.html" --delay-request 1000

echo.
echo 💰 Phase 3: Transaction Processing Tests...
echo ========================================
newman run ..\collections\transaction-processing.json -e ..\environments\development.json -d ..\data\transaction-data.csv --reporters cli,htmlextra --reporter-htmlextra-export "..\reports\3-transactions-%TIMESTAMP%.html" --delay-request 750

echo.
echo ========================================
echo ✅ COMPLETE TEST SUITE FINISHED!
echo ========================================
echo 📊 Test Results Summary:
echo    - Authentication Flow: COMPLETED
echo    - Game Management: COMPLETED
echo    - Transaction Processing: COMPLETED
echo.
echo 📁 Reports saved to: reports\
echo 🌐 Open HTML files in browser for detailed results
echo.
pause