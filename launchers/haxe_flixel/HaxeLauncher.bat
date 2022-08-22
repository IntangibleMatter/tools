@echo off

set FLIXELDIR="D:\.games\flixel\ ::set this to wherever you want your games to be

cd %FLIXELDIR%
echo                                  DIRECTORIES

echo  --------------------------------------------------------------------------
for /d %%D in (*) do echo %%~nxD
echo  --------------------------------------------------------------------------

:: expects you to have some folders in the flixel folder for whatever types of things you want to categorize by. i.e. /tutorials/, /platformers/, /i-suck-at-making-games/
set /p PROJECTDIR="Please enter the name of the directory of the project you want to work on: "

cd "%PROJECTDIR%"


echo  --------------------------------------------------------------------------
for /d %%D in (*) do echo %%~nxD
echo  --------------------------------------------------------------------------

set /p PROJECTNAME="Please enter the name of your project: "


if exist "%PROJECTNAME%\" (
    call :open
    exit
) else (
    call :create
)


:create
    cd %PROJECTDIR%
    flixel tpl -n %PROJECTNAME%
    exit


:open
    "code" "%FLIXELDIR%%PROJECTDIR%\%PROJECTNAME%"
    exit
