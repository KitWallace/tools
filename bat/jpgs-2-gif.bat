@echo off
::  convert a set of jpgs, labeling each with the last part of its file name and combining into a GIF 
::  three parameters 
::    wildcard list of jpg images, probably within a subdirectory- filename structured so that the part after the - is the label
::    directory of location for the labeled jpgs  - this must already exist and be empty 
::    file name of the gif to be generated
::  parameters of the label and its position, and the delay on the gif have to be changed by editing the bat file
::
::  eg  jpgs-2-gif.bat Filwood\frames2\*.jpg  temp Filwood.gif


SETLOCAL ENABLEDELAYEDEXPANSION

set "fileList=%~1"
set "outdir=%~2"
set "gif=%~3"
for %%f in (%fileList%) do (
   set "FN=%%~nf%%~xf"
::   echo !FN!
   for /F "tokens=1,2 delims=-" %%a in ("%%~nf") do (
	  set "LABEL='%%b'"
   )
   echo !LABEL!  
   convert "%%f" -fill white -pointsize 50 -draw "text 50,100 !LABEL! " "%outdir%\!FN!"   
   ) 

convert -delay 100 -loop 0 "%outdir%\*"  %gif%
