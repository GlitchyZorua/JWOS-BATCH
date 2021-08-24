@ECho off
:s
set a1=_&set a2=_&set a3=_&set a4=_&set b1=_&set b2=_&set b3=_&set b4=_&set c1=_&set c2=_&set c3=_&set c4=_
set d3=_&set d4=_&set e1=_&set e2=_&set e3=_&set e4=_&set f1=_&set f2=_&set f3=_&set f4=_&set d1=_&set d2=_
set moves=0&set AC=1&set BC=1&set CC=1&set DC=1&set FC=1&set EC=1
cls&call :board
:start
call :player
call :winlist
GOTO :computer
:AFTER
set /a moves= %moves% + 1
if %moves%==12 goto tie
GOTO START
:player
call :board&set /p P1="ENTER A LETTER:"
if /i %p1%%AC%==A1 set A1=X&Set /a AC= %AC%+1&EXIT /B
if /i %p1%%AC%==A2 set A2=X&Set /a AC= %AC%+1&EXIT /B
if /i %p1%%AC%==A3 set A3=X&Set /a AC= %AC%+1&EXIT /B
if /i %p1%%AC%==A4 set A4=X&Set /a AC= %AC%+1&EXIT /B
if /i %p1%%BC%==B1 set B1=X&set /a BC= %BC%+1&EXIT /B
if /i %p1%%BC%==B2 set B2=X&set /a BC= %BC%+1&EXIT /B
if /i %p1%%BC%==B3 set B3=X&set /a BC= %BC%+1&EXIT /B
if /i %p1%%BC%==B4 set B4=X&set /a BC= %BC%+1&EXIT /B
if /i %p1%%CC%==C1 set C1=X&set /a CC= %CC%+1&EXIT /B
if /i %p1%%CC%==C2 set C2=X&set /a CC= %CC%+1&EXIT /B
if /i %p1%%CC%==C3 set C3=X&set /a CC= %CC%+1&EXIT /B
if /i %p1%%CC%==C4 set C4=X&set /a CC= %CC%+1&EXIT /B
if /i %p1%%DC%==D1 set D1=X&set /a DC= %DC%+1&EXIT /B
if /i %p1%%DC%==D2 set D2=X&set /a DC= %DC%+1&EXIT /B
if /i %p1%%DC%==D3 set D3=X&set /a DC= %DC%+1&EXIT /B
if /i %p1%%DC%==D4 set D4=X&set /a DC= %DC%+1&EXIT /B
if /i %p1%%EC%==E1 set E1=X&set /a EC= %EC%+1&EXIT /B
if /i %p1%%EC%==E2 set E2=X&set /a EC= %EC%+1&EXIT /B
if /i %p1%%EC%==E3 set E3=X&set /a EC= %EC%+1&EXIT /B
if /i %p1%%EC%==E4 set E4=X&set /a EC= %EC%+1&EXIT /B
if /i %p1%%FC%==F1 set F1=X&set /a FC= %FC%+1&EXIT /B
if /i %p1%%FC%==F2 set F2=X&set /a FC= %FC%+1&EXIT /B
if /i %p1%%FC%==F3 set F3=X&set /a FC= %FC%+1&EXIT /B
if /i %p1%%FC%==F4 set F4=X&set /a FC= %FC%+1&EXIT /B
ECHO Invalid&timeout /t 1 /nobreak>nul&GOTO START
:COMPUTER
CALL :ATTACKER
CALL :DEFENDER
:RANDOMERROR
set /a N=%random% %% 6 
IF %N%%AC%==05 GOTO RANDOMERROR
IF %N%%BC%==15 GOTO RANDOMERROR
IF %N%%CC%==25 GOTO RANDOMERROR
IF %N%%DC%==35 GOTO RANDOMERROR
IF %N%%EC%==45 GOTO RANDOMERROR
IF %N%%FC%==55 GOTO RANDOMERROR
IF %N%==0 SET A%AC%=O&SET /A AC= %AC%+1
IF %N%==1 SET B%BC%=O&SET /A BC= %BC%+1
IF %N%==2 SET C%CC%=O&SET /A CC= %CC%+1
IF %N%==3 SET D%DC%=O&SET /A DC= %DC%+1
IF %N%==4 SET E%EC%=O&SET /A EC= %EC%+1
IF %N%==5 SET F%FC%=O&SET /A FC= %FC%+1
call :board&GOTO AFTER
:lose 
call :board&ECho Computer wins&ECho.&ECho Press any key to restart&pause>nul&goto s
:tie
call :board&ECho Tie&ECho.&ECho Press any key to restart&pause>nul&goto s
:win
call :board&EChO You Win&ECho.&ECho Press any key to restart&pause>nul&goto s
:board
cls&ECho.&ECho  _ _ _ _ _ _&ECho ^|%A4%^|%B4%^|%C4%^|%D4%^|%E4%^|%F4%^|
ECho ^|%A3%^|%B3%^|%C3%^|%D3%^|%E3%^|%F3%^|&ECho ^|%A2%^|%B2%^|%C2%^|%D2%^|%E2%^|%F2%^|
ECho ^|%A1%^|%B1%^|%C1%^|%D1%^|%E1%^|%F1%^|&ECho  A B C D E F&ECho.&exit /b
:defender
if %A1%%A2%%A3%%A4%==XXX_ set A4=O&set /a AC= %AC%+1& GOTO AFTER
if %A1%%A2%%A3%%A4%==XX_X set A3=O&set /a AC= %AC%+1& GOTO AFTER
if %A1%%A2%%A3%%A4%==X_XX set A2=O&set /a AC= %AC%+1& GOTO AFTER
if %A1%%A2%%A3%%A4%==_XXX set A1=O&set /a AC= %AC%+1& GOTO AFTER
if %B1%%B2%%B3%%B4%==XXX_ set B4=O&set /a BC= %BC%+1& GOTO AFTER
if %B1%%B2%%B3%%B4%==XX_X set B3=O&set /a BC= %BC%+1& GOTO AFTER
if %B1%%B2%%B3%%B4%==X_XX set B2=O&set /a BC= %BC%+1& GOTO AFTER
if %B1%%B2%%B3%%B4%==_XXX set B1=O&set /a BC= %BC%+1& GOTO AFTER
if %C1%%C2%%C3%%C4%==XXX_ set C4=O&set /a CC= %CC%+1& GOTO AFTER
if %C1%%C2%%C3%%C4%==XX_X set C3=O&set /a CC= %CC%+1& GOTO AFTER
if %C1%%C2%%C3%%C4%==X_XX set C2=O&set /a CC= %CC%+1& GOTO AFTER
if %C1%%C2%%C3%%C4%==_XXX set C1=O&set /a CC= %CC%+1& GOTO AFTER
if %D1%%D2%%D3%%D4%==XXX_ set D4=O&set /a DC= %DC%+1& GOTO AFTER
if %D1%%D2%%D3%%D4%==XX_X set D3=O&set /a DC= %DC%+1& GOTO AFTER
if %D1%%D2%%D3%%D4%==X_XX set D2=O&set /a DC= %DC%+1& GOTO AFTER
if %D1%%D2%%D3%%D4%==_XXX set D1=O&set /a DC= %DC%+1& GOTO AFTER
if %E1%%E2%%E3%%E4%==XXX_ set E4=O&set /a EC= %EC%+1& GOTO AFTER
if %E1%%E2%%E3%%E4%==XX_X set E3=O&set /a EC= %EC%+1& GOTO AFTER
if %E1%%E2%%E3%%E4%==X_XX set E2=O&set /a EC= %EC%+1& GOTO AFTER
if %E1%%E2%%E3%%E4%==_XXX set E1=O&set /a EC= %EC%+1& GOTO AFTER
if %F1%%F2%%F3%%F4%==XXX_ set F4=O&set /a FC= %FC%+1& GOTO AFTER
if %F1%%F2%%F3%%F4%==XX_X set F3=O&set /a FC= %FC%+1& GOTO AFTER
if %F1%%F2%%F3%%F4%==X_XX set F2=O&set /a FC= %FC%+1& GOTO AFTER
if %F1%%F2%%F3%%F4%==_XXX set F1=O&set /a FC= %FC%+1& GOTO AFTER
if %A4%%b4%%c4%%d4%==XXX_ if NOT %d3%==_ set d4=O&Set /a DC= %DC%+1& GOTO AFTER
if %A4%%b4%%c4%%d4%==XX_X if NOT %d3%==_ set c4=O&set /a CC= %CC%+1& GOTO AFTER
if %A4%%b4%%c4%%d4%==X_XX if NOT %d3%==_ set b4=O&set /a BC= %BC%+1& GOTO AFTER
if %A4%%b4%%c4%%d4%==_XXX if NOT %d3%==_ set A4=O&set /a AC= %AC%+1& GOTO AFTER
if %A3%%b3%%c3%%d3%==XXX_ if NOT %d2%==_ set d3=O&set /a DC= %DC%+1& GOTO AFTER
if %A3%%b3%%c3%%d3%==XX_X if NOT %c2%==_ set c3=O&set /a CC= %CC%+1& GOTO AFTER
if %A3%%b3%%c3%%d3%==X_XX if NOT %b2%==_ set b3=O&set /a BC= %BC%+1& GOTO AFTER
if %A3%%b3%%c3%%d3%==_XXX if NOT %a2%==_ set A3=O&set /a AC= %AC%+1& GOTO AFTER
if %A2%%b2%%c2%%d2%==XXX_ if NOT %d1%==_ set d2=O&set /a DC= %DC%+1& GOTO AFTER
if %A2%%b2%%c2%%d2%==XX_X if NOT %c1%==_ set c2=O&set /a CC= %CC%+1& GOTO AFTER
if %A2%%b2%%c2%%d2%==X_XX if NOT %b1%==_ set b2=O&set /a BC= %BC%+1& GOTO AFTER
if %A2%%b2%%c2%%d2%==_XXX if NOT %a1%==_ set A2=O&set /a AC= %AC%+1& GOTO AFTER
if %A1%%b1%%c1%%d1%==XXX_ set d1=O&set /a DC= %DC%+1& GOTO AFTER
if %A1%%b1%%c1%%d1%==XX_X set c1=O&set /a CC= %CC%+1& GOTO AFTER
if %A1%%b1%%c1%%d1%==X_XX set b1=O&set /a BC= %BC%+1& GOTO AFTER
if %A1%%b1%%c1%%d1%==_XXX set A1=O&set /a AC= %AC%+1& GOTO AFTER
if %b4%%c4%%d4%%e4%==XXX_ if NOT %e3%==_ set e3=O&set /a EC= %EC%+1& GOTO AFTER
if %b4%%c4%%d4%%e4%==XX_X if NOT %d3%==_ set d3=O&set /a DC= %DC%+1& GOTO AFTER
if %b4%%c4%%d4%%e4%==X_XX if NOT %c3%==_ set c3=O&set /a CC= %CC%+1& GOTO AFTER
if %b4%%c4%%d4%%e4%==_XXX if NOT %b3%==_ set b3=O&set /a BC= %BC%+1& GOTO AFTER
if %b3%%c3%%d3%%e3%==XXX_ if NOT %e2%==_ set e2=O&set /a EC= %EC%+1& GOTO AFTER
if %b3%%c3%%d3%%e3%==XX_X if NOT %d2%==_ set d2=O&set /a DC= %DC%+1& GOTO AFTER
if %b3%%c3%%d3%%e3%==X_XX if NOT %c2%==_ set c3=O&set /a CC= %CC%+1& GOTO AFTER
if %b3%%c3%%d3%%e3%==_XXX if NOT %b2%==_ set b3=O&set /a BC= %BC%+1& GOTO AFTER
if %b2%%c2%%d2%%e2%==XXX_ if NOT %e1%==_ set e2=O&set /a EC= %EC%+1& GOTO AFTER
if %b2%%c2%%d2%%e2%==XX_X if NOT %d1%==_ set d2=O&set /a DC= %DC%+1& GOTO AFTER
if %b2%%c2%%d2%%e2%==X_XX if NOT %c1%==_ set c2=O&set /a CC= %CC%+1& GOTO AFTER
if %b2%%c2%%d2%%e2%==_XXX if NOT %b1%==_ set b2=O&set /a BC= %BC%+1& GOTO AFTER
if %b1%%c1%%d1%%e1%==XXX_ set e1=O&set /a EC= %EC%+1& GOTO AFTER
if %b1%%c1%%d1%%e1%==XX_X set d1=O&set /a DC= %DC%+1& GOTO AFTER
if %b1%%c1%%d1%%e1%==X_XX set c1=O&set /a CC= %CC%+1& GOTO AFTER
if %b1%%c1%%d1%%e1%==_XXX set b1=O&set /a BC= %BC%+1& GOTO AFTER
if %c4%%d4%%e4%%f4%==XXX_ if NOT %f3%==_ set F4=O&set /a FC= %FC%+1& GOTO AFTER
if %c4%%d4%%e4%%f4%==XX_X if NOT %e3%==_ set E4=O&set /a EC= %EC%+1& GOTO AFTER
if %c4%%d4%%e4%%f4%==X_XX if NOT %d3%==_ set D4=O&set /a DC= %DC%+1& GOTO AFTER
if %c4%%d4%%e4%%f4%==_XXX if NOT %c3%==_ set C4=O&set /a CC= %CC%+1& GOTO AFTER
if %c3%%d3%%e3%%f3%==XXX_ if NOT %f2%==_ set F3=O&set /a FC= %FC%+1& GOTO AFTER
if %c3%%d3%%e3%%f3%==XX_X if NOT %e2%==_ set E3=O&set /a EC= %EC%+1& GOTO AFTER
if %c3%%d3%%e3%%f3%==X_XX if NOT %d2%==_ set D3=O&set /a DC= %DC%+1& GOTO AFTER
if %c3%%d3%%e3%%f3%==_XXX if NOT %c2%==_ set C3=O&set /a CC= %CC%+1& GOTO AFTER
if %c2%%d2%%e2%%f2%==XXX_ if NOT %f1%==_ set F2=O&set /a FC= %FC%+1& GOTO AFTER
if %c2%%d2%%e2%%f2%==XX_X if NOT %e1%==_ set E2=O&set /a EC= %EC%+1& GOTO AFTER
if %c2%%d2%%e2%%f2%==X_XX if NOT %d1%==_ set D2=O&set /a DC= %DC%+1& GOTO AFTER
if %c2%%d2%%e2%%f2%==_XXX if NOT %c1%==_ set C2=O&set /a CC= %CC%+1& GOTO AFTER
if %c1%%d1%%e1%%f1%==XXX_ set F1=O&set /a FC= %FC%+1& GOTO AFTER
if %c1%%d1%%e1%%f1%==XX_X set E1=O&set /a EC= %EC%+1& GOTO AFTER
if %c1%%d1%%e1%%f1%==X_XX set D1=O&set /a DC= %DC%+1& GOTO AFTER
if %c1%%d1%%e1%%f1%==_XXX set C1=O&set /a CC= %CC%+1& GOTO AFTER
if %a1%%b2%%c3%%d4%==XXX_ if NOT %d4%==_ set d4=O&set /a DC= %DC%+ 1& GOTO AFTER
if %a1%%b2%%c3%%d4%==XX_X if NOT %c3%==_ set C3=O&set /a CC= %CC%+ 1& GOTO AFTER
if %a1%%b2%%c3%%d4%==X_XX if NOT %b2%==_ set B2=O&set /a BC= %BC%+ 1& GOTO AFTER
if %a1%%b2%%c3%%d4%==_XXX set A1=O&set /a AC= %AC%+1& GOTO AFTER
if %a4%%b3%%c2%%d1%==XXX_ set D1=O&set /a DC= %DC%+1& GOTO AFTER
if %a4%%b3%%c2%%d1%==XX_X if NOT %c1%==_ set C2=O&set /a CC= %CC%+1& GOTO AFTER
if %a4%%b3%%c2%%d1%==X_XX if NOT %b2%==_ set B3=O&set /a BC= %BC%+1& GOTO AFTER
if %a4%%b3%%c2%%d1%==_XXX if NOT %a3%==_ set A4=O&set /a AC= %AC%+1& GOTO AFTER
if %b1%%C2%%D3%%E4%==XXX_ if NOT %e3%==_ set E4=O&set /a EC= %EC%+1& GOTO AFTER
if %b1%%C2%%D3%%E4%==XX_X if NOT %d2%==_ set D3=O&set /a DC= %DC%+1& GOTO AFTER
if %b1%%C2%%D3%%E4%==X_XX if NOT %c1%==_ set C2=O&set /a CC= %CC%+1& GOTO AFTER
if %b1%%C2%%D3%%E4%==_XXX set B1=O&set /a BC= %BC%+1& GOTO AFTER
if %b4%%C3%%D2%%E1%==XXX_ set E1=O&set /a EC= %EC%+1& GOTO AFTER
if %b4%%C3%%D2%%E1%==XX_X if NOT %d1%==_ set D2=O&set /a DC= %DC%+1& GOTO AFTER
if %b4%%C3%%D2%%E1%==X_XX if NOT %c2%==_ set C3=O&set /a CC= %CC%+1& GOTO AFTER
if %b4%%C3%%D2%%E1%==_XXX if NOT %b3%==_ set B4=O&set /a BC= %BC%+1& GOTO AFTER
if %c1%%d2%%e3%%f4%==XXX_ if NOT %f3%==_ set F4=O&set /a FC= %FC%+1& GOTO AFTER
if %c1%%d2%%e3%%f4%==XX_X if NOT %e2%==_ set E3=O&set /a EC= %EC%+1& GOTO AFTER
if %c1%%d2%%e3%%f4%==X_XX if NOT %d1%==_ set D2=O&set /a DC= %DC%+1& GOTO AFTER
if %c1%%d2%%e3%%f4%==_XXX set C1=O&set /a CC= %CC%+1& GOTO AFTER
if %c4%%d3%%e2%%f1%==XXX_ set F1=O&set /a FC= %FC%+1& GOTO AFTER
if %c4%%d3%%e2%%f1%==XX_X if NOT %e1%==_ set E2=O&set /a EC= %EC%+1& GOTO AFTER
if %c4%%d3%%e2%%f1%==X_XX if NOT %d2%==_ set D3=O&set /a DC= %DC%+1& GOTO AFTER
if %c4%%d3%%e2%%f1%==_XXX if NOT %c3%==_ set C4=O&set /a CC= %CC%+1& GOTO AFTER
exit /b
:attACker
if %A1%%A2%%A3%%A4%==OOO_ if NOT %A3%==_ set A4=O& goto lose
if %A1%%A2%%A3%%A4%==OO_O if NOT %A2%==_ set A3=O& goto lose
if %A1%%A2%%A3%%A4%==O_OO if NOT %A1%==_ set A2=O& goto lose
if %A1%%A2%%A3%%A4%==_OOO set A1=O& goto lose
if %B1%%B2%%B3%%B4%==OOO_ if NOT %B3%==_ set B4=O& goto lose
if %B1%%B2%%B3%%B4%==OO_O if NOT %B2%==_ set B3=O& goto lose
if %B1%%B2%%B3%%B4%==O_OO if NOT %B1%==_ set B2=O& goto lose
if %B1%%B2%%B3%%B4%==_OOO set B1=O& goto lose
if %C1%%C2%%C3%%C4%==OOO_ if NOT %c3%==_ set C4=O& goto lose
if %C1%%C2%%C3%%C4%==OO_O if NOT %c2%==_ set C3=O& goto lose
if %C1%%C2%%C3%%C4%==O_OO if NOT %c1%==_ set C2=O& goto lose
if %C1%%C2%%C3%%C4%==_OOO set C1=O& goto lose
if %D1%%D2%%D3%%D4%==OOO_ if NOT %d3%==_ set D4=O& goto lose
if %D1%%D2%%D3%%D4%==OO_O if NOT %d2%==_ set D3=O& goto lose
if %D1%%D2%%D3%%D4%==O_OO if NOT %d1%==_ set D2=O& goto lose
if %D1%%D2%%D3%%D4%==_OOO set D1=O& goto lose
if %E1%%E2%%E3%%E4%==OOO_ if NOT %e3%==_ set E4=O& goto lose
if %E1%%E2%%E3%%E4%==OO_O if NOT %e2%==_ set E3=O& goto lose
if %E1%%E2%%E3%%E4%==O_OO if NOT %d1%==_ set E2=O& goto lose
if %E1%%E2%%E3%%E4%==_OOO  set E1=O& goto lose
if %F1%%F2%%F3%%F4%==OOO_ if NOT %f3%==_ set F4=O& goto lose
if %F1%%F2%%F3%%F4%==OO_O if NOT %f2%==_ set F3=O& goto lose
if %F1%%F2%%F3%%F4%==O_OO if NOT %f1%==_ set F2=O& goto lose
if %F1%%F2%%F3%%F4%==_OOO set F1=O& goto lose
if %A4%%b4%%c4%%d4%==OOO_ if NOT %d3%==_ set d4=O& goto lose
if %A4%%b4%%c4%%d4%==OO_O if NOT %c3%==_ set c4=O& goto lose
if %A4%%b4%%c4%%d4%==O_OO if NOT %b3%==_ set b4=O& goto lose
if %A4%%b4%%c4%%d4%==_OOO if NOT %a3%==_ set A4=O& goto lose
if %A3%%b3%%c3%%d3%==OOO_ if NOT %d2%==_ set d3=O& goto lose
if %A3%%b3%%c3%%d3%==OO_O if NOT %c2%==_ set c3=O& goto lose
if %A3%%b3%%c3%%d3%==O_OO if NOT %b2%==_ set b3=O& goto lose
if %A3%%b3%%c3%%d3%==_OOO if NOT %a2%==_ set A3=O& goto lose
if %A2%%b2%%c2%%d2%==OOO_ if NOT %d1%==_ set d2=O& goto lose
if %A2%%b2%%c2%%d2%==OO_O if NOT %c1%==_ set c2=O& goto lose
if %A2%%b2%%c2%%d2%==O_OO if NOT %b1%==_ set b2=O& goto lose
if %A2%%b2%%c2%%d2%==_OOO if NOT %a1%==_ set A2=O& goto lose
if %A1%%b1%%c1%%d1%==OOO_ set d1=O& goto lose
if %A1%%b1%%c1%%d1%==OO_O set c1=O& goto lose
if %A1%%b1%%c1%%d1%==O_OO set b1=O& goto lose
if %A1%%b1%%c1%%d1%==_OOO set A1=O& goto lose
if %b4%%c4%%d4%%e4%==OOO_ if NOT %e3%==_ set e4=O& goto lose
if %b4%%c4%%d4%%e4%==OO_O if NOT %d3%==_ set d4=O& goto lose
if %b4%%c4%%d4%%e4%==O_OO if NOT %c3%==_ set c4=O& goto lose
if %b4%%c4%%d4%%e4%==_OOO if NOT %b3%==_ set b4=O& goto lose
if %b3%%c3%%d3%%e3%==OOO_ if NOT %e2%==_ set e3=O& goto lose
if %b3%%c3%%d3%%e3%==OO_O if NOT %d2%==_ set d3=O& goto lose
if %b3%%c3%%d3%%e3%==O_OO if NOT %c2%==_ set c3=O& goto lose
if %b3%%c3%%d3%%e3%==_OOO if NOT %b2%==_ set b3=O& goto lose
if %b2%%c2%%d2%%e2%==OOO_ if NOT %e1%==_ set e2=O& goto lose
if %b2%%c2%%d2%%e2%==OO_O if NOT %d1%==_ set d2=O& goto lose
if %b2%%c2%%d2%%e2%==O_OO if NOT %c1%==_ set c2=O& goto lose
if %b2%%c2%%d2%%e2%==_OOO if NOT %b1%==_ set b2=O& goto lose
if %b1%%c1%%d1%%e1%==OOO_ set e1=O& goto lose
if %b1%%c1%%d1%%e1%==OO_O set d1=O& goto lose
if %b1%%c1%%d1%%e1%==O_OO set c1=O& goto lose
if %b1%%c1%%d1%%e1%==_OOO set b1=O& goto lose
if %c4%%d4%%e4%%f4%==OOO_ if NOT %f3%==_ set F4=O& goto lose
if %c4%%d4%%e4%%f4%==OO_O if NOT %e3%==_ set E4=O& goto lose
if %c4%%d4%%e4%%f4%==O_OO if NOT %d3%==_ set D4=O& goto lose
if %c4%%d4%%e4%%f4%==_OOO if NOT %c3%==_ set C4=O& goto lose
if %c3%%d3%%e3%%f3%==OOO_ if NOT %f2%==_ set F3=O& goto lose
if %c3%%d3%%e3%%f3%==OO_O if NOT %e2%==_ set E3=O& goto lose
if %c3%%d3%%e3%%f3%==O_OO if NOT %d2%==_ set D3=O& goto lose
if %c3%%d3%%e3%%f3%==_OOO if NOT %c2%==_ set C3=O& goto lose
if %c2%%d2%%e2%%f2%==OOO_ if NOT %f1%==_ set F2=O& goto lose
if %c2%%d2%%e2%%f2%==OO_O if NOT %e1%==_ set E2=O& goto lose
if %c2%%d2%%e2%%f2%==O_OO if NOT %d1%==_ set D2=O& goto lose
if %c2%%d2%%e2%%f2%==_OOO if NOT %c1%==_ set C2=O& goto lose
if %c1%%d1%%e1%%f1%==OOO_ set F1=O& goto lose
if %c1%%d1%%e1%%f1%==OO_O set E1=O& goto lose
if %c1%%d1%%e1%%f1%==O_OO set D1=O& goto lose
if %c1%%d1%%e1%%f1%==_OOO set C1=O& goto lose
if %a1%%b2%%c3%%d4%==OOO_ if NOT %d3%==_ set d4=O& goto lose
if %a1%%b2%%c3%%d4%==OO_O if NOT %c2%==_ set C3=O& goto lose
if %a1%%b2%%c3%%d4%==O_OO if NOT %b1%==_ set B2=O& goto lose
if %a1%%b2%%c3%%d4%==_OOO set A1=O& goto lose
if %a4%%b3%%c2%%d1%==OOO_ set D1=O& goto lose
if %a4%%b3%%c2%%d1%==OO_O if NOT %c1%==_ set C2=O& goto lose
if %a4%%b3%%c2%%d1%==O_OO if NOT %b2%==_ set B3=O& goto lose
if %a4%%b3%%c2%%d1%==_OOO if NOT %a3%==_ set A4=O& goto lose
if %b1%%C2%%D3%%E4%==OOO_ if NOT %e3%==_ set E4=O& goto lose
if %b1%%C2%%D3%%E4%==OO_O if NOT %d2%==_ set D3=O& goto lose
if %b1%%C2%%D3%%E4%==O_OO if NOT %c1%==_ set C2=O& goto lose
if %b1%%C2%%D3%%E4%==_OOO set B1=O& goto lose
if %b4%%C3%%D2%%E1%==OOO_ set E1=O& goto lose
if %b4%%C3%%D2%%E1%==OO_O if NOT %d1%==_ set D2=O& goto lose
if %b4%%C3%%D2%%E1%==O_OO if NOT %c2%==_ set C3=O& goto lose
if %b4%%C3%%D2%%E1%==_OOO if NOT %b3%==_ set B4=O& goto lose
if %c1%%d2%%e3%%f4%==OOO_ if NOT %f3%==_ set F4=O& goto lose
if %c1%%d2%%e3%%f4%==OO_O if NOT %e3%==_ set E3=O& goto lose
if %c1%%d2%%e3%%f4%==O_OO if NOT %d1%==_ set D2=O& goto lose
if %c1%%d2%%e3%%f4%==_OOO set C1=O& goto lose
if %c4%%d3%%e2%%f1%==OOO_ set F1=O& goto lose
if %c4%%d3%%e2%%f1%==OO_O if NOT %e1%==_ set E2=O& goto lose
if %c4%%d3%%e2%%f1%==O_OO if NOT %d2%==_ set D3=O& goto lose
if %c4%%d3%%e2%%f1%==_OOO if NOT %c3%==_ set C4=O& goto lose
exit /b
:winlist
call :board
if %A1%%A2%%A3%%A4%==XXXX GOTO WIN
if %B1%%B2%%B3%%B4%==XXXX GOTO WIN
if %C1%%C2%%C3%%C4%==XXXX GOTO WIN
if %D1%%D2%%D3%%D4%==XXXX GOTO WIN
if %E1%%E2%%E3%%E4%==XXXX GOTO WIN
if %F1%%F2%%F3%%F4%==XXXX GOTO WIN
if %A4%%B4%%C4%%D4%==XXXX GOTO WIN
if %A3%%B3%%C3%%D3%==XXXX GOTO WIN
if %A2%%B2%%C2%%D2%==XXXX GOTO WIN
if %A1%%B1%%C1%%D1%==XXXX GOTO WIN
if %B4%%C4%%D4%%E4%==XXXX GOTO WIN
if %B3%%C3%%D3%%E3%==XXXX GOTO WIN
if %B2%%C2%%D2%%E2%==XXXX GOTO WIN
if %B1%%C1%%D1%%E1%==XXXX GOTO WIN
if %C4%%D4%%E4%%F4%==XXXX GOTO WIN
if %C3%%D3%%E3%%F3%==XXXX GOTO WIN
if %C2%%D2%%E2%%F2%==XXXX GOTO WIN
if %C1%%D1%%F1%%E1%==XXXX GOTO WIN
if %A1%%B2%%C3%%D4%==XXXX GOTO WIN
if %A4%%B3%%C2%%D1%==XXXX GOTO WIN
if %B1%%C2%%D3%%E4%==XXXX GOTO WIN
if %B4%%C3%%D2%%E1%==XXXX GOTO WIN
if %C1%%D2%%E3%%F4%==XXXX GOTO WIN
if %C4%%D3%%E2%%F1%==XXXX GOTO WIN
EXIT /B