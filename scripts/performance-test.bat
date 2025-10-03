@echo off
echo ⚡ PERFORMANCE BENCHMARKING
echo ========================================
echo.

echo 🔥 Authentication Performance (10 iterations)...
newman run ..\collections\authentication-flow.json -e ..\environments\development.json --iteration-count 10 --delay-request 100 --reporters cli,json --reporter-json-export ..\reports\perf-auth.json

echo.
echo 🎮 Game Launch Performance (5 iterations)...
newman run ..\collections\game-management.json -e ..\environments\development.json --iteration-count 5 --delay-request 200 --reporters cli,json --reporter-json-export ..\reports\perf-games.json

echo.
echo 💰 Transaction Performance (15 iterations)...
newman run ..\collections\transaction-processing.json -e ..\environments\development.json --iteration-count 15 --delay-request 50 --reporters cli,json --reporter-json-export ..\reports\perf-transactions.json

echo.
echo ✅ Performance benchmarking complete!
echo 📊 JSON reports saved to reports\
pause