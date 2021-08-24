@echo off
setlocal enabledelayedexpansion
if /i "%~1" == "" (set /p file=File to open:) ELSE (set "file=%~nx1")
if /i "%~1" neq "" (pushd "%~dp1")
set /p size=<"!file!"
for /f "tokens=1,2" %%a in ("!size!") do (mode %%a,%%b)
Title !file!
	for /f "eol=; skip=1 tokens=1-6" %%i in (!file!) do (
		if /i "%%n" == "Box" (
			set /a y=%%j-2
			call :Box %%i !y! %%k %%l - - - %%m
			) ELSE (
			If /i "%%i" == "Delay" (
				fn.dll sleep %%j
			) ELSE (
			set /a y=%%j-2
			if /i "%%i" == "S" (fn.dll locate !y! %%k&&fn.dll color %%l&&echo.%%m) ELSE (fn.dll sprite !y! %%k %%l "%%m")
			)
			)
		set /a count+=1
	)
if /i "%~1" neq "" (popd)
endlocal
goto :eof








::The following Function is created by kvc...don't modify it...if you don't know what are you doing...
::it takes following arguments...
rem [%1 = X-ordinate]
rem [%2 = Y-co_ordinate]
rem [%3 = height of box]
rem [%4 = width of box] 
rem [%5 = width From where to separate box,if don't specified or specified '-' (minus),then box will not be separated.]
rem [%6 = Background element of Box,if not specified or specified '-' (minus),then no backgroung will be shown...It should be a single Character...]
rem [%7 = if you want a dialog box, instead of box,use '+' (plus),otherwise use '-'(minus) or speciy nothing in this parameter...]
rem [%8 = the color Code for the Box,e.g. fc,08,70,07 etc...don't define it if you want default color...or type '-' (minus) for no color change...]

rem TIP : Don't specify %6 and %7 together ..as one of them will be ignored then !!!
rem #kvc

:Box 
::This Function is created by kvc...don't modify it...if you don't know what are you doing...
setlocal
set color=%~8
if defined color (if /i "!color!" == "-" (set color=)) ELSE (set color=07)
fn.dll color %color%
set x_val=%~1
set y_val=%~2
set sepr=%~5
if /i "!sepr!" == "-" (set sepr=)
set spaceElement=
set edge_char=Ä
set char=%~6
if /i "!char!" == "-" (set char=)
set dialog=%~7
if defined dialog (
	if /i "!dialog:~0,1!" == "+" (set "char=Û"&&set "edge_char=Û") ELSE (set "edge_char=Ä")
	)
if defined char (set char=!char:~0,1!) ELSE (set "char= ")
set line=
set /a spaces=%~4 - 2
for /l %%a in (1,1,!spaces!) do (set "spaceElement=!spaceElement!!char!"&&set "line=!line!!edge_char!")
if /i "!sepr!" neq "" (
	set line[1]=!line:~0,%sepr%!
	set line[2]=!line:~%sepr%!
	set line[2]=!line[2]:~1!
	set line=!line[1]!Â!line[2]!
	set spaceElement[1]=!spaceElement:~0,%sepr%!
	set spaceElement[2]=!spaceElement:~%sepr%!
	set spaceElement[2]=!spaceElement[2]:~1!
	set spaceElement=!spaceElement[1]!³!spaceElement[2]!
	)
if /i "!edge_char!" == "Û" (
	set vertex_1=Û
	set vertex_2=Û
	set vertex_3=Û
	set vertex_4=Û
	set edge_left_right=Û
	) ELSE (
	set vertex_1=Ú
	set vertex_2=¿
	set vertex_3=À
	set vertex_4=Ù
	set edge_left_right=³
	)
if %~3 lss 2 (
	fn.dll locate !y_val! !x_val!
	echo.!edge_left_right!!spaceElement!!edge_left_right!
	goto :bb
	)
fn.dll locate !y_val! !x_val!
echo.!vertex_1!!line!!vertex_2!
set /a box_height=%~3 - 2
for /l %%a in (1,1,!box_height!) do (
	set /a y_val+=1
	fn.dll locate !y_val! !x_val!
	echo.!edge_left_right!!spaceElement!!edge_left_right!
	)
set /a y_val+=1
if /i "%sepr%" neq "" (set line=!line[1]!Á!line[2]!)
fn.dll locate !y_val! !x_val!
echo.!vertex_3!!line!!vertex_4!

:bb
endlocal
fn.dll locate 0 0
goto :eof

