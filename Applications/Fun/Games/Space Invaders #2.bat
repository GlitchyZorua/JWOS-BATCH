@echo off
	
title Space Invaders "BETA_CODE" ^| By STRYK ^|
	
color 00
	
 
	
::  ##################    --------------   COPYRIGHT  stryk@live.fr   --------------    ##################
	
 
	
:: ######################## --- REPLY.COM --- ########################
	
goto :NEXT_CREAT_REPLY
	
n reply.com
	
e 0000 4D 5A 2E 00 01 00 00 00 02 00 00 10 FF FF F0 FF
	
e 0010 FE FF 00 00 00 01 F0 FF 1C 00 00 00 00 00 00 00
	
e 0020 B4 08 CD 21 3C 00 75 02 CD 21 B4 4C CD 21
	
rcx
	
002E
	
w0
	
q
	
:NEXT_CREAT_REPLY
	
debug < "%~f0" >nul
	
:: ###################################################################
	
 
	
call :TXTCOLOR
	
set COLOR=TXTCOLOR.exe
	
 
	
set MOVE=1
	
set NAV=#
	
set SHOOT=0
	
set RESET_SHOOT=OFF
	
set LEVEL=LVL_1
	
 
	
for /l %%A in (1,1,4) do (
	
    set NPC_%%A=AA
	
   )
	
 
	
:REMOVE
	
goto :%LEVEL%
	
 
	
:LVL_1
	
:: \\ NPC_LVL_1
	
cls
	
%COLOR% 00 0 "           "
	
%COLOR% %NPC_1% 0 "###"
	
%COLOR% 00 0 "               "
	
%COLOR% %NPC_2% 0 "###"
	
%COLOR% 00 0 "               "
	
%COLOR% %NPC_3% 0 "###"
	
%COLOR% 00 0 "               "
	
%COLOR% %NPC_4% 1 "###"
	
%COLOR% 00 0 "            "
	
%COLOR% %NPC_1% 0 "#"
	
%COLOR% 00 0 "                 "
	
%COLOR% %NPC_2% 0 "#"
	
%COLOR% 00 0 "                 "
	
%COLOR% %NPC_3% 0 "#"
	
%COLOR% 00 0 "                 "
	
%COLOR% %NPC_4% 1 "#"
	
 
	
 
	
 
	
if %SHOOT%==0 (
	
    echo. &echo. &echo. &echo. &echo. &echo. &echo. &echo.
	
    echo. &echo. &echo. &echo. &echo. &echo. &echo. &echo.
	
   goto :JUMP_SHOOT
	
   )
	
 
	
:SHOOT
	
::  ###############################################  :SHOOT ################################################
	
 
	
if %SHOOT%==16 (
	
    if %MOVE%==1 set NPC_1=00
	
   if %MOVE%==1000 set NPC_2=00
	
   if %MOVE%==1000000 set NPC_3=00
	
   if %MOVE%==1000000000 set NPC_4=00
	
   )
	
 
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
if %SHOOT%==17 (
	
   set RESET_SHOOT=ON
	
   set SHOOT=0
	
   if %NPC_1%%NPC_2%%NPC_3%%NPC_4%==00000000 goto :WIN_LVL_1
	
  )
	
if %SHOOT%==16 (
	
    %COLOR% 0C 1 "| "
	
  ) else (
	
    %COLOR% 00 1 "NO"
	
    )
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
if %SHOOT%==15 (
	
    %COLOR% 0C 1 "| "
	
  ) else (
	
    %COLOR% 00 1 "NO"
	
    )
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
if %SHOOT%==14 (
	
    %COLOR% 0C 1 "| "
	
  ) else (
	
    %COLOR% 00 1 "NO"
	
    )
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
if %SHOOT%==13 (
	
    %COLOR% 0C 1 "| "
	
  ) else (
	
    %COLOR% 00 1 "NO"
	
    )
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
if %SHOOT%==12 (
	
    %COLOR% 0C 1 "| "
	
  ) else (
	
    %COLOR% 00 1 "NO"
	
    )
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
if %SHOOT%==11 (
	
    %COLOR% 0C 1 "| "
	
  ) else (
	
    %COLOR% 00 1 "NO"
	
    )
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
if %SHOOT%==10 (
	
    %COLOR% 0C 1 "| "
	
  ) else (
	
    %COLOR% 00 1 "NO"
	
    )
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
if %SHOOT%==9 (
	
    %COLOR% 0C 1 "| "
	
  ) else (
	
    %COLOR% 00 1 "NO"
	
    )
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
if %SHOOT%==8 (
	
    %COLOR% 0C 1 "| "
	
  ) else (
	
    %COLOR% 00 1 "NO"
	
    )
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
if %SHOOT%==7 (
	
    %COLOR% 0C 1 "| "
	
  ) else (
	
    %COLOR% 00 1 "NO"
	
    )
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
if %SHOOT%==6 (
	
    %COLOR% 0C 1 "| "
	
  ) else (
	
    %COLOR% 00 1 "NO"
	
    )
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
if %SHOOT%==5 (
	
    %COLOR% 0C 1 "| "
	
  ) else (
	
    %COLOR% 00 1 "NO"
	
    )
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
if %SHOOT%==4 (
	
    %COLOR% 0C 1 "| "
	
  ) else (
	
    %COLOR% 00 1 "NO"
	
    )
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
if %SHOOT%==3 (
	
    %COLOR% 0C 1 "| "
	
  ) else (
	
    %COLOR% 00 1 "NO"
	
    )
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
if %SHOOT%==2 (
	
    %COLOR% 0C 1 "| "
	
  ) else (
	
    %COLOR% 00 1 "NO"
	
    )
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
if %SHOOT%==1 (
	
    %COLOR% 0C 1 "| "
	
  ) else (
	
    %COLOR% 00 1 "NO"
	
    )
	
 
	
if %RESET_SHOOT%==OFF set /a SHOOT = SHOOT + 1
	
 
	
 
	
::  #############################################  :END SHOOT ##############################################
	
 
	
:JUMP_SHOOT
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE% "
	
%COLOR% 99 1 "%NAV%"
	
%COLOR% 00 0 "     %MOVE%%MOVE%%MOVE%%MOVE%%MOVE%%MOVE%"
	
%COLOR% 99 1 "%NAV%%NAV%%NAV%"
	
 
	
%COLOR% EE 1 "--------------------------------------------------------------------------------"
	
echo.
	
%COLOR% 05 1 "                                   LEVEL - 1 "
	
 
	
if %SHOOT%==0 (
	
    set RESET_SHOOT=OFF
	
    call :USE_REPLY
	
  ) else (
	
    @ping localhost -n 1 >nul
	
    goto :REMOVE
	
   )
	
 
	
if %TOUCH%==SPACE (
	
    set TOUCH=UNDEFINED
	
    set SHOOT=1
	
    goto :REMOVE
	
    )
	
 
	
if %MOVE%==1000000000 goto :NO_RIGHT
	
if %TOUCH%==RIGHT set /a MOVE = MOVE * 10
	
:NO_RIGHT
	
if %MOVE%==1 goto :NO_LEFT
	
if %TOUCH%==LEFT set /a MOVE = MOVE / 10
	
:NO_LEFT
	
goto :REMOVE
	
 
	
:WIN_LVL_1
	
cls
	
%COLOR% DD 1 "--------------------------------------------------------------------------------"
	
echo.
	
%COLOR% E0 1 "                    CONGRATULATION _ LEVEL 1 Completed ...                      "
	
echo.
	
%COLOR% DD 1 "--------------------------------------------------------------------------------"
	
pause>nul
	
exit
	
 
	
:: ######################## --- Table ERRORLEVEL de REPLY.COM --- ########################
	
:USE_REPLY
	
REPLY
	
set TOUCH=UNDEFINED
	
if %errorlevel%==32 set TOUCH=SPACE
	
if %errorlevel%==75 set TOUCH=LEFT
	
if %errorlevel%==77 set TOUCH=RIGHT
	
goto :EOF
	
 
	
:: ##############################  TXT_COLOR  By CARLOS  ##############################
	
:TXTCOLOR
	
Echo.Const W=^2>t.vbs&Echo.Set o=WScript.StdOut>>t.vbs
	
For %%b In (
	
"4D53434600000000BA030000000000002C000000000000000301010001000000000000"
	
"004900000001000100D20700000000000000009E3B8A662000747874636F6C6F722E65"
	
"78650063EB078D6903D207434BDD544B681341189E6D538D35352AE2030F4EC44A458D"
	
"55113C88D4C75A85AA5B5A2F8AD66D324997A6BB7177A2297868498B9450ECA182871E"
	
"7AF0E0C183878AA98844DA83828288074FE24549B1A00785452AEB3F8F3C5A7C54BD39"
	
"F0E77F7FF3CD9FD9397976045523847C209E87500E89D5847EBFFA40566C7AB0024D2C"
	
"7B1ECA292DCF43ED5D868393B615B7F51E1CD14DD3A2B893603B6562C3C4474FB7E11E"
	
"2B4AC27575B55B2486A622D4A254CDC37D8B82D5CB9525F3624DABE167250896EC985D"
	
"25782354D6A851C4A70F237E2E5EB8B25297145F1701EFC022CEFAA76B0C70F7FF221F"
	
"A6244D8B644036540BDE950B202E86A33AD5C17EA188C04BA6E78F864D23FFB73CCF0C"
	
"BDEB9F6D006324ABFA33AE2F38180016593590C9FBB2FED6C228789969DF903AC7637E"
	
"16EB2BC6DCAC3A9771157E6782A3F9C17C7060032A77071F295AE19C289EB9C413505E"
	
"5559DEB4B07C872867B97D15B9CC6385A7EBCAE9B5909EA945F2CACE0498C586F3A146"
	
"04D80FA7EDFE8CA25FEE995704C53298E865C7630D5F7983CBCC8F254E93EC8F6B9D64"
	
"95AD6C28190E12280D6AB2767E3E52CC33D47ED7637CAE8D0BE48C8B8203AB8AB6121C"
	
"A86124328CCE17CFF3B44258617C3E0FAB6FB4ACFA592B6C55F830FBDFB24F5684362A"
	
"9259207BD21D525F0F3E9530FC544B71139A616EAE062CE8789D455A0E31BBC04E0BCC"
	
"82F7D5F702EA45690EEB99E5E75553BCCAC747CCE7F374AA747FD6B0FB9313439BCDB1"
	
"0F0FB091025D3778979F776985EB0263589DD578B5360CDB0DAB2EC89C56E8E5D9358C"
	
"02CC010462E7BF791E9FDAA7ACFA492B5C1000B0B5573F86D9E5F1EAC7A5BE25F56DA9"
	
"A7A57E22F533A9EF487D57EA09A973523FC48B79FBFE9755EFD43B08AE084DD38895B0"
	
"EC304913DCA947BAE3B69532A30D8D3B8F6D8B5936A970E181374C7A8A5C69314CD2D0"
	
"B86BF736BC997611CC5EB4CDB50BF05FE1B21D08897771AE22761562D3F8C7DCD6410E"
	
"836C07D9077210A419A41D8480A442A26E08F44D907BA17FEBEB712E476C1A8E2612E0"
	
"38D44E10130CC349478DB841B959B4204B2D56C6671103A3236299D4B612B124733A1C"
	
"423BF464B283F626090FC409EDD10D53B7E30EF8240D30DDC4364962EF1EB96333A16D"
	
"347A5C37A30922DC2396E95809D216B109310FA76231629F30631624DB4AC97698FA21"
	
) Do >>t.vbs (
	
Echo.For b=1To 69Step 2:o.Write Chr(Clng("&H"^&Mid(%%b,b,W^)^)^):Next)
	
For %%b In ("4A6DA33345591BFA0E"
	
) Do >>t.vbs (
	
Echo.For b=1To 17Step 2:o.Write Chr(Clng("&H"^&Mid(%%b,b,W^)^)^):Next)
	
Cscript /Nologo t.vbs > TXTCOLOR.ex_
	
Del /f /q /a t.vbs >nul 2>&1
	
Expand -r TXTCOLOR.ex_ >nul 2>&1
	
Del /f /q /a TXTCOLOR.ex_ >nul 2>&1
	
Goto :Eof
	
:: ################################  End TXT_COLOR  ################################