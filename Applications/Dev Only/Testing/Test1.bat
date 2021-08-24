:a
echo %time%
choice /c df /n
if %errorlevel%==0 goto a
if %errorlevel%==1 goto exit
if %errorlevel%==2 goto exit
goto a