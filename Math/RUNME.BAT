echo off
cls
echo �
echo  To run "DIVISION ALGORITHM" with a black and white monitor, select 1.
echo �
echo  To run "DIVISION ALGORITHM" with a color monitor, select 2.
echo �
echo  To run "DIVISION ALGORITHM" with a grey-scale monitor, select 3.
echo �
getkey To quit, press any other key.�
echo �
if errorlevel 52 goto END
if errorlevel 51 goto THREE
if errorlevel 50 goto TWO
if errorlevel 49 goto ONE
goto END
:THREE
echo �
echo  Please wait.
echo �
EUCLID m
goto END
:TWO
echo �
echo  Please wait.
echo �
EUCLID c
goto END
:ONE
echo �
echo  Please wait.
echo �
EUCLID
goto END
:END  
