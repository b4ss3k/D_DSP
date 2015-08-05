echo off
cls
echo ÿ
echo  To run "DIVISION ALGORITHM" with a black and white monitor, select 1.
echo ÿ
echo  To run "DIVISION ALGORITHM" with a color monitor, select 2.
echo ÿ
echo  To run "DIVISION ALGORITHM" with a grey-scale monitor, select 3.
echo ÿ
getkey To quit, press any other key.ÿ
echo ÿ
if errorlevel 52 goto END
if errorlevel 51 goto THREE
if errorlevel 50 goto TWO
if errorlevel 49 goto ONE
goto END
:THREE
echo ÿ
echo  Please wait.
echo ÿ
EUCLID m
goto END
:TWO
echo ÿ
echo  Please wait.
echo ÿ
EUCLID c
goto END
:ONE
echo ÿ
echo  Please wait.
echo ÿ
EUCLID
goto END
:END  
