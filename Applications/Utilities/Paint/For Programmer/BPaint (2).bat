@echo off
setlocal enabledelayedexpansion
set sorting=Disable
set "title=Batch Paint"
set work_row=25
set work_col=80
set col_f=7
set col_b=0
set reload=No
set "loc=%systemdrive%\system\Bpaint"
if not exist "%loc%" (md "%loc%")
if exist "%loc%\sorting.kvc" (set sorting=Enable)
if exist "%loc%\grid_item.kvc" (set /p grid_item=<"%loc%\grid_item.kvc")
if not defined grid_item set grid_item=-
set extra_count=0
set Method=S
set special_char=N
set char_=C
set Tool=Pencil
set tool_code=p
set Delay=250


:top
cls
set count=0
set uncount=0

:top_2
title %title% -- Loading Modules ...Please Wait !!


if defined file (
	set /p size=<"!file!"
	for /f "tokens=1,2" %%a in ("!size!") do (set work_col=%%a&&set work_row=%%b)
	)

set /a real_row=!work_row!+10
set /a real_col=!work_col!+20
set /a work_col_1=!work_col!-1

mode !real_col!,!real_row!

set /a Char_box_start=!work_row!+2
set /a Char_box_stop=!work_col!-2
set /a Char_box_sepr=(!Char_box_stop!/2) - 2

set chr=x
if not defined curFile (set curFile=Untitled.Bim)
fn.dll cursor 0
:: Creating a box giving an outline of default cmd console...
call :Box 1 !Char_box_start! 7 !Char_box_stop! !Char_box_sepr!
set /a char_box_text_1=!Char_box_start!-15

fn.dll sprite !Char_box_start! !char_box_text_1! 08 "Simple Characters"

set /a char_box_text_2=!Char_box_start!+23

fn.dll sprite !Char_box_start! !char_box_text_2! 08 "Special Characters"
call :Box 0 0 1 !real_col! - - + 07
if /i "!sorting!" == "Disable" (set sort_var=N) ELSE (set sort_var=Y)
fn.dll print 70 " New | Save | Open | Sorting [!sort_var!] | Console Size | Enable Grid [!grid_item!] | Saving Method [!Method!] | Help | Quit"


:update_color_box
call :Box !work_col! 11 13 20 - _
call :Box !work_col! 24 6 20 - .


set /a text_Color_box=!work_col!+6
set /a sub_box_col=!work_col!+3
call :box !sub_box_col! 13 5 14 - - + 80
call :box !sub_box_col! 18 5 14 - - + 88
fn.dll sprite 11 !text_Color_box! 08 "Color Box"
fn.dll sprite 24 !text_Color_box! 08 "Tool Box"
fn.dll sprite 13 !text_Color_box! 08 "FG Color"
fn.dll sprite 18 !text_Color_box! 80 "BG Color"

set /a yy=25
set /a xx=!work_col!+3
set xxx=!xx!

for %%a in ("p" "l" "b" "t") do (
	fn.dll sprite !yy! !xx! 00 "%%a"
	set "xy[!extra_count!]=!yy! !xx!"
	set "id[!extra_count!]=T%%~a"
	set /a extra_count+=1
	set /a yy+=1
	)

set /a yy=25
set /a xx=!work_col!+2
set xxx=!xx!


for %%a in ("[]....Pencil","[ ]....Line","[ ]....Box","[ ]....Text") do (
	fn.dll sprite !yy! !xx! 07 "%%~a"
	set /a yy+=1
	)

:: adding preview Function
set /a yy+=1
fn.dll sprite !yy! !xx! 07 "[ ]....Preview"
set /a xx+=1
set "xy[!extra_count!]=!yy! !xx!"
set "id[!extra_count!]=D1"
set /a extra_count+=1


:: adding Delay Function
set /a yy+=1
set /a xx-=1
fn.dll sprite !yy! !xx! 07 "[    ]...Delay"
for /l %%a in (1,1,5) do (
	set "xy[!extra_count!]=!yy! !xx!"
	set "id[!extra_count!]=D2"
	set /a extra_count+=1
	set /a xx+=1
	)
set /a xx+=3
for /l %%a in (1,1,5) do (
	set "xy[!extra_count!]=!yy! !xx!"
	set "id[!extra_count!]=D3"
	set /a extra_count+=1
	set /a xx+=1
	)
set /a xx-=11


:: adding Back Function
set /a yy+=1
set /a xx+=1
fn.dll sprite !yy! !xx! 8f " Backspace "
for /l %%a in (1,1,11) do (
	set "xy[!extra_count!]=!yy! !xx!"
	set "id[!extra_count!]=D4"
	set /a extra_count+=1
	set /a xx+=1
	)

:: adding import Function
set /a yy+=1
set /a xx-=16
fn.dll sprite !yy! !xx! 70 " Import "
for /l %%a in (1,1,8) do (
	set "xy[!extra_count!]=!yy! !xx!"
	set "id[!extra_count!]=D6"
	set /a extra_count+=1
	set /a xx+=1
	)

:: adding Comment Function
set /a xx+=2
fn.dll sprite !yy! !xx! 70 " Comment "
for /l %%a in (1,1,9) do (
	set "xy[!extra_count!]=!yy! !xx!"
	set "id[!extra_count!]=D5"
	set /a extra_count+=1
	set /a xx+=1
	)



set /a yy=!work_row!+3
set /a xx=3
set xxx=!xx!
SET /a xx_limit=!xx!+!Char_box_sepr!-2

for %%a in (0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z . ^& %%% [ ] { } ^( ^) + = - _ ~ $ # @) do (
	fn.dll sprite !yy! !xx! 07 "%%a"
	set "xy[!extra_count!]=!yy! !xx!"
	set "id[!extra_count!]=C%%a"
	set /a extra_count+=1
	set /a xx+=2
	if !xx! geq !xx_limit! (set xx=!xxx!&&set /a yy+=1)
	)
set /a extra_count+=1
	
for %%a in ("/" "^\" "^<" "^>" "^?" "^:" ";" ",") do (
	fn.dll sprite !yy! !xx! 07 "%%a"
	set "xy[!extra_count!]=!yy! !xx!"
	set "id[!extra_count!]=C%%~a"
	set /a extra_count+=1
	set /a xx+=2
	if !xx! geq !xx_limit! (set xx=!xxx!&&set /a yy+=1)
	)

set /a yy=!work_row!+3
set /a xx=!Char_box_sepr!+4
set xxx=!xx!
SET /a xx_limit=!xx!+!Char_box_sepr!-2
fn.dll color 07

for %%a in (      •                     – © ª ® ¯ ° ± ² ³ ´ µ ¶ · ¸ ¹ º » ¼ ½ ¾ ¿ À Á Â Ã Ä Å Æ Ç È É Ê Ë Ì Í Î Ï Ð Ñ Ò Ó Ô Õ Ö × Ø Ù Ú Û Ü Ý Þ ß à) do (
	fn.dll locate !yy! !xx!
	echo.%%a
	set "xy[!extra_count!]=!yy! !xx!"
	set "id[!extra_count!]=S%%a"
	set /a extra_count+=1
	set /a xx+=2
	if !xx! geq !xx_limit! (set xx=!xxx!&&set /a yy+=1)
	)


set /a xx=!sub_box_col!+1
set xxx=!xx!
set /a xx_limit=!sub_box_col!+12
set yy=14

for %%a in (0 1 2 3 4 5 6 7 8 9 a b c d e f) do (
	fn.dll locate !yy! !xx!
	fn.dll color 0%%a
	echo.Û
	set /a ye=!yy!+5
	fn.dll locate !ye! !xx!
	fn.dll color 0%%a
	echo.Û
	set "xy[!extra_count!]=!yy! !xx!"
	set "id[!extra_count!]=F%%a"
	set /a extra_count+=1
	set "xy[!extra_count!]=!ye! !xx!"
	set "id[!extra_count!]=B%%a"
	set /a extra_count+=1
	set /a xx+=2
	if !xx! geq !xx_limit! (set xx=!xxx!&&set /a yy+=1)
	)



call :Box 0 1 !work_row! !work_col! - !grid_item! - 0f

:Update_settings
set /a yy=31
set /a xx=!work_col!+2


:: displaying Delay value
set /a xx+=1
fn.dll sprite !yy! !xx! 07 "!Delay!"

set /a text_cur_sett=!work_col!+2
set /a text_workscreen=!work_col!+1

set /a text_workscreen_value=!work_col!+13
set /a text_workscreenBG_value=!work_col!+17
call :Box !work_col! 1 10 20
set /a text_workscreen_value_=!text_workscreen_value!+1

fn.dll sprite 1 !text_cur_sett! 08 "Current Settings"
fn.dll sprite 3 !text_workscreen! 07 "WorkScreen:"
fn.dll sprite 4 !text_workScreen! 07 "WorkScreen BG: [ ]"
fn.dll sprite 5 !text_workScreen! 07 "WorkScreen FG: [ ]"
fn.dll sprite 6 !text_workScreen! 07 "Active Tool:"
fn.dll sprite 7 !text_workScreen! 07 "Special Char:"
fn.dll sprite 8 !text_workScreen! 07 "Active Char:"


fn.dll sprite 3 !text_workscreen_value! 0e "!work_row!x!work_col!"
fn.dll locate 4 !text_workscreenBG_value!&&fn.dll color !col_b!!col_b!&&echo.Û
fn.dll locate 5 !text_workscreenBG_value!&&fn.dll color !col_f!!col_f!&&echo.Û
fn.dll locate 6 !text_workscreen_value!&&fn.dll color 0e&&echo.!Tool!
fn.dll locate 7 !text_workscreen_value_!&&fn.dll color 0e&&echo.!special_char!
fn.dll locate 8 !text_workscreen_value!&&fn.dll color 0e&&echo.!chr!

:reload
fn.dll color 07
if defined file (
	for /f "eol=; skip=1 tokens=1-6" %%i in (!file!) do (
		if /i "%%n" == "Box" (
			set "input[!count!]=%%i %%j %%k %%l %%m %%n"
			call :Box %%i %%j %%k %%l - - - %%m
			) ELSE (
			If /i "%%i" == "Delay" (
				set "input[!count!]=%%i %%j"
				fn.dll sleep %%j
			) ELSE (
			set "input[!count!]=%%i %%j %%k %%l %%m"
			if /i "%%i" == "S" (fn.dll locate %%j %%k&&fn.dll color %%l&&echo.%%m) ELSE (fn.dll sprite %%j %%k %%l "%%m")
			)
			)
		set /a count+=1
	)
)
title %title% -- !Curfile!
set file=

if /i "!reload!" == "yes" (
	set reload=No
	for /l %%z in (0,1,!count!) do (FOR /F "tokens=1-6" %%A IN ("!input[%%z]!") do (
		if /i "%%F" == "Box" (call :Box %%A %%B %%C %%D - - - %%E) ELSE (
		if /i "%%A" == "Delay" (fn.dll sleep %%B) ELSE (
		if /i "%%A" == "S" (fn.dll locate %%B %%C&&fn.dll color %%D&&echo.%%E) ELSE (fn.dll sprite %%B %%C %%D "%%E")
				)
			)
		)
	)
)

:a
for /f "tokens=1,2,3" %%a in ('fn.dll mouse') do set /a a=%%a,b=%%b,c=%%c
If !a! Equ 0 (
		If !b! Geq 0 If !b! Leq 5  (
			fn.dll sprite 0 0 80 " New "
			set /a msg_area=!work_row! + 1
			if !count! gtr 0 (
				fn.dll sprite !msg_area! 1 07 "Do you Really Want to Create New File?? [y/n]"
				fn.dll locate !msg_area! 0
				fn.dll color 00
				choice /c yn /n
				if /i "!errorlevel!" == "1" goto a_a_a
				goto a_a
				)
			:a_a_a
			for /l %%j in (0,1,!count!) do set input[%%j]=
			call :Box 0 1 !work_row! !work_col! - - - 0f
			set count=0
			set curFile=Untitled.Bim
			title %title% -- !Curfile!
			:a_a
			fn.dll color 07
			fn.dll sprite !msg_area! 1 00 "................................................................................"
			fn.dll sprite 0 0 70 " New "
			goto a
			)
		If !b! Geq 7 If !b! Leq 12 (
			fn.dll sprite 0 6 80 " Save "
			fn.dll sleep 200
			fn.dll sprite 0 6 70 " Save "
			Goto :done
			)
		If !b! Geq 13 If !b! Leq 18 (
			:c
			set /a mid_row=!real_row!/2 - 5
			set /a mid_row_1=!mid_row!+1
			set /a mid_row_2=!mid_row!+2
			set /a mid_row_3=!mid_row!+3
			set /a mid_row_4=!mid_row!+4
			set /a mid_col=!real_col!/2 - 15
			set /a msg_area=!work_row!+1

			set file=
			fn.dll locate !mid_row_3! !mid_col!
			echo.Drag your file Here..and Press Enter...
			fn.dll cursor 100
			fn.dll locate !mid_row_4! !mid_col!
			set /p file=
			fn.dll cursor 0
			if not defined file (set reload=yes&goto top_2)
			if not exist "!file!" (
				set "msg=File Not Found .."
				:e
				fn.dll sprite !mid_row! !mid_col! 17 "  Invalid Selection          "
				fn.dll sprite !mid_row_1! !mid_col! 87 "                             "
				fn.dll sprite !mid_row_2! !mid_col! 87 "     !msg!       "
				fn.dll sprite !mid_row_3! !mid_col! 87 "                             "
				fn.dll sprite !mid_row_4! !mid_col! 87 "                             "
				fn.dll sprite !msg_area! 1 07 "Press Enter to retry...or Esc to cancel"
				:d
				fn.dll kbd
				if /i "!errorlevel!" == "13" goto c
				if /i "!errorlevel!" == "27" (set file=&set reload=yes&goto top_2)
				goto d
				)
			if /i "!file:~-4!" neq ".Bim" (set "msg=Invalid file type"&&goto e)
			set curFile=!file!
			fn.dll sprite !msg_area! 1 00 "Press Enter to retry...or Esc to cancel"
			goto top
		)
	If !b! Geq 19 If !b! Leq 32 (
		if /i "!sorting!" == "Disable" (set sorting=Enable&&echo.Sorting is Set to Enable...>"%loc%\sorting.kvc") ELSE (set sorting=Disable&&del /q "%loc%\sorting.kvc" >nul 2>nul)
		if /i "!sorting!" == "Disable" (set sort_var=N) ELSE (set sort_var=Y)
		fn.dll sprite 0 0 70 " New | Save | Open | Sorting [!sort_var!] | Console Size | Enable Grid [!grid_item!] | Saving Method [!Method!] | Help | Quit"
		goto a
		)
	If !b! Geq 35 If !b! Leq 49 (
		rem Making a Dialog box for getting user defined values for console size...I'm Adding no limits to size here...as you may need any screen size...
		rem The program's functionality totally depends on your wiseness.... #kvc

		set /a mid_row=!real_row!/2 - 7
		set /a title_row=!mid_row!-1
		set /a mid_col=!real_col!/2 - 22
		fn.dll sprite !title_row! !mid_col! 1f " Console Size Settings                  "
		call :box !mid_col! !mid_row! 8 40 - - + 08

		set /a Label_1_row=!title_row!+2
		set /a Label_2_row=!title_row!+3
		set /a Label_1_col=!mid_col!+2
		set /a text_field=!title_row!+6
		set /a text_field_2_col=!Label_1_col!+20

		fn.dll sprite !Label_1_row! !Label_1_col! 80 "Type in the Active option to Apply..."
		fn.dll sprite !Label_2_row! !Label_1_col! 80 "and Press Enter...Leave Empty to exit."
		
		fn.dll sprite !text_field! !Label_1_col! 00 "                "
		fn.dll sprite !text_field! !text_field_2_col! 00 "                "

		set /a row_label=!text_field!-1
		set /a row_label_col=!mid_col!+8

		fn.dll sprite !row_label! !row_label_col! 87 "Rows(25)          Columns(80)"
		:set_row
		set row=
		fn.dll cursor 100
		fn.dll locate !text_field! !Label_1_col!
		fn.dll color 07
		set /p row=
		if not defined row goto end
		if !row! lss 25 goto set_row

		:set_col
		set col=
		fn.dll locate !text_field! !text_field_2_col!
		set /p col=
		if not defined col goto end
		if !col! lss 80 goto set_col

		set work_col=!col!
		set work_row=!row!
		
		:end
		fn.dll cursor 0
		set reload=yes
		rem call :Box 0 1 !work_row! !work_col! - !grid_item! - 0f
		goto top_2
		)
		If !b! Geq 49 If !b! Leq 68 (
			fn.dll locate 0 49&&fn.dll color 80&&echo. Enable Grid [!grid_item!] 
			set var=2
			call :box 49 1 12 17 - - + 08
			fn.dll color 80
			for %%z in ("No Grid" "Grid Type [Å]" "Grid Type [ú]" "Grid Type [ø]" "Grid Type [Î]" "Grid Type [è]" "Grid Type [³]" "Grid Type [º]" "Grid Type [þ]" "Grid Type []" ) do (
				fn.dll locate !var! 50
				echo. %%~z
				set /a var+=1
				)
			:input
			for /f "tokens=1-3" %%x in ('fn.dll mouse') do (set /a x=%%x,y=%%y,z=%%z)
			if !x! Equ 0 if !y! geq 53 if !y! leq 72 (goto end_2)
			if !x! Equ 2 if !y! geq 53 if !y! leq 72 (set grid_item=-&&goto end_2)
			if !x! equ 3 if !y! geq 53 if !y! leq 72 (set grid_item=Å&&goto end_2)
			if !x! equ 4 if !y! geq 53 if !y! leq 72 (set grid_item=ú&&goto end_2)
			if !x! equ 5 if !y! geq 53 if !y! leq 72 (set grid_item=ø&&goto end_2)
			if !x! equ 6 if !y! geq 53 if !y! leq 72 (set grid_item=Î&&goto end_2)
			if !x! equ 7 if !y! geq 53 if !y! leq 72 (set grid_item=è&&goto end_2)
			if !x! equ 8 if !y! geq 53 if !y! leq 72 (set grid_item=³&&goto end_2)
			if !x! equ 9 if !y! geq 53 if !y! leq 72 (set grid_item=º&&goto end_2)
			if !x! equ 10 if !y! geq 53 if !y! leq 72 (set grid_item=þ&&goto end_2)
			if !x! equ 11 if !y! geq 53 if !y! leq 72 (set grid_item=&&goto end_2)
			goto input
			:end_2
			set reload=yes
			fn.dll locate 0 49&&fn.dll color 70&&echo. Enable Grid [!grid_item!] 
			call :Box 0 1 !work_row! !work_col! - !grid_item! - 0f
			goto Update_settings
			)

		If !b! Geq 69 If !b! Leq 82 (
			fn.dll locate 0 67&&fn.dll color 80&&echo. Saving Method [!Method!] 
			set var=2
			call :box 67 1 4 22 - - + 08
			fn.dll color 80
			for %%z in ("I Don't Care [F]" "Minimum Size [S]") do (
				fn.dll locate !var! 68
				echo. %%~z
				set /a var+=1
				)
			:input_
			for /f "tokens=1-3" %%x in ('fn.dll mouse') do (set /a x=%%x,y=%%y,z=%%z)
			if !x! Equ 0 if !y! geq 69 if !y! leq 82 (goto end_3)
			if !x! Equ 2 if !y! geq 69 if !y! leq 82 (set Method=F&&goto end_3)
			if !x! equ 3 if !y! geq 69 if !y! leq 82 (set Method=S&&goto end_3)
			goto input_
			:end_3
			set reload=yes
			fn.dll locate 0 67&&fn.dll color 70&&echo. Saving Method [!Method!] 
			call :Box 0 1 !work_row! !work_col! - !grid_item! - 0f
			goto Update_settings
			)
		if !b! geq 84 if !b! leq 89 (
			goto :Help
			)
		If !b! Geq 94 If !b! Leq 100 (
			fn.dll sprite 0 94 80 " Quit "
			if !count! gtr 0 (
				set /a msg_area=!work_row!+1
				fn.dll sprite !msg_area! 1 00 "Press Enter to retry...or Esc to cancel....................................."
				fn.dll sprite !msg_area! 1 07 "You may lose your Current Unsaved Data...Do you want to Exit?? [y/n]"
				fn.dll color 00
				fn.dll locate !msg_area! 0
				fn.dll sprite 0 94 70 " Quit "
				choice /c  yn /n
				if /i "!errorlevel!" == "1" (Goto lab_el)
				fn.dll sprite !msg_area! 1 00 "Press Enter to retry...or Esc to cancel......................................"
				goto a
				)
			:lab_el
			exit /b 0
			)
		)
if !b! lss !work_col_1! if !a! lss !work_row! if !a! gtr 1 if !b! gtr 0 (
	if /i "!tool_code!" == "l" (
		if not defined xy_1 (
			set "xy_1=!a! !b!"
			set x_1=!b!
			set y_1=!a!
			fn.dll locate !a! !b!
			fn.dll color !col_b!!col_f!
			echo.!chr!
			goto a
			)
		set inc_or_dec=1
		set sign=+
		set "xy_2=!a! !b!"
		set x_2=!b!
		set y_2=!a!

		rem Handing error, if user input reverses...
		if !y_1! gtr !y_2! (
			set inc_or_dec=-1
			set sign=-
			)
		
		if !x_1! gtr !x_2! (
			set inc_or_dec=-1
			set sign=-
			)


		rem Case-I, Considering Vertical line...
		if /i "!x_1!" == "!x_2!" (
		for /l %%j in (!y_1!,!inc_or_dec!,!y_2!) do (
			if /i "!char_!" == "s" (
				fn.dll locate %%j !x_1!
				fn.dll color !col_b!!col_f!
				echo.!chr!
				) ELSE (
				fn.dll sprite %%j !x_1! !col_b!!col_f! "!chr!"
				)
				set "input[!count!]=!Char_! %%j !x_1! !col_b!!col_f! !chr!"
				set /a count+=1 
			)
		goto b_b
		)

		rem Case-II, Considering horizontal line...
		if /i "!y_1!" == "!y_2!" (
			for /l %%j in (!x_1!,!inc_or_dec!,!x_2!) do (
			if /i "!char_!" == "s" (
				fn.dll locate !y_1! %%j
				fn.dll color !col_b!!col_f!
				echo.!chr!
				) ELSE (
				fn.dll sprite !y_1! %%j !col_b!!col_f! "!chr!"
				)
				set "input[!count!]=!Char_! !y_1! %%j !col_b!!col_f! !chr!"
				set /a count+=1
			)
			goto b_b
		)

		rem Case-III, Considering Diagonal line...Some bugs are there...but they will be fixed in next version.
		rem Using Distance Formula for finding length of desired line...
		set /a box_height=!y_2!-!y_1!
		set /a box_length=!x_2!-!x_1!
		set /a a=!box_height!*!box_height!
		set /a b=!box_length!*!box_length!
		set /a result=!a!+!b!
		call :sqrt !result! Line_len
		
		set /a inc_or_dec=1
		set sign=+

		set max_y=!y_1!
		if !y_2! gtr !y_1! (set max_y=!y_2!)

		set max_x=!x_1!
		if !x_2! gtr !x_1! (set max_x=!x_2!)



		if !x_1! gtr !x_2! (
			set /a inc_or_dec=-1
			set sign=-	
			)
		if !y_1! gtr !y_2! (
			set /a inc_or_dec_1=-1
			set sign=-
			)
			
		if !box_length! gtr !box_height! (
			
			set /a parts=!Line_len!/!box_length!
			set /a y_3=!y_1!
			for /l %%A in (!x_1!,!inc_or_dec!,!x_2!) do (
				for /l %%B in (1,1,!parts!) do (
					if !y_3! leq !max_y! (
					if /i "!char_!" == "s" (
						fn.dll locate !y_3! %%A
						fn.dll color !col_b!!col_f!
						echo.!chr!
					) ELSE (
						fn.dll sprite !y_3! %%A !col_b!!col_f! "!chr!"
					)
					set "input[!count!]=!Char_! !y_3! %%A !col_b!!col_f! !chr!"
					set /a count+=1
					set /a y_3+=1
					)
					)
				)
			) ELSE (

			set /a parts=!Line_len!/!box_height!
			set /a x_3=!x_1!
			for /l %%B in (!y_1!,!inc_or_dec_1!,!y_2!) do (
				for /l %%A in (1,1,!parts!) do (
					if !x_3! leq !max_x! (
					if /i "!char_!" == "s" (
						fn.dll locate %%B !x_3!
						fn.dll color !col_b!!col_f!
						echo.!chr!
					) ELSE (
						fn.dll sprite %%B !x_3! !col_b!!col_f! "!chr!"
					)
					set "input[!count!]=!Char_! %%B !x_3! !col_b!!col_f! !chr!"
					set /a count+=1
					set /a x_3+=1
					)
					)
				)
			)
		

		:b_b
		set xy_1=
		set xy_2=
		goto a
		) 

	if /i "!tool_code!" == "t" (
		rem Saving each letter w.r.t. the co-ordinate system...so,it will be easy to load it again later...
		set tmp_=!char_!
		set char_=C
		set text=
		fn.dll locate !a! !b!
		fn.dll color !col_b!!col_f!
		fn.dll cursor 100
		set /p text=
		if not defined text goto ee

		set tmp_=!text!
		set len=0
		:loopp
		if /i "!tmp_!" neq "" (
			set tmp_=!tmp_:~1!
			set /a len+=1
			goto loopp
			)
		set /a len-=1
		for /l %%z in (0,1,!len!) do (
			set "input[!count!]=!Char_! !a! !b! !col_b!!col_f! !text:~%%z,1!"
			set /a b+=1
			set /a count+=1
			)

		:ee
		set Char_=!tmp_!
		fn.dll cursor 0
		fn.dll color 07
		goto a
		)

	if /i "!tool_code!" == "b" (
		if not defined xy_1 (
			set "xy_1=!a! !b!"
			set x_1=!b!
			set y_1=!a!
			fn.dll locate !a! !b!
			fn.dll color !col_b!!col_f!
			echo.!chr!
			goto a
			)
		set "xy_2=!a! !b!"
		set x_2=!b!
		set y_2=!a!

		rem Handing error, if user input reverses...
		if !y_1! gtr !y_2! (
			set tmp_=!y_1!
			set y_1=!y_2!
			set y_2=!tmp_!
			)
		
		if !x_1! gtr !x_2! (
			set tmp_=!x_1!
			set x_1=!x_2!
			set x_2=!tmp_!
			)

		
		set /a box_wid=!x_2!-!x_1!+1
		set /a box_len=!y_2!-!y_1!+1

		call :Box !x_1! !y_1! !box_len! !box_wid! - - - !col_b!!col_f!
		set "input[!count!]=!x_1! !y_1! !box_len! !box_wid! !col_b!!col_f! Box"
		set /a count+=1

		set xy_1=
		set xy_2=
		goto a
		)

	if /i "!tool_code!" == "e" (
		fn.dll sprite !a! !b! 00 "!chr!"
		set "output[!uncount!]=!Char_! !a! !b! !col_b!!col_f! !chr!"
		set /a uncount+=1
		)
	

	if /i "!tool_code!" == "p" (
		if /i "!c!" == "1" (
			if /i "!char_!" == "s" (
				fn.dll locate !a! !b!
				fn.dll color !col_b!!col_f!
				echo.!chr!
				) ELSE (
				fn.dll sprite !a! !b! !col_b!!col_f! "!chr!"
				)
			set "input[!count!]=!Char_! !a! !b! !col_b!!col_f! !chr!"
			set /a count+=1 ) ELSE (
			fn.dll sprite !a! !b! !col_b!!col_b! "!chr!"
			set "output[!uncount!]=!Char_! !a! !b! !col_b!!col_f! !chr!"
			set /a uncount+=1
			)
			goto a
		)
	goto a
	)
for /l %%z in (0,1,!extra_count!) do (
	if /i "!a! !b!" == "!xy[%%z]!" (
		if /i "!id[%%z]:~0,1!" == "F" (set col_f=!id[%%z]:~1,1!)
		if /i "!id[%%z]:~0,1!" == "B" (set col_b=!id[%%z]:~1,1!)
		if /i "!id[%%z]:~0,1!" == "C" (set chr=!id[%%z]:~1,1!&&set char_=C&&set special_char=N)
		if /i "!id[%%z]:~0,1!" == "S" (set chr=!id[%%z]:~1,1!&&set char_=S&&set special_char=Y)
		if /i "!id[%%z]:~0,1!" == "D" (
			if /i "!id[%%z]:~1,1!" == "1" (
				 call :Box 0 1 !work_row! !work_col! - !grid_item! - 0f
				 set reload=yes
				 goto reload
				 )
			if /i "!id[%%z]:~1,1!" == "2" (
				fn.dll locate !a! !b!
				fn.dll cursor 100
				set Delay=
				set /p Delay=
				if not defined Delay set Delay=250
				fn.dll cursor 0
				goto Update_settings
				)
			if /i "!id[%%z]:~1,1!" == "3" (
				set /a msg_area=!work_row!+1
				fn.dll sprite !msg_area! 1 0f "!delay! Milliseconds delay is Added..."
				set "input[!count!]=Delay !Delay! !count!"
				set /a count+=1
				fn.dll sleep 600
				fn.dll sprite !msg_area! 1 00 "!delay! Milliseconds delay is Added..."
				goto a
				)
			if /i "!id[%%z]:~1,1!" == "4" (
				set /a msg_area=!work_row!+1
				set "msg=Last Action Removed..."
				if /i "!count!" == "0" (set "msg=Please do something,so I can delete...")
				fn.dll sprite !msg_area! 1 0f "!msg!"
				if !count! gtr 0 (set /a count-=1)
				set input[!count!]=
				call :Box 0 1 !work_row! !work_col! - !grid_item! - 0f
				set reload=yes
				fn.dll sprite !msg_area! 1 00 "!msg!"
				goto reload
				)
			if /i "!id[%%z]:~1,1!" == "5" (
				set /a msg_area=!work_row!+1
				set /a text_field=!real_row!-1
				set "msg=Enter your Comment..."
				fn.dll sprite !text_field! 1 0f "!msg!"
				fn.dll locate !msg_area! 0
				fn.dll cursor 100
				set Comment=
				fn.dll color 07
				set /p "Comment=>"
				if not defined Comment goto e_e
				set "input[!count!]=;!Comment!"
				set /a count+=1

				:e_e
				fn.dll cursor 0
				fn.dll color !col_b!!col_f!
				fn.dll sprite !msg_area! 0 00 "!Comment!.."
				fn.dll sprite !text_field! 1 00 "!msg!"
				goto a
				)
			if /i "!id[%%z]:~1,1!" == "6" (
				:Z
				set /a mid_col=!real_col!/2 - 15
				set /a mid_row=!real_row!/2 -5
				fn.dll sprite !mid_row! !mid_col! 0f "Drag Here,File to Import + Enter"
				set /a mid_row+=1
				fn.dll locate !mid_row! !mid_col!
				fn.dll cursor 100
				set file=
				set /p file=
				fn.dll cursor 0
				if not defined file (set reload=yes&&goto e_e_e)
				if not exist "!file!" (echo. Invalid file...&&goto Z)
				if /i "!file:~-4!" neq ".Bim" (echo. Invalid file...&&goto Z)


				:e_e_e
				call :Box 0 1 !work_row! !work_col! - !grid_item! - 0f
				goto reload
				)
			)
		if /i "!id[%%z]:~0,1!" == "T" (
			set tool_code=!id[%%z]:~1,1!
			if /i "!tool_code!" == "p" (set Tool=Pencil)
			if /i "!tool_code!" == "l" (set "Tool=Line  ")
			if /i "!tool_code!" == "b" (set "Tool=Box   ")
			if /i "!tool_code!" == "t" (set "Tool=Text  ")
			)
		fn.dll locate 4 !text_workscreenBG_value!&&fn.dll color !col_b!!col_b!&&echo.Û
		fn.dll locate 5 !text_workscreenBG_value!&&fn.dll color !col_f!!col_f!&&echo.Û
		fn.dll locate 6 !text_workscreen_value!&&fn.dll color 0e&&echo.!Tool!
		fn.dll locate 7 !text_workscreen_value_!&&fn.dll color 0e&&echo.!special_char!
		fn.dll locate 8 !text_workscreen_value!&&fn.dll color 0e&&echo.!chr!

		set /a yy=25
		set /a xx=!work_col!+3

		for %%a in ("p" "l" "b" "t") do (
			if /i "!tool_code!" == "%%~a" (fn.dll sprite !yy! !xx! 0f "") ELSE (fn.dll sprite !yy! !xx! 00 "%%~a")
			set /a yy+=1
			)
		set xy_1=
		set xy_2=
		goto a
		)
	)
goto a

:done
if /i "!count!" == "0" (fn.dll sprite 26 1 07 "Can't Save Empty Batch Image ..."&fn.dll sleep 1500&fn.dll sprite 26 1 00 "Can't Save Empty Batch Image ..."&goto a)
fn.dll cursor 100
set file=
setlocal
set /a mid_col=(!work_col!/2) - 12
set /a mid_row=(!work_row!/2) - 1
set /a mid_row_1=!mid_row!+1
set /a mid_row_2=!mid_row!+2
set /a mid_row_3=!mid_row!+3
set /a mid_row_4=!mid_row!+4
set /a mid_row_5=!mid_row!+5
set /a mid_row_6=!mid_row!+6
set /a mid_row_7=!mid_row!+7
set /a mid_row_8=!mid_row!+8

set /a msg_area=!work_row!+1
set /a notification_area=!mid_col!+1
set /a text_field=!mid_col!+2

fn.dll sprite !mid_row! !mid_col! 17 "  Save File Dialog Box          "
fn.dll sprite !mid_row_1! !mid_col! 87 "                                "
fn.dll sprite !mid_row_2! !mid_col! 87 "                                "
fn.dll sprite !mid_row_3! !mid_col! 87 "  Enter the name of your File:  "
fn.dll sprite !mid_row_4! !mid_col! 87 "                                "
fn.dll sprite !mid_row_5! !mid_col! 87 "                                "
fn.dll sprite !mid_row_6! !mid_col! 87 "                                "
fn.dll sprite !mid_row_7! !mid_col! 87 "                                "
fn.dll sprite !mid_row_5! !text_field! 00 "                            "
fn.dll locate !mid_row_5! !text_field!
fn.dll color 07
set /p file=
fn.dll cursor 0
if not defined file (call :Box 0 1 !work_row! !work_col! - !grid_item! - 0f&&set reload=yes&&goto reload)
if /i "!file:~-4!" neq ".Bim" (set file=!file!.Bim)
if exist "!file!" (
	fn.dll locate !msg_area! 1
	fn.dll color 07
	echo.A file named "!file!" Already Exists...Do you want to overwrite?? [y/n]...
	fn.dll locate !msg_area! 0
	fn.dll color 00
	choice /c yn /n 
	if /i "!errorlevel!" == "1" (
		del /q "!file!" >nul 2>&1 2>nul
		set file=!file:~0,-4!
		fn.dll color 07
		goto proceed
		)
	fn.dll color 07
	goto done
	)
:proceed

rem Using nested for loop...for elimnating the repeating values in variables...it may take longer to save a larger file...
rem but saves time while reopening it...

rem Till now, i can't find another faster way to save 'Bim' file...but i'm still working on it...

rem resetting all essential variables...
set per2=0

fn.dll sprite !mid_row_7! !notification_area! 87 "Saving..."
set /a per_area=!notification_area!+9
if /i "!Method!" == "S" (
for /l %%a in (0,1,!count!) do (
	set /a new_var=%%a+1
	for /l %%b in (!new_var!,1,!count!) do (if defined input[%%b] (if /i "!input[%%a]!" == "!input[%%b]!" (set input[%%b]=)))
	set /a per2=%%a0000/!count!
	set per2_1=!per2:~0,-2!
	set per2_2=!per2:~-2!
	set per2=!per2_1!.!per2_2!
	fn.dll sprite !mid_row_7! !per_area! 8a "!per2!%%"
	)
)

set per2=0
set /a per_area=!notification_area!+20

if !uncount! gtr 0 (
	fn.dll sprite !mid_row_7! !notification_area! 8f "Fixing Image Bugs..."
	for /l %%a in (0,1,!uncount!) do (
	for /l %%b in (0,1,!count!) do (if defined input[%%b] (if /i "!output[%%a]!" == "!input[%%b]!" (set input[%%b]=)))
	set /a per2=%%a0000/!uncount!
	set per2_1=!per2:~0,-2!
	set per2_2=!per2:~-2!
	set per2=!per2_1!.!per2_2!
	fn.dll sprite !mid_row_7! !per_area! 8a "!per2!%%"
	)
)

if /i "!file:~-4!" == ".Bim" set file=!file:~0,-4!
echo.!work_col! !work_row!>"!file!.Bim"
for /l %%a in (0,1,!count!) do (if defined input[%%a] (echo.!input[%%a]!>>"!file!.Bim"))
if not exist "!file!.bim" (fn.dll sprite !msg_area! 1 07 "Can't Save Empty Batch Image ..."&fn.dll sleep 1500&fn.dll sprite !msg_area! 1 00 "Can't Save Empty Batch Image ..."&goto :g)

set per2=0
set max_count=0
set max_lines=0
set sort_count=0
set tested_elements=
set valid=yes
set total=0
set /a per_area=!notification_area!+19

if /i "!sorting!" == "Enable" (
	fn.dll sprite !mid_row_7! !notification_area! 88 "Fixing Image Bugs..........."
	fn.dll sprite !mid_row_7! !notification_area! 8f "Sorting Elements..."
	for /f %%a in (!file!.Bim) do (set /a total+=1)
	for /f "tokens=1-5" %%a in (!file!.Bim) do (
	set count=0
	for %%z in (!tested_elements!) do (if /i "%%b" == "%%z" (set valid=no))
	if /i "!valid!" == "yes" (
		set "tested_elements=%%b !tested_elements!"
		for /f "tokens=1-6" %%i in (!file!.Bim) do (
				if /i "%%b" == "%%j" (
					if /i "%%n" == "Box" (
						set "sort[%%b][!count!]=%%i %%j %%k %%l %%m %%n"
						) ELSE (
						set "sort[%%b][!count!]=%%i %%j %%k %%l %%m"		
						)
					set /a count+=1
					if !count! gtr !max_count! (set max_count=!count!)
					if %%b gtr !max_lines! (set max_lines=%%b)
					)
				)
		)
	set /a per2=!sort_count!0000/!total!
	set per2_1=!per2:~0,-2!
	set per2_2=!per2:~-2!
	set per2=!per2_1!.!per2_2!
	set /a sort_count+=1
	fn.dll sprite !mid_row_7! !per_area! 8a "!per2!%%"
	set valid=yes
	)
)


::Re-Saving Data...

set currentValue=0
set /a per_area=!notification_area!+24

rem del /q "!file!.Bim" >nul 2>nul 2>&1
echo.!work_col! !work_row!>"!file!_sorted.Bim"
if /i "!Sorting!" == "Enable" (
	fn.dll sprite !mid_row_7! !notification_area! 8f "Re-Saving Sorted File..."
	for /l %%a in (2,1,!max_lines!) do (
		for /l %%A in (0,1,!max_count!) do (
			if defined sort[%%a][%%A] (echo.!sort[%%a][%%A]!>>!file!_sorted.Bim)
			)
			set /a per2=!currentValue!0000/!max_lines!
			set per2_1=!per2:~0,-2!
			set per2_2=!per2:~-2!
			set per2=!per2_1!.!per2_2!
			set /a currentValue+=1
			fn.dll sprite !mid_row_7! !per_area! 8a "!per2!%%"
		)
	)


:g
call :Box 0 1 !work_row! !work_col! - - - 0f
endlocal
set count=0
fn.dll color 07
goto a			


:Help












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


:sqrt
set sub=1
set sqrt=0
set bkup=%~1

Rem Calculating Sqrt here....
Rem Using Property of Perfect sqr, that we have learned in small Classes...that if we subtract odd nos. from perfect sqr,then 
rem atlast perfect '0' will be left otherwise not.... :]
set no=%~1
:l
if %no% gtr 0 (
set /a no=%no%-%sub%
set /a sub+=2
set /a sqrt+=1
goto l
)
REM Checking if the answer is correct..as cmd doesn't support float values.... :[
set /a sqr=%sqrt%*%sqrt%
if "%sqr%" == "%bkup%" (
set %~2=%sqrt%
) ELSE (
echo. wscript.echo %bkup%^^(1/2^) >"%tmp%\a.vbs"
for /f "skip=3 tokens=*" %%a in ('cscript "%tmp%\a.vbs"') do set /a %~2=%%a >nul 2>nul 2>&1
)

goto :eof


:: Creating typographic Text File

set per2=0
set /a per_area=!notification_area!+20

fn.dll sprite !mid_row_7! !notification_area! 88 "Re-Saving Sorted File........."
fn.dll sprite !mid_row_7! !notification_area! 8f "Saving Typography..."
	for /l %%a in (2,1,!max_lines!) do (
		set line[%%a]=
		for /l %%A in (0,1,!max_count!) do (
			if defined sort[%%a][%%A] (set "line[%%a]=!line[%%a]!!sort[%%a][%%A]:~-1!")
			if not defined sort[%%a][%%A] (set "line[%%a]=!line[%%a]! ")
			)
			set /a per2=%%a0000/!max_lines!
			set per2_1=!per2:~0,-2!
			set per2_2=!per2:~-2!
			set per2=!per2_1!.!per2_2!
			fn.dll sprite !mid_row_7! !per_area! 8a "!per2!%%"
		)

for /l %%a in (2,1,!max_lines!) do (echo.!Line[%%a]!>>"!file!_typography.txt")
