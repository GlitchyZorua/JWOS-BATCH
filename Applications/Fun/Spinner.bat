@echo off
echo To exit, Hold Ctrl+C. Press any key to start the spinning animation.
pause
:start
cls
echo ^|
ping localhost -n 0.1 >nul
cls
echo /
ping localhost -n 0.1 >nul
cls
echo -
ping localhost -n 0.1 >nul
cls
echo \
ping localhost -n 0.1 >nul
cls
echo ^|
ping localhost -n 0.1 >nul
cls
echo -
ping localhost -n 0.1 >nul
cls
echo \
ping localhost -n 0.1 >nul
goto start