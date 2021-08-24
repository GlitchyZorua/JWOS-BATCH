@Echo off
@title Tetris v 1
@mode con cols=28 lines=24

:: Batch Game - Tetris v 1
:: Proof Of Concept
:: Coded by SmartGenius
:: SmartGenius, Corp. 2010

Choice /N /T:Y,1 >Nul 2>&1
If "%Errorlevel%"=="9009" (Echo. CHOICE command not found&Pause&Exit)

Set "Game=%0"

Call :Logo

:Menu
Cls
Echo.
Echo.
Echo. Tetris v 1 by SmartGenius
Echo. ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
Echo. ÚÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo. ³1.³ ³Play TETRIS ³
Echo. ÀÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo. ÚÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo. ³2.³ ³How to Play ³
Echo. ÀÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo. ÚÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo. ³3.³ ³Exit Game   ³
Echo. ÀÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.
CHOICE /C:123 /N >nul
If "%errorlevel%"=="1" (Goto :Load)
If "%errorlevel%"=="2" (Goto :Help)
If "%errorlevel%"=="3" (Goto :End)
Goto :Menu

:Load
Setlocal enabledelayedexpansion
Set /a "LimX=18","LimY=16","TBound=1","LBound=0","Turn=1","Points=0"
Set /a "RBound=%LimX%","BBound=%LimY%"

:Init
For /l %%a in (0,1,%LimX%) do (
For /l %%b in (0,1,%LimY%) do (
Set "X%%aY%%b= "))
Set "Bound=Û"
Set "Bound2=²"

:Main
Set /a "L=(%Random% %% 7)+1"
Call :Figure%L%
Call :Graphic
Goto :Main

:Graphic
If "%New_F%"=="True" (
Call :Solid
Set "New_F=False"
Goto :Eof
)
Call :Clear
Cls
Echo.
Echo.  Tetris v 1 by SmartGenius
Echo.
Echo.   Points:%Points%
Echo.   ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
For /l %%f in (0,1,%LimY%) do (Echo.   º!Lin_%%f!º)
Echo.   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
Call :Move
Goto :Graphic

:Move
:: Normal CHOICE (provided into ZIP package)
CHOICE /C:SADRXC /N >nul
:: Windows 7 or x64 system CHOICE (uncomment)
REM CHOICE /C SADRXC /N 
If "%errorlevel%"=="1" (Call :Down)
If "%errorlevel%"=="2" (Call :Left)
If "%errorlevel%"=="3" (Call :Rigth)
If "%errorlevel%"=="4" (Call :Rotate)
If "%errorlevel%"=="5" (Goto :Menu)
If "%errorlevel%"=="6" (Call :MovCR)
::Descomentar para doble movimiento
REM Call :Down
Call :CheckL2
Goto :Eof

::::::::::::::::::::::::::::::::::::::::
:Solid
For %%a in (%Table%) do (Set "%%a=%Bound2%")
Goto :Eof

:Rotate
Set "TmpTB="
If "%XToken%"=="11" (Set "XToken=10")
If "%YToken%"=="15" (Set "XToken=14")
Set /a "NextRotate=(%RotateLevel% %% 4)+1"
Set "TmpTable=!Figure%CurFig%_Pos%NextRotate%!
For %%R in (%TmpTable%) do (
Call :MovR "%YToken%" "%XToken%" "%%R" "Val"
Call Set "TmpTB=!TmpTB!,!Val!"
)
For %%c in (%TmpTB:~1%) do (
If "!%%c!"=="%Bound2%" (
For %%b in (%Table%) do (Set "%%b=%Bound%")
Goto :Eof
))
For %%a in (%Table%) do (Set "%%a= ")
Set "Table=%TmpTB:~1%"
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "RotateLevel+=1"
Goto :Eof

:MovR
For /f "tokens=1,2 delims=X,Y" %%p in ("%~3") do (
Set /a MovY=%%q+%~1
Set /a MovX=%%p+%~2
Set "%~4=X!MovX!Y!MovY!"
Set "%~3= ")
Goto :Eof

:::::::::::::::::::::::::::::::::::::::::::
:Down
Set "TmpTB="
Set "TmpTable=%Table%"
For %%a in (%TmpTable%) do (
Echo.!TmpTable!|Find "Y%BBound%">nul
If !Errorlevel! EQU 0 (Set "New_F=True"&Goto :Eof)
Call :MovYR "1" "%%a" "Val"
Call Set "TmpTB=!TmpTB!,!Val!"
)
For %%c in (%TmpTB:~1%) do (
If "!%%c!"=="%Bound2%" (
Set "New_F=True"
For %%b in (%Table%) do (Set "%%b=%Bound%")
Goto :Eof
))
Set "Table=%TmpTB:~1%"
For %%d in (%Table%) do (Set "%%d=%Bound%")
Set /a "YToken+=1"
Goto :Eof

:MovYR
For /f "tokens=1,2 delims=X,Y" %%p in ("%~2") do (
Set /a MovY=%%q+%~1
Set "%~3=X%%pY!MovY!"
Set "%~2= ")
Goto :Eof

:MovCR
Cls
Echo.
Echo.
Call :L2 "Goto :Eof"
Echo.
For /f "tokens=2 skip=3" %%c in ('find "::_0" %Game%') do (
Set "Tmp_Var=%%c"
Call :Key.A Tmp_Var
Echo. !Tmp_Var!
)
Pause >nul
Goto :Eof
::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::
:Rigth
Set "TmpTB="
Set "TmpTable=%Table%"
For %%a in (%TmpTable%) do (
Echo.!TmpTable!|Find "X%RBound%">nul
If !Errorlevel! EQU 0 (Goto :Eof)
Call :MovXR "+1" "%%a" "Val"
Call Set "TmpTB=!TmpTB!,!Val!"
)
For %%c in (%TmpTB:~1%) do (
If "!%%c!"=="%Bound2%" (
For %%b in (%Table%) do (Set "%%b=%Bound%")
Goto :Eof
))
Set "Table=%TmpTB:~1%"
For %%d in (%Table%) do (Set "%%d=%Bound%")
Set /a "XToken+=1"
Goto :Eof

:Left
Set "TmpTB="
Set "TmpTable=%Table%"
For %%a in (%TmpTable%) do (
Echo.!TmpTable!|Find "X%LBound%">nul
If !Errorlevel! EQU 0 (Goto :Eof)
Call :MovXR "-1" "%%a" "Val"
Call Set "TmpTB=!TmpTB!,!Val!"
)
For %%c in (%TmpTB:~1%) do (
If "!%%c!"=="%Bound2%" (
For %%b in (%Table%) do (Set "%%b=%Bound%")
Goto :Eof
))
Set "Table=%TmpTB:~1%"
For %%d in (%Table%) do (Set "%%d=%Bound%")
Set /a "XToken-=1"
Goto :Eof

:MovXR
For /f "tokens=1,2 delims=X,Y" %%p in ("%~2") do (
Set /a MovX=%%p%~1
Set "%~3=X!MovX!Y%%q"
Set "%~2= ")
Goto :Eof

::::::::::::::::::::::::::::::::::::::::

:CheckL2
If "!Lin_1!"=="²²²²²²²²²²²²²²²²²²²" (Goto :Lost)
If "!Lin_%LimY%!"=="²²²²²²²²²²²²²²²²²²²" (
Call :Clear
For /l %%x in (0,1,%LimX%) do (
For /l %%y in (%LimY%,-1,1) do (
Set /a "UpLine=%%y-1"
Call Set "X%%xY%%y=%%X%%xY!UpLine!%%"
))
Set /a "Points+=100"
For /l %%d in (0,1,%LimX%) do (Set "X%%dY0= ")
Goto :CheckL2
)
Goto :Eof

:::::::::::::::::::::::::::::::::::::::::

:Key.A
If not defined %1 Goto:Eof
Set "c="
Set "d=0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz =/\()[]{}_-.:,;* @#"
:Key.B
Set "chr=!%1:~,1!"
For /l %%l in (0 1 80) do if "!chr!" equ "!d:~%%l,1!" (
  set /a "x=%%l^5"
  call set "c=!c!%%d:~!x!,1%%"
)
Set "%1=!%1:~1!"
If defined %1 goto:Key.B
Set "%1=!c!"
Goto :Eof
:::::::::::::::::::::::::::::::::::::::::

:Clear
For /l %%m in (0,1,%LimY%) do (Set Lin_%%m=)
For /l %%d in (0,1,%LimY%) do (
For /l %%e in (0,1,%LimX%) do (
Set Lin_%%d=!Lin_%%d!!X%%eY%%d!))
Goto :Eof

:Lost
Cls
Echo.
Echo.  Tetris v 1 by SmartGenius
Echo.
Echo.     Points:%Points%
Echo.        Perdiste !
Goto :End

:Win
Cls
Echo.
Echo.  Tetris v 1 by SmartGenius
Echo.
Echo.     Points:%Points%
Echo.      Has Ganado !
Goto :End

:End
Echo.     Gracias por Jugar 
Echo.  Tetris v1 by SmartGenius
Endlocal
Ping -n 3 localhost >nul
Exit

::::::::::::::::::::::::::::::::::::::::::
:Figure1
Set Figure1_Pos1=X6Y2,X6Y1,X7Y1,X7Y0
Set Figure1_Pos2=X7Y1,X8Y1,X6Y0,X7Y0
Set Figure1_Pos3=X6Y2,X6Y1,X7Y1,X7Y0
Set Figure1_Pos4=X7Y1,X8Y1,X6Y0,X7Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure1_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=1","RotateLevel=%R%"
Goto :Eof

:Figure2
Set Figure2_Pos1=X7Y2,X6Y1,X7Y1,X6Y0
Set Figure2_Pos2=X6Y1,X7Y1,X7Y0,X8Y0
Set Figure2_Pos3=X7Y2,X6Y1,X7Y1,X6Y0
Set Figure2_Pos4=X6Y1,X7Y1,X7Y0,X8Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure2_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=2","RotateLevel=%R%"
Goto :Eof

:Figure3
Set Figure3_Pos1=X7Y1,X8Y1,X7Y0,X8Y0
Set Figure3_Pos2=X7Y1,X8Y1,X7Y0,X8Y0
Set Figure3_Pos3=X7Y1,X8Y1,X7Y0,X8Y0
Set Figure3_Pos4=X7Y1,X8Y1,X7Y0,X8Y0
Set /a "R=(%Random% %% 4)+1"
Set "Table=!Figure3_Pos%R%!"
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=3","RotateLevel=%R%"
Goto :Eof

:Figure4
Set Figure4_Pos1=X6Y1,X7Y1,X8Y1
Set Figure4_Pos2=X7Y2,X7Y1,X7Y0
Set Figure4_Pos3=X6Y1,X7Y1,X8Y1
Set Figure4_Pos4=X7Y2,X7Y1,X7Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure4_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=4","RotateLevel=%R%"
Goto :Eof

:Figure5
Set Figure5_Pos1=X6Y1,X7Y1,X8Y1,X7Y0
Set Figure5_Pos2=X7Y2,X7Y1,X8Y1,X7Y0
Set Figure5_Pos3=X7Y1,X6Y0,X7Y0,X8Y0
Set Figure5_Pos4=X8Y2,X7Y1,X8Y1,X8Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure5_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=5","RotateLevel=%R%"
Goto :Eof

:Figure6
Set Figure6_Pos1=X6Y1,X6Y0,X7Y0,X8Y0
Set Figure6_Pos2=X8Y2,X8Y1,X8Y0,X7Y0
Set Figure6_Pos3=X6Y1,X7Y1,X8Y1,X8Y0
Set Figure6_Pos4=X6Y2,X7Y2,X6Y1,X6Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure6_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=6","RotateLevel=%R%"
Goto :Eof

:Figure7
Set Figure7_Pos1=X8Y1,X6Y0,X7Y0,X8Y0
Set Figure7_Pos2=X7Y2,X8Y2,X8Y1,X8Y0
Set Figure7_Pos3=X6Y1,X7Y1,X8Y1,X6Y0
Set Figure7_Pos4=X6Y2,X6Y1,X6Y0,X7Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure7_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=7","RotateLevel=%R%"
Goto :Eof

::_0 xx9tYjYxWvxPrXmoLjqfzpxx
::_0 xxxxxXhXxLBINRPFGBaxxxxxx
::_0 xxxxxxxxxxxxxxxxxxxxxxxxx
::_0 xxxxx8jYfZXojYxOtxJvxxxxx
::_0 EjXzofizgxLfmgimfjqYx9GVJ
::_0 xxxJvx8XmgfqlxNxGtyjxRxxx
::_0 xxxxxxxxxxxxxxxxxxxxxxxxx
::_0 xPrXmoLjqfzpx9tms-x7545xxx

:Help
Cls
Echo.
Call :L2 "Goto :Eof"
Echo.
Echo. How to Play Batch Tetris ?
Echo.
Echo. Use keys A,S,D,R,X
Echo.
Echo. A = Move Shape Left
Echo. S = Move Shape Down
Echo. D = Move Shape Rigth
Echo. R = Rotate Shape
Echo. X = Back to Menu Game
Echo.
Echo. 
Pause >nul
Goto :Menu

:Logo
Cls
Color 0b
Echo.
Echo. °°°°°°°°°°°°°°°°°°°°°°°°°°
Echo. °°°°°°°°°°°°°°°°°°°°°°°°°°
:L2
Echo. °°ÛÛÛ°ÛÛÛ°ÛÛÛ°ÛÛ°°Û°°ÛÛ°°°
Echo. °°°Û°°Û°°°°Û°°Û°Û°Û°Û°°°°°
Echo. °°°Û°°ÛÛÛ°°Û°°ÛÛ°°Û°°Û°°°°
Echo. °°°Û°°Û°°°°Û°°Û°Û°Û°°°Û°°°
Echo. °°°Û°°ÛÛÛ°°Û°°Û°Û°Û°ÛÛ°°°°
%~1
Echo. °°°°°°°°°°°°°°°°°°°°°°°°°°
Echo. °°±°°°°°°°°°²°°°°°°°°°°±°°
Echo. °°±°²°°°²²°°²²°°°²²²°°°±°°
Echo. °°±°²²°°°²°°²°°°°°°°°°°±°°
Echo. °°±°°²°°°²°°°°°°²²°°°°°±°°
Echo. °°±°°°°°°°°°°°°°°²²°°°°±°°
Echo. °°±°°°°°°°°²°°°°°°°°°°°±°°
Echo. °°±²°°°°°°°²²²°°°°°°°°°±°°
Echo. °°±²°°²²°°°°°°°²°°°°°°²±°°
Echo. °°±²°°²²°°°°°°²²²°°°²²²±°°
Echo. °°±±±±±±±±±±±±±±±±±±±±±±°°
Echo. °°°°°°°°°°°°°°°°°°°°°°°°°°
Echo. °°°°°: SmartGenius :°°°°°°
Echo. °°°°°  Corp.  2010  °°°°°°
Echo. °°°°°°°°°°°°°°°°°°°°°°°°°°
Ping -n 3 0.0.0.0 >nul
Goto :Eof
