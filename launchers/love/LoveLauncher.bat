@echo off

set LOVEDIR=D:\.games\love2d\ ::where you want your love games to be 
set BOILERPLATEDIR=D:\.games\love2d\.boilerplate\ ::where you keep your love boilerplate

cd %LOVEDIR%
echo                                  DIRECTORIES

echo  --------------------------------------------------------------------------
for /d %%D in (*) do echo %%~nxD
echo  --------------------------------------------------------------------------

:: expects you to have folders in the love folder to categorize your work. i.e. /tutorials/, /sims/, /games/
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
    mkdir %PROJECTNAME%
    cd %PROJECTNAME%
    call :makedirs
    echo Created project
    :open


:open
    echo opening
    "code" "%LOVEDIR%%PROJECTDIR%\%PROJECTNAME%"
    exit

:makedirs
    mkdir assets
    cd assets
    mkdir data
    mkdir images
    mkdir music
    mkdir sounds
    cd ..

    mkdir source
    copy %BOILERPLATEDIR%main.lua source
    :: echo function love.load()>main.lua

    mkdir export
    mkdir .vscode
    copy %BOILERPLATEDIR%launch.json .vscode
    copy %BOILERPLATEDIR%settings.json .vscode
