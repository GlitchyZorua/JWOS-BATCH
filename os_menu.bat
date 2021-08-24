@echo off
:e
echo       ## ##      ##  #######   ######  
echo       ## ##  ##  ## ##     ## ##    ## 
echo       ## ##  ##  ## ##     ## ##       
echo       ## ##  ##  ## ##     ##  ######  
echo ##    ## ##  ##  ## ##     ##       ## 
echo ##    ## ##  ##  ## ##     ## ##    ## 
echo  ######   ###  ###   #######   ###### 
echo             Version 0.2
echo        Welcome to the menu

cmdMenuSel f870 "Utilities" "Fun" "Settings" "Boot to Terminal"
if %ERRORLEVEL% == 1 goto f
if %ERRORLEVEL% == 2 goto g
if %ERRORLEVEL% == 3 goto h
if %ERRORLEVEL% == 4 goto i





:g
cls
cmdMenuSel f870 "Go Back" "[Folder] Games" "Matrix" "Matrix2" "Spinner"
if %ERRORLEVEL% == 1 goto e
if %ERRORLEVEL% == 2 goto k
if %ERRORLEVEL% == 3 goto p
if %ERRORLEVEL% == 4 goto q
if %ERRORLEVEL% == 5 goto s

:s
"%cd%\JWOS\Applications\Fun\Spinner.bat"

:p
"%cd%\JWOS\Applications\Fun\Matrix.bat"

:q
"%cd%\JWOS\Applications\Fun\Matrix2.bat"


:f
cls
cmdMenuSel f870 "Go Back" "Time" "Date" "Weather" "Dice" "Password Generator"
if %ERRORLEVEL% == 1 goto e
if %ERRORLEVEL% == 2 goto a
if %ERRORLEVEL% == 3 goto b
if %ERRORLEVEL% == 4 goto c
if %ERRORLEVEL% == 5 goto j
if %ERRORLEVEL% == 6 goto d

:a
cls
"%cd%\Applications\Utilities\time.bat"

:b
cls
"%cd%\Applications\Utilities\date.bat"


:c
cls
"%cd%\Applications\Utilities\weather.bat"

:d
"%cd%\Applications\Utilities\password maker.bat"
goto e


:j
cls
"%cd%\Applications\Utilities\dice.bat"

:h
cls
echo [Settings]
echo Username: %username%
echo Password: (no password)
echo Time: %time%
echo Date: %date%
pause

:i
cls
cmd

:k
cls
cmdMenuSel f870 "Go Back" "Chess" "TicTacToe" "Guess the number" "Snake" "Snake2" "Space Invaders" "Space Invaders #2" "Connect 4" "Yahtzee" "RPG Style Battle Game" "Dragon File Batch Game" "Pokémon" "War" "PingPong" "Viewpoint" "Flappy Bird"
if %ERRORLEVEL% == 1 goto g
if %ERRORLEVEL% == 2 goto l
if %ERRORLEVEL% == 3 goto m
if %ERRORLEVEL% == 4 goto n
if %ERRORLEVEL% == 5 goto o
if %ERRORLEVEL% == 6 goto r
if %ERRORLEVEL% == 7 goto t
if %ERRORLEVEL% == 8 goto u
if %ERRORLEVEL% == 9 goto v
if %ERRORLEVEL% == 10 goto w
if %ERRORLEVEL% == 11 goto y
if %ERRORLEVEL% == 12 goto z
if %ERRORLEVEL% == 13 goto 0
if %ERRORLEVEL% == 14 goto 1
if %ERRORLEVEL% == 15 goto 2
if %ERRORLEVEL% == 16 goto 3
if %ERRORLEVEL% == 17 goto 4
if %ERRORLEVEL% == 18 goto 5
:l
"%cd%\Applications\Fun\Games\chess.bat"

:n
"%cd%\Applications\Fun\Games\Guess the number.bat"

:m
"%cd%\Applications\Fun\Games\TicTacToe.bat"

:o
"%cd%\Applications\Fun\Games\snake.bat"

:t
"%cd%\Applications\Fun\Games\Space Invaders.bat"

:u
"%cd%\Applications\Fun\Games\Space Invaders #2.bat"

:v 
"%cd%\Applications\Fun\Games\Connect 4.bat"

:w
"%cd%\Applications\Fun\Games\Yahtzee.bat"

:y
"%cd%\Applications\Fun\Games\RPG Style Battle Game.bat"

:z
:: Dragon File Batch Game

"%cd%\Applications\Fun\Games\Dragon File Batch Game.bat"

:r
"%cd%\Applications\Fun\Games\snake2.bat"

:0
"%cd%\Applications\Fun\Games\pokemon.bat"

:1
"%cd%\Applications\Fun\Games\war.bat"

:2
"%cd%\Applications\Fun\Games\pingpong.bat"

:3
"%cd%\Applications\Fun\Games\batch-game-viewpoint-master\Viewpoint.bat"

:4
"%cd%\Applications\Fun\Games\batch-game-flappy-bird-master\Flappy_Bird.bat"

:5 
"%cd%\Applications\Fun\Games\batch-game-batchcraft-master\BatchCraft.bat"

:: abcdefghijklmnopqrstuvwxyz
::                                          For Applications: 
::                         	         ===     UTILITES     ===
:: a = time
:: b = date
:: c = weather
:: j = dice
:: d = password maker
::                                       ===       FUN      ===    
:: p = Matrix
:: q = Matrix2
:: ?? = 8ball
:: ?? = Quote
:: ?? = Jokes
::                                       ===    FUN/GAMES   === 
:: l = Chess
:: m = TicTacToe
:: n = Guess the number
:: o = Snake
:: r = Snake2
:: s = Spinner
:: t = Space Invaders
:: u = Space Invaders #2
:: v = Connect 4
:: w = Yahtzee
:: x = Tetris
:: y = RPG Style Battle Game
:: 0 = Pokemon
:: 1 = War
:: 2 = PingPong
:: 3 = Viewpoint
:: 4 = Flappy Bird
:: 5 = BatchCraft
::                                      ===      MISC.      ===
:: h = settings
:: i = boot to terminal
::                                          System only:
::                                       ==     MENU     == 
:: e = Menu
::                                       == MENU/FOLDERS ==
:: f = Util
:: g = Fun
:: k = Games
::                                       ==     MISC.    ==
:: ?? = BSOD
:: ?? = RSOD