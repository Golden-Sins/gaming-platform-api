@echo off
echo 📊 GENERATING TEST REPORTS
echo ========================================
echo.

set TIMESTAMP=%date:~-4,4%%date:~-10,2%%date:~-7,2%

echo Creating detailed authentication report...
newman run ..\collections\authentication-flow.json -e ..\environments\development.json -d ..\data\authentication-data.csv --reporters htmlextra --reporter-htmlextra-export "..\reports\AUTH-REPORT-%TIMESTAMP%.html" --reporter-htmlextra-title "Authentication Testing Report" --reporter-htmlextra-logs

echo Creating detailed game management report...
newman run ..\collections\game-management.json -e ..\environments\development.json -d ..\data\game-catalog.csv --reporters htmlextra --reporter-htmlextra-export "..\reports\GAME-REPORT-%TIMESTAMP%.html" --reporter-htmlextra-title "Game Management Report" --reporter-htmlextra-logs --delay-request 1000

echo Creating detailed transaction report...
newman run ..\collections\transaction-processing.json -e ..\environments\development.json -d ..\data\transaction-data.csv --reporters htmlextra --reporter-htmlextra-export "..\reports\TRANSACTION-REPORT-%TIMESTAMP%.html" --reporter-htmlextra-title "Transaction Processing Report" --reporter-htmlextra-logs --delay-request 750

echo.
echo ✅ All reports generated!
echo 📁 Open HTML files in reports\ folder
pause