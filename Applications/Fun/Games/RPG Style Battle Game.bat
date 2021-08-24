
::Welcome to my RPG Battle Game!
::It's not too big of a deal, but I spent a while on it.
::There are currently 2 monsters.
::Also please don't edit the code; all that will do is break the game.
::Last Update: October 19, 2017 (v2.1)

:start
@echo off
title RPG Battle!
color a
cd c:/
cls
goto monchoose

::#############################################

:monchoose
set /a health=100
set /a magic=50
set /a br=0
set /a brw=0
cls
echo.
echo Please choose an option below:
echo.
echo Boss Rush will have you fight random monsters until you run out
echo of health, regardless of ending.
echo.
echo Pressing enter without typing anything will bring you to the 
echo previous monster you fought without closing the game.
echo.
echo Choose [SLIME (S)] [SKELETON (K)] [Random (R)] [Boss Rush (BR)]
echo.
set /p monchoose=">>"
if not defined monchoose goto monchoose
if /i "%monchoose%"=="slime" goto sencounter
if /i "%monchoose%"=="s" goto sencounter
if /i "%monchoose%"=="skeleton" goto kencounter
if /i "%monchoose%"=="k" goto kencounter
if /i "%monchoose%"=="random" goto r
if /i "%monchoose%"=="r" goto r
if /i "%monchoose%"=="boss rush" goto br
if /i "%monchoose%"=="br" goto br
goto what

:what
cls
echo.
echo Whatever you just typed is not in the game yet.
echo Try again.
echo.
pause
cls
goto monchoose

:r
set /a rand=%random% %% 2
if /i %rand%==0 goto sencounter
if /i %rand%==1 goto kencounter
cls
goto monchoose

:br
cls
set /a br=1
goto r


::#########################################################################################
::#########################################################################################
::#########################################################################################
::#########################################################################################
::#########################################################################################
::The SLIME is represented by a "s"


:sencounter
title SLIME Battle!
cls
if %br%==0 (
set /a health=100
set /a magic=50
)
set /a enemy=80
set /a nice=0
set /a give=0
set /a promise=0
cls
echo.
echo You have encountered a SLIME!
echo He wants to battle!
if "%sending%"=="1" echo He seems somewhat familiar to you...
echo.
pause
set /a sending=1
cls 
goto battscr

::#################################################

:battscr
cls
if %health% leq 0 goto lose
if %enemy% gtr 80 set /a enemy=80
if %enemy% leq 0 goto win
if %health% gtr 100 set /a health=100
if %magic% gtr 50 set /a magic=50
if "%magic%" leq "0" set /a magic=0
cls
echo.
echo Your health is %health%.
echo Your magic is %magic%.
echo The SLIME has %enemy% health.
echo.
echo Choose [Fight] [Magic (20)] [Heal (30H)(20M)] [Spare] [Give Up] [Suicide]
echo.
set action=
set /p action=">>"
if %give% geq 1 (
if not defined action goto give
if /i "%action%"=="heal" goto fakeheal
if /i "%action%"=="fight" goto no
if /i "%action%"=="magic" goto no
if /i "%action%"=="die" goto suicide
if /i "%action%"=="suicide" goto suicide
goto battscr
)
if not defined action goto oops
if /i "%action%"=="fight" goto fight
if /i "%action%"=="magic" goto magic
if /i "%action%"=="heal" goto heal
if /i "%action%"=="spare" goto nothing
if /i "%action%"=="give up" goto give
if /i "%action%"=="die" goto suicide
if /i "%action%"=="suicide" goto suicide
goto battscr

::##########################################################

:oops
cls
echo.
echo You forgot to do anything!
echo But the SLIME understands and gives you another chance.
echo.
pause
cls
goto battscr

::#####################################################

:fight
set /a miss=%random% %% 10
set /a crit=%random% %% 10
cls
echo.
echo You swing your sword at the SLIME!
echo.
pause
if %miss%==5 goto miss
if %crit%==5 (
cls
echo.
echo It was a critical hit!
echo You did double the damage!
echo.
pause
cls
)
set /a chance=%random% %% 3
if %chance%==0 (
set /a damage=10
)
if %chance%==1 (
set /a damage=10
)
if %chance%==2 (
set /a damage=15
)
if %crit%==5 (
set /a damage=%damage% * 2
)
cls
echo.
echo The SLIME took %damage% damage!
echo.
pause
set /a enemy=%enemy% - %damage%
cls
goto turn

::###########################################################

:magic
if "%magic%" leq "19" (
cls
echo.
echo You don't have enough magic to perform this action right now!
echo.
pause
cls
goto battscr
)
set /a miss=%random% %% 10
set /a magic=%magic% - 20
cls
echo.
echo You cast a damaging spell upon the SLIME!
echo.
pause
if %miss%==5 goto miss
set /a chance=%random% %% 3
if %chance%==0 (
set /a mdamage=10
)
if %chance%==1 (
set /a mdamage=15
)
if %chance%==2 (
set /a mdamage=20
)
cls
echo.
echo The SLIME took %mdamage% damage!
echo.
pause
set /a enemy=%enemy% - %mdamage%
cls
goto turn


::#############################################################

:heal
if %br%==1 goto sbrheal
set /a hmiss=%random% %% 15
set /a hmax=0
set /a mmax=0
cls
echo.
echo You begin to meditate...
echo.
pause
cls
timeout 1 >nul
echo.
echo ...
timeout 1 >nul
cls
echo.
echo ...  ...
timeout 1 >nul
cls
echo.
echo ...  ...  ...
timeout 1 >nul
if %hmiss%==5 goto hmiss
cls
if %health% geq 100 (
cls
echo.
echo Your health is already at it's max!
echo.
pause
set /a hmax=1
cls
)
if %magic% geq 50 (
cls
echo.
echo Your magic is already at it's max!
echo.
pause
set /a mmax=1
cls
)
if %hmax%==1 if %mmax%==1 goto hmiss
echo.
echo You've been healed:
if %hmax%==0 echo 30 health!
if %hmax%==0 if %mmax%==0 echo AND
if %mmax%==0 echo 20 magic!
echo.
pause
set /a health=%health% + 30
set /a magic=%magic% + 20
cls
goto turn

::##########################################################

:fakeheal
set /a hmiss=%random% %% 7
set /a hmax=0
set /a mmax=0
cls
echo.
echo You try to heal but your lack of determination
echo weakens your heal significantly!
echo.
pause
cls
timeout 1 >nul
echo.
echo ...
timeout 1 >nul
cls
echo.
echo ...  ...
timeout 1 >nul
cls
echo.
echo ...  ...  ...
timeout 1 >nul
if %hmiss%==5 goto hmiss
cls
if %health% geq 100 (
cls
echo.
echo Your health is already at it's max!
echo.
pause
set /a hmax=1
cls
)
if %magic% geq 50 (
cls
echo.
echo Your magic is already at it's max!
echo.
pause
set /a mmax=1
cls
)
if %hmax%==1 if %mmax%==1 goto hmiss
echo.
echo You managed to heal:
if %hmax%==0 echo 10 health!
if %hmax%==0 if %mmax%==0 echo AND
if %mmax%==0 echo 5 magic!
echo.
pause
set /a health=%health% + 10
set /a magic=%magic% + 5
cls
goto turn

::########################################################

:sbrheal
set /a hmiss=%random% %% 8
set /a hmax=0
set /a mmax=0
cls
echo.
echo You try to heal, but Boss Rush mode makes it more difficult!
echo Your heal weakens significantly!
echo.
pause
cls
timeout 1 >nul
echo.
echo ...
timeout 1 >nul
cls
echo.
echo ...  ...
timeout 1 >nul
cls
echo.
echo ...  ...  ...
timeout 1 >nul
if %hmiss%==5 goto hmiss
cls
if %health% geq 100 (
cls
echo.
echo Your health is already at it's max!
echo.
pause
set /a hmax=1
cls
)
if %magic% geq 50 (
cls
echo.
echo Your magic is already at it's max!
echo.
pause
set /a mmax=1
cls
)
if %hmax%==1 if %mmax%==1 goto hmiss
echo.
echo You managed to heal:
if %hmax%==0 echo 20 health!
if %hmax%==0 if %mmax%==0 echo AND
if %mmax%==0 echo 10 magic!
echo.
pause
set /a health=%health% + 20
set /a magic=%magic% + 10
cls
goto turn

::################################################################################

:nothing
cls
if %nice%==0 (
cls
echo.
echo You decided it would be best to not fight the SLIME this time.
echo It seems confused for a second, but then continues to attack.
if %br%==0 echo It seems like the SLIME will need more convincing to stop fighting.
if %br%==1 echo The SLIME warns you that it can't be spared in Boss Rush mode!
echo.
pause
set /a nice=1
cls
goto turn
)
if %nice%==1 (
cls
echo.
echo You try to reason with the SLIME.
echo It stops for a second before attacking.
echo.
pause
set /a nice=2
cls
goto turn
)
if %nice%==2 (
cls
echo. 
echo You tell the SLIME that this can be settled without fighting.
echo It considers it's options before attacking again.
echo.
pause
set /a nice=3
cls
goto turn
)
if %nice%==3 (
cls
echo.
echo You flash the SLIME a smile and tell it that you don't want to kill it.
echo The SLIME suddenly seems less willing to fight.
echo.
pause
set /a nice=4
set /a promise=1
cls
goto turn
)
if %nice%==4 (
cls
echo.
echo You plead with the SLIME to stop fighting.
echo The SLIME thinks for a minute before slowly starting to back
echo out of the room.
echo.
pause
cls
if %br%==1 goto sbrnope
goto pacifist
)


::###########################################################

:sbrnope
cls
echo.
echo The SLIME was just about to leave, but then it remembered
echo that you were in Boss Rush mode and it couldn't leave.
echo.
pause
cls
goto turn

::###########################################################

:no
cls
echo.
echo You were going to attack, but then you didn't feel like it.
echo.
pause
cls
goto give

::##############################################################

:give
cls
if %br%==1 (
cls
echo.
echo You were just about to throw your sword away and
echo give up, but then you remembered that you were in 
echo Boss Rush mode and you couldn't give up.
echo.
pause
cls
goto battscr
)
if %give%==0 (
set /a give=1
echo.
echo You throw your sword away and give up.
echo The SLIME jolts in surprise before maintaining it's composure.
echo.
pause
cls
goto turn
)
if %give%==1 (
set /a give=2
echo.
echo You continue to stand around aimlessly.
echo The SLIME is confused at your lack of care towards his attacks.
echo.
pause
cls
goto turn
)
if %give%==2 (
set /a give=3
echo.
echo You ball up in the corner.
echo The SLIME thinks you're pathetic.
echo.
pause
cls
goto turn
)
if %give%==3 (
set /a give=4
echo.
echo You begin to rock yourself while still in a ball.
echo The SLIME starts to feel guilty for attacking someone so useless.
echo.
pause
cls
goto turn
)
if %give%==4 (
set /a give=5
if %promise%==1 (
cls
echo.
echo You look uncaringly at the SLIME.
echo The SLIME comes to the conclusion that your word means nothing.
echo.
pause
cls
)
echo.
echo The SLIME looks around before deciding it should probably
echo leave you to your self-pity.
echo.
pause
cls
goto pacifist2
)


::##############################################################

:miss
cls
echo. 
echo YOU MISSED! The SLIME took 0 damage.
echo.
pause
cls
goto turn

::#######################################################

:hmiss
cls
echo.
echo The healing failed!
echo Your health and magic remain the same!
echo.
pause
cls
goto turn

::#######################################################

:turn
if %enemy% leq 0 goto win
cls
set /a satt=%random% %% 5
if %satt%==0 (
cls
echo.
echo The SLIME does a little jiggle dance!
echo.
pause
if %enemy%==80 (
cls
echo.
echo But the SLIME already has full health!
echo.
pause
cls
goto battscr
)
set /a enemy=%enemy% + 10
cls
echo.
echo The SLIME gained 10 health!
echo.
pause
cls
goto battscr
)
set /a smiss=%random% %% 9
cls
echo.
echo The SLIME lunges towards you!
echo.
pause
if %smiss%==5 goto smiss
set /a chance=%random% %% 5
if %chance%==0 (
set /a hurt=10
)
if %chance%==1 (
set /a hurt=15
)
if %chance%==2 (
set /a hurt=20
)
if %chance%==3 (
set /a hurt=10
)
if %chance%==4 (
set /a hurt=15
)
cls
echo.
echo You took %hurt% damage!
echo.
pause
set /a health=%health% - %hurt%
goto battscr


::######################################################

:smiss
cls
echo.
echo The SLIME missed! You took 0 damage.
echo.
pause
cls
goto battscr

::########################################################

:lose
color 0a
title GAME OVER!
cls
echo.
echo You have died!
echo GAME OVER!
if %br%==1 echo You have beaten %brw% monster(s).
echo.
pause
goto again

::#####################################################################

:again
color 0a
cls
echo.
echo TRY AGAIN?
echo.
echo Choose [Y] [N]
echo.
set /p again=">>"
if not defined again goto again
if /i "%again%"=="y" goto start
if /i "%again%"=="n" exit
goto again

::#########################################################

:win
title SLIME Defeat!
if %promise%==1 (
cls
echo.
echo Suddenly the SLIME falls to the ground.
echo The SLIME has an expression of complete betrayal before it dies.
echo You're overcome with a feeling of guilt.
echo.
pause
)
cls
echo.
echo The SLIME has been defeated!
echo YOU WIN!
echo.
pause
if %promise%==1 goto broken
if %promise%==0 goto victory
cls
goto end

::##########################################################

:pacifist
title SLIME Friendship!
cls
echo. 
echo The SLIME ran away!
echo YOU WIN!
echo.
pause
cls
echo.
echo A few days later, you find a single letter on your doorstep.
echo.
pause
cls
echo.
echo    "Thank you.
echo.
echo         ~SLIME"
echo.
pause
cls
goto end

::##############################################################

:pacifist2
title SLIME Pity!
cls
echo. 
echo The SLIME ran away!
echo YOU WIN!
echo.
pause
cls
echo.
echo A few days later, you find a single letter on your doorstep.
echo.
pause
cls
echo.
echo    "You should really learn to fight before
echo     attempting to fight monsters such as myself.
echo.
echo                                          ~SLIME"
echo.
pause
cls
goto end

::###############################################################

:victory
title SLIME Victory!
cls
echo.
echo A few days later, you are hailed by the village to be a hero.
echo You are the one who defeated the evil monster!
echo You become the official monster hunter and will continue to 
echo hunt monsters until the day you die.
echo.
pause
cls
goto end


::#############################################################

:broken
title SLIME Guilt
cls
echo.
echo A few days later, you decide to quit monster hunting and
echo settle down. You feel only guilt for killing a monster whom
echo you've offered mercy to. You only see yourself as a murderer now.
echo.
pause
cls
goto end

::################################################################

:suicide
cls
echo.
echo You suddenly feel the need to die.
echo It's an overwhelming urge that you can't seem to deny.
echo.
pause
if "%magic%" lss "20" goto cantdie
cls
echo.
echo You immediately begin to use your magic to stop your heart.
echo You can feel the beat slow down as you continue to hold your hands onto 
echo your chest.
echo.
pause
if %promise%==1 (
cls
echo.
echo Suddenly you feel really weird.
echo You notice that the SLIME has completely enveloped you up to your neck.
echo It starts to force you to move your hands away from your chest.
echo You feel your heart start to return to it's regular rhythm.
echo.
pause
goto option
)
if %give% geq 3 goto unbothered
goto regdeath

::###############################################################################

:regdeath
cls
echo.
echo The SLIME looks extremely confused and worried about this whole situation and 
echo decides it would be better to leave itself out of this.
echo.
pause
cls
goto dead

::#################################################################################################

:cantdie
cls
echo.
echo You don't have enough magic to stop your heart so you
echo reach for your sword.
echo.
pause
if %give% geq 1 (
cls
echo.
echo But it isn't there!
echo Your only choice is to grab a dull stick on the ground.
echo You begin to attempt to lower your health by repeatedly hitting
echo yourself with the stick.
echo.
pause
if %promise%==1 goto nomagic
if %give% lss 3 goto regdeath
if %give% geq 3 goto unbothered
cls
)
cls
echo.
echo You pull out your sword and hold the blade to your chest.
echo You inhale in preparation before...
echo.
pause
if %promise%==1 goto nomagic
cls
echo.
echo The blade immediately impales your body, going directly through your heart.
echo The SLIME looks repulsed.
echo.
pause
cls
goto regdeath


::##########################################################################

:nomagic
cls
echo.
echo Suddenly you feel really weird.
echo You notice that the SLIME has completely enveloped you up to your neck.
echo It starts to force you to move your hands to your side.
echo.
pause
cls
echo.
echo With no way to fight back, you try to think of a way to escape.
echo But after some time you realize that the SLIME isn't attempting to hurt you.
echo.
pause
cls
goto saved

::################################################################

:dead
cls
echo.
echo As the SLIME leaves, your world begins to fade to black...
echo Slowly your vision blurs, until suddenly...
echo.
pause
cls
goto lose

::################################################################

:option
cls
echo.
echo You realize that you have the SLIME at an incredibly weak spot and
echo could probably kill him with one burst of Magic.
echo.
echo Choose [Kill (Y)] [Don't (N)]
echo.
set /p option=">>"
if not defined option goto option
if /i "%option%"=="kill" goto betray
if /i "%option%"=="y" goto betray
if /i "%option%"=="don't" goto saved
if /i "%option%"=="n" goto saved
if /i "%option%"=="dont" goto saved
goto option

::#####################################################################

:betray
color 0c
cls
echo.
echo You realize that you mustn't let this SLIME hinder your desire.
echo You begin to charge your Magic Burst.
echo.
pause
cls
echo.
echo You feel your Magic reach full charge and then...
echo A huge blast covers the room with SLIME.
echo.
pause
cls
echo.
echo Time to continue where you left off.
echo.
echo As you start to die, your world begins to fade to black...
echo Slowly your vision blurs, until suddenly...
pause
cls
goto lose

::###################################################################

:saved
cls
echo.
echo You realize that the SLIME is just trying to help.
echo You tell the SLIME that it can stop now.
echo.
pause
cls
if %give% geq 3 (
cls
echo.
echo The SLIME agrees to release you.
echo It gives you a confused look before 
echo deciding it should probably leave.
echo.
pause
cls
goto favor
)
cls
echo.
echo The SLIME looks extremely worried but agrees to release you.
echo After you are free, the SLIME gives you a SLIME hug and then
echo hesitantly leaves the room.
echo.
pause
cls
goto rehab

::##################################################################

:unbothered
cls
echo.
echo The SLIME seems unsurprised at this point and leaves
echo looking a bit frustrated.
echo.
pause
cls
goto dead

::###############################################################

:rehab
title SLIME Rehab!
cls
echo. 
echo YOU WIN!
echo.
pause
cls
echo.
echo A few days later, you find a single letter on your doorstep.
echo.
pause
cls
echo.
echo    "If you ever need help again, I'll be there.
echo.
echo                                        ~SLIME"
echo.
pause
cls
goto end

::###############################################################

:favor
title SLIME Favor!
cls
echo.
echo The SLIME ran away!
echo YOU WIN!
echo.
pause
cls
echo.
echo A few days later, you find a single letter on your doorstep.
echo.
pause
cls
echo.
echo    "You should probably just let the adults handle
echo     all the monster fighting from now on.
echo.
echo                                             ~SLIME"
echo.
pause
cls
goto end

::##########################################################################

:end
if %br%==1 goto sbrw
title THE END
cls
echo.
echo THE END
echo.
pause
cls
goto again

::#############################################################################

:sbrw
set /a brw=%brw% + 1
set /a health=%health% +20
cls
echo.
echo You have beaten %brw% monster(s).
echo You have also gained 20 health from the defeated monster!
echo.
pause
if %brw%==10 (
cls
echo.
echo Wow! I'm impressed. %brw% monsters is pretty good!
echo Keep going!
echo.
pause
)
cls
goto kencounter

::##################################################################################



::################################################################################################################
::################################################################################################################
::################################################################################################################
::################################################################################################################
::The SKELETON Battle is represented by a "k"


:kencounter
title SKELETON Battle!
cls
if %br%==0 (
set /a health=100
set /a magic=50
)
set /a enemy=80
set /a nice=0
set /a give=0
set /a promise=0
cls
echo.
echo You have encountered a SKELETON!
echo He wants to battle!
if "%kending%"=="1" echo He seems even more spooky than last time...
echo.
pause
set /a kending=1
cls 
goto kbattscr

::#################################################

:kbattscr
cls
if %health% leq 0 goto klose
if %enemy% gtr 80 set /a enemy=80
if %enemy% leq 0 goto kwin
if %health% gtr 100 set /a health=100
if %magic% gtr 50 set /a magic=50
if "%magic%" leq "0" set /a magic=0
cls
echo.
echo Your health is %health%.
echo Your magic is %magic%.
echo SKELETON has %enemy% health.
echo.
echo Choose [Fight] [Magic (20)] [Heal (30H)(20M)] [Spare] [Give Up] [Suicide]
echo.
set action=
set /p action=">>"
if %give% geq 1 (
if not defined action goto kgive
if /i "%action%"=="heal" goto kfakeheal
if /i "%action%"=="fight" goto kno
if /i "%action%"=="magic" goto kno
if /i "%action%"=="die" goto ksuicide
if /i "%action%"=="suicide" goto ksuicide
goto kbattscr
)
if not defined action goto koops
if /i "%action%"=="fight" goto kfight
if /i "%action%"=="magic" goto kmagic
if /i "%action%"=="heal" goto kheal
if /i "%action%"=="spare" goto knothing
if /i "%action%"=="give up" goto kgive
if /i "%action%"=="die" goto ksuicide
if /i "%action%"=="suicide" goto ksuicide
goto kbattscr

::##########################################################

:koops
cls
echo.
echo You forgot to do anything!
echo The SKELETON pretends not to notice.
echo.
pause
cls
goto kbattscr

::#####################################################

:kfight
set /a miss=%random% %% 10
set /a crit=%random% %% 10
cls
echo.
echo You clang your sword against the SKELETON!
echo.
pause
if %miss%==5 goto kmiss
if %crit%==5 (
cls
echo.
echo You see the SKELETON's ribcage crack!
echo You did double the damage!
echo.
pause
cls
)
set /a chance=%random% %% 3
if %chance%==0 (
set /a damage=10
)
if %chance%==1 (
set /a damage=10
)
if %chance%==2 (
set /a damage=15
)
if %crit%==5 (
set /a damage=%damage% * 2
)
cls
echo.
echo The SKELETON took %damage% damage!
echo.
pause
set /a enemy=%enemy% - %damage%
cls
goto kturn

::###########################################################

:kmagic
if "%magic%" leq "19" (
cls
echo.
echo You don't have enough magic to perform this action right now!
echo The SKELETON's bones rattle as he laughs at you.
echo.
pause
cls
goto kbattscr
)
set /a miss=%random% %% 10
set /a magic=%magic% - 20
cls
echo.
echo You cast a spook-repelling spell!
echo.
pause
if %miss%==5 goto kmiss
set /a chance=%random% %% 3
if %chance%==0 (
set /a mdamage=10
)
if %chance%==1 (
set /a mdamage=15
)
if %chance%==2 (
set /a mdamage=20
)
cls
echo.
echo The SKELETON took %mdamage% damage!
echo It's trying extra hard to be spooky.
echo.
pause
set /a enemy=%enemy% - %mdamage%
cls
goto kturn


::#############################################################

:kheal
if %br%==1 goto kbrheal
set /a hmiss=%random% %% 15
set /a hmax=0
set /a mmax=0
cls
echo.
echo You begin to meditate...
echo.
pause
cls
timeout 1 >nul
echo.
echo ...
timeout 1 >nul
cls
echo.
echo ...  ...
timeout 1 >nul
cls
echo.
echo ...  ...  ...
timeout 1 >nul
if %hmiss%==5 goto khmiss
cls
if %health% geq 100 (
cls
echo.
echo Your health is already at it's max!
echo.
pause
set /a hmax=1
cls
)
if %magic% geq 50 (
cls
echo.
echo Your magic is already at it's max!
echo.
pause
set /a mmax=1
cls
)
if %hmax%==1 if %mmax%==1 goto khmiss
echo.
echo You've been healed:
if %hmax%==0 echo 30 health!
if %hmax%==0 if %mmax%==0 echo AND
if %mmax%==0 echo 20 magic!
echo.
pause
set /a health=%health% + 30
set /a magic=%magic% + 20
cls
goto kturn

::##########################################################

:kfakeheal
set /a hmiss=%random% %% 7
set /a hmax=0
set /a mmax=0
cls
echo.
echo You try to heal but your lack of determination
echo weakens your heal significantly!
echo.
pause
cls
timeout 1 >nul
echo.
echo ...
timeout 1 >nul
cls
echo.
echo ...  ...
timeout 1 >nul
cls
echo.
echo ...  ...  ...
timeout 1 >nul
if %hmiss%==5 goto khmiss
cls
if %health% geq 100 (
cls
echo.
echo Your health is already at it's max!
echo.
pause
set /a hmax=1
cls
)
if %magic% geq 50 (
cls
echo.
echo Your magic is already at it's max!
echo.
pause
set /a mmax=1
cls
)
if %hmax%==1 if %mmax%==1 goto khmiss
echo.
echo You managed to heal:
if %hmax%==0 echo 10 health!
if %hmax%==0 if %mmax%==0 echo AND
if %mmax%==0 echo 5 magic!
echo.
pause
set /a health=%health% + 10
set /a magic=%magic% + 5
cls
goto kturn

::########################################################

:kbrheal
set /a hmiss=%random% %% 8
set /a hmax=0
set /a mmax=0
cls
echo.
echo You try to heal, but Boss Rush mode makes it more difficult!
echo Your heal weakens significantly!
echo.
pause
cls
timeout 1 >nul
echo.
echo ...
timeout 1 >nul
cls
echo.
echo ...  ...
timeout 1 >nul
cls
echo.
echo ...  ...  ...
timeout 1 >nul
if %hmiss%==5 goto khmiss
cls
if %health% geq 100 (
cls
echo.
echo Your health is already at it's max!
echo.
pause
set /a hmax=1
cls
)
if %magic% geq 50 (
cls
echo.
echo Your magic is already at it's max!
echo.
pause
set /a mmax=1
cls
)
if %hmax%==1 if %mmax%==1 goto khmiss
echo.
echo You managed to heal:
if %hmax%==0 echo 20 health!
if %hmax%==0 if %mmax%==0 echo AND
if %mmax%==0 echo 10 magic!
echo.
pause
set /a health=%health% + 20
set /a magic=%magic% + 10
cls
goto kturn

::########################################################################################

:knothing
cls
if %nice%==0 (
cls
echo.
echo You decided you shouldn't attack the SKELETON.
echo It acts as if it expected you to do that.
if %br%==0 echo It's gonna take a bit more convincing for it to stop fighting!
if %br%==1 echo The SKELETON warns you that it can't be spared in Boss Rush mode!
echo.
pause
set /a nice=1
cls
goto kturn
)
if %nice%==1 (
cls
echo.
echo You pretend to be spooked by the SKELETON.
echo It looks pleased but continues to attack.
echo.
pause
set /a nice=2
cls
goto kturn
)
if %nice%==2 (
cls
echo. 
echo You tell the SKELETON that you've never been this spooked.
echo It seems surprised for a second, before maintaining its fighting stance.
echo.
pause
set /a nice=3
cls
goto kturn
)
if %nice%==3 (
cls
echo.
echo You tell the SKELETON that it's too cool and spooky for you
echo to want to kill it.
echo The SKELETON suddenly seems less willing to fight.
echo.
pause
set /a nice=4
set /a promise=1
cls
goto kturn
)
if %nice%==4 (
cls
echo.
echo You pretend to be shaking in fear.
echo You plead with the SKELETON to spare you.
echo The SKELETON, looking extremely pleased, agrees
echo and leaves the room. The SKELETON seems to have
echo completed his purpose.
echo.
pause
cls
if %br%==1 goto kbrnope
goto kpacifist
)


::###########################################################

:kbrnope
cls
echo.
echo The SKELETON was just about to rattle off, but then it remembered
echo that you were in Boss Rush mode and it couldn't leave.
echo.
pause
cls
goto kturn

::###########################################################

:kno
cls
echo.
echo You were going to attack, but then you didn't feel like it.
echo.
pause
cls
goto kgive

::##############################################################

:kgive
cls
if %br%==1 (
cls
echo.
echo You were going to throw your sword away and give
echo up, but then you remembered you can't do that in 
echo Boss Rush mode.
echo.
pause
cls
goto kbattscr
)
if %give%==0 (
set /a give=1
echo.
echo You throw your sword away and give up.
echo The SKELETON grins before attacking again.
echo.
pause
cls
goto kturn
)
if %give%==1 (
set /a give=2
echo.
echo You continue to stand around aimlessly.
echo The SKELETON begins to wonder if you think it is spooky.
echo.
pause
cls
goto kturn
)
if %give%==2 (
set /a give=3
echo.
echo You ball up in the corner.
echo The SKELETON thinks you're the least spooky person
echo it's ever seen.
echo.
pause
cls
goto kturn
)
if %give%==3 (
set /a give=4
echo.
echo You begin to rock yourself while still in a ball.
echo The SKELETON is trying to see if you actually care about him.
echo.
pause
cls
goto kturn
)
if %give%==4 (
set /a give=5
if %promise%==1 (
cls
echo.
echo You look uncaringly at the SKELETON.
echo The SKELETON decides it's too spooky to deal with you.
echo.
pause
goto kpacifist2
cls
)
echo.
echo The SKELETON decides that you're not worth spooking
echo and moves on.
echo.
pause
cls
goto kpacifist2
)


::##############################################################_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+

:ksuicide
cls
echo.
echo You suddenly feel the need to die.
echo It's an overwhelming urge that you can't seem to deny.
echo.
pause
cls
echo.
echo You immediately decide that the easiest way to die would
echo be to focus on the SKELETON's spookiness. Your heartbeat starts to increase
echo as you begin to fear the SKELETON's spookiness.
echo.
pause
if %promise%==1 (
cls
echo.
echo Suddenly, the SKELETON looks ashamed.
echo It immediately pulls out a paper bag and puts it
echo on it's head. You feel your heartbeat begin to return
echo to normal
echo.
pause
goto koption
)
if %give% geq 3 goto kunbothered
goto kregdeath

::###############################################################################

:kregdeath
cls
echo.
echo The SKELETON begins to enjoy how spooky he is, until he realizes that your
echo heartbeat is so fast that you're beginning to die. He decides it would probably
echo be best to leave.
echo.
pause
cls
goto kdead

::################################################################################################

:kdead
cls
echo.
echo As the SKELETON leaves, your world begins to fade to black...
echo You're so scared. Slowly your vision blurs, until suddenly...
echo.
pause
cls
goto klose

::################################################################

:koption
cls
echo.
echo You realize that the SKELETON would not notice a lethal attack
echo with a bag over his skull. You remember you have a bag of sugar
echo with you.
echo.
echo Choose [Kill (Y)] [Don't (N)]
echo.
set /p option=">>"
if not defined option goto koption
if /i "%option%"=="kill" goto kbetray
if /i "%option%"=="y" goto kbetray
if /i "%option%"=="don't" goto ksaved
if /i "%option%"=="n" goto ksaved
if /i "%option%"=="dont" goto ksaved
goto koption

::#####################################################################

:kbetray
color 0c
cls
echo.
echo You realize that you must take this oppurtunity to end him.
echo You pull out your bag of sugar.
echo.
pause
cls
echo.
echo You sneak over to the SKELETON and then...
echo Shrieks echo throughout the room as the SKELETON
echo deteriorates to nothing but a pile of dust.
echo.
pause
cls
echo.
echo Time to continue where you left off.
echo.
echo But then you realize that you killed your only source of
echo spookiness. You become desperate, until you remember your magic.
echo.
pause
cls
echo.
echo You absorb the magic from the SKELETON corpse and begin
echo to use it to increase your heartbeat.
echo.
pause
cls
echo.
echo As you start to die, your world begins to fade to black...
echo Slowly your vision blurs, until suddenly...
echo.
pause
cls
goto klose

::###################################################################

:ksaved
cls
echo.
echo You realize how much the SKELETON is sacrificing by
echo covering his spookiness.
echo You tell the SKELETON that it can stop now.
echo.
pause
cls
if %give% geq 3 (
cls
echo.
echo The SKELETON takes off the bag.
echo It looks at you dissapointedly before
echo deciding it would probably be best to leave.
echo.
pause
cls
goto kfavor
)
cls
echo.
echo The SKELETON hesitantly takes off the bag.
echo It looks worried, until it seems to remember something.
echo The SKELETON then promptly leaves the room.
echo.
pause
cls
goto krehab

::##################################################################

:kunbothered
cls
echo.
echo The SKELETON seems unsurprised and frustrated at this 
echo point. It's no fun to spook if there's no challenge to it.
echo It decides it would just be best to leave.
echo.
pause
cls
goto kdead

::###############################################################

:krehab
title SKELETON Training!
cls
echo. 
echo YOU WIN!
echo.
pause
cls
echo.
echo A few days later, you find a single letter on your doorstep.
echo.
pause
cls
echo.
echo    "If you ever need spook lessons, I'll help ya out.
echo.
echo                                            ~SKELETON"
echo.
pause
cls
goto kend

::###############################################################

:kfavor
title SKELETON Favor!
cls
echo.
echo The SKELETON rattled off!
echo YOU WIN!
echo.
pause
cls
echo.
echo A few days later, you find a single letter on your doorstep.
echo.
pause
cls
echo.
echo    "You're lucky that someone as spooky as me
echo     spared someone as unspooky as you.
echo.
echo                                     ~SKELETON"
echo.
pause
cls
goto kend

::#############################################################_+_+_+_+_+_+_+_+_+_+_++_+_+_

:kmiss
cls
echo. 
echo YOU MISSED! Your attack went straight through him!
echo The SKELETON took 0 damage.
echo.
pause
cls
goto kturn

::#######################################################

:khmiss
cls
echo.
echo The healing failed!
echo Your health and magic remain the same!
echo.
pause
cls
goto kturn

::#######################################################

:kturn
if %enemy% leq 0 goto kwin
cls
set /a satt=%random% %% 5
if %satt%==0 (
cls
echo.
echo The SKELETON pours himself a glass of milk!
echo.
pause
if %enemy%==80 (
cls
echo.
echo But the SKELETON already has full health!
echo.
pause
cls
goto kbattscr
)
set /a enemy=%enemy% + 10
cls
echo.
echo The SKELETON gained 10 health!
echo.
pause
cls
goto kbattscr
)
set /a kemiss=%random% %% 9
cls
echo.
echo The SKELETON throws a bone at you!
echo.
pause
if %kemiss%==5 goto kemiss
set /a chance=%random% %% 5
if %chance%==0 (
set /a hurt=10
)
if %chance%==1 (
set /a hurt=15
)
if %chance%==2 (
set /a hurt=20
)
if %chance%==3 (
set /a hurt=10
)
if %chance%==4 (
set /a hurt=15
)
cls
echo.
echo You took %hurt% damage!
echo.
pause
set /a health=%health% - %hurt%
goto kbattscr


::######################################################

:kemiss
cls
echo.
echo The SKELETON missed! It looks defeated.
echo You took 0 damage.
echo.
pause
cls
goto kbattscr

::########################################################

:klose
color 0a
title GAME OVER!
cls
echo.
echo You have died!
echo GAME OVER!
if %br%==1 echo You have beaten %brw% monster(s).
echo.
pause
goto kagain

::#####################################################################

:kagain
cls
echo.
echo TRY AGAIN?
echo.
echo Choose [Y] [N]
echo.
set /p again=">>"
if not defined again goto kagain
if /i "%again%"=="y" goto start
if /i "%again%"=="n" exit
goto kagain

::#########################################################

:kwin
title SKELETON Defeat!
if %promise%==1 (
cls
echo.
echo Suddenly the SKELETON begins to crack.
echo It seems scared by its own death.
echo It also seems to be disgusted at its own fear as well.
echo.
pause
)
cls
echo.
echo Suddenly the SKELETON falls apart!
echo YOU WIN!
echo.
pause
if %promise%==1 goto kbroken
if %promise%==0 goto kvictory
cls
goto kend

::######################################################################################

:kpacifist
title SKELETON Friendship!
cls
echo. 
echo The SKELETON rattled off!
echo YOU WIN!
echo.
pause
cls
echo.
echo A few days later, you find a single letter on your doorstep.
echo.
pause
cls
echo.
echo    "Thanks for helping me 
echo     understand my purpose.
echo.
echo                 ~SKELETON"
echo.
pause
cls
goto end

::####################################################################################

:kend
if %br%==1 goto kbrw
title THE END
cls
echo.
echo THE END
echo.
pause
cls
goto kagain

::##################################################################################

:kbrw
set /a brw=%brw% + 1
set /a health=%health% + 15
set /a magic=%magic% + 10
cls
echo.
echo You have beaten %brw% monster(s).
echo You have also gained 15 health and 10 magic from the defeated monster!
echo.
pause
if %brw%==10 (
cls
echo.
echo Wow! I'm impressed. %brw% monsters is pretty good!
echo Keep going!
echo.
pause
)
cls
goto sencounter

::####################################################################################

:kvictory
cls
echo.
echo A few days later, the town commends you for defeating the
echo monster which spooked the whole town.
echo You become the official monster hunter and will continue to 
echo hunt monsters until the day you die.
echo.
pause
cls
goto kend

::####################################################################################

:kbroken
title SKELETON Guilt
cls
echo.
echo A few days later, you decide to quit monster hunting and
echo settle down. You feel only guilt for calling a SKELETON spooky
echo promptly before killing him. You see yourself as a murderer now.
echo.
pause
cls
goto kend

::####################################################################################

:kpacifist2
title SKELETON Pity!
cls
echo. 
echo The SKELETON rattled off!
echo YOU WIN!
echo.
pause
cls
echo.
echo A few days later, you find a single letter on your doorstep.
echo.
pause
cls
echo.
echo    "You should really learn to fight before
echo     attempting to fight spooks such as myself.
echo.
echo                                        ~SKELETON"
echo.
pause
cls
goto end

::####################################################################################

::####################################################################################

::####################################################################################

::####################################################################################

::####################################################################################
::Later on, I might add a difficult boss to the end of boss rush mode.







::##########################################################################################

::UPDATE LOG 

::----------------------------------------------------------------------------

::Version 2.1
::
::-Slight statistic changes to Boss Rush mode

::----------------------------------------------------------------------------

::Version 2.0
::
::-Added dialogue when you restart a game without closing the game
::-Added a 10% chance of a critical hit when you "fight"
::-Added dialogue to the first spare to give the player a hint for that ending
::-Improved SLIME code overall
::-Added the SKELETON
::-Changed "enemy" on the battlescreen to the current monster
::-Inputting nothing after giving up now does not automatically "give up" again
::-Added monster choice at the beginning
::-Added Boss Rush mode
::-Removed any "Spare" or "Give Up" endings from Boss Rush mode
::-Added strength to "Heal"
::-Made strong monster attacks less likely

::----------------------------------------------------------------------------

::Version 1.2
::
::-Changed "Do Nothing" to "Spare"
::-Fixed typo's
::-Added different dialogues for when you suicide without enough magic
::-Added another ending when you spare enough times, give up enough times, then suicide
::-Inputting nothing on the battle screen no longer repeats your previous move but gives you new dialogue

::---------------------------------------------------------------------------------

::Version 1.1
::
::-Added most of the dialogue and alternate endings for the SLIME
::-Tons and tons of other stuff

::---------------------------------------------------------------------------------

::Version 1.0
::
::-Formed the basic combat system
::-Added an ending for winning and losing
::-Everything else