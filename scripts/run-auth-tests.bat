@echo off
echo 🔐 Running Authentication Tests...
echo.

REM Create reports directory if it doesn't exist
if not exist "..\reports" mkdir ..\reports

REM Run authentication tests with detailed reporting
newman run ..\collections\authentication-flow.json -e ..\environments\development.json --reporters cli,htmlextra --reporter-htmlextra-export "..\reports\auth-tests-%date:~-4,4%%date:~-10,2%%date:~-7,2%.html" --reporter-htmlextra-title "Gaming Platform Authentication Tests" --delay-request 500 --timeout-request 10000

echo.
echo ✅ Authentication tests completed!
echo 📊 Check reports\ folder for detailed results
pause