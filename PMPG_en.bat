@echo off
cls
echo initialization variable...
set name=
set author=
set authors=
set ver=
set api=
set loadpre=
set load=
set desc=
set web=
set depend=
set sdepend=
set yncmd=
set cname=
set cdesc=
set cusage=
set cperm=
set yncmore=
set ynperm=
set pname=
set pdesc=
set pdefa=
set ynpmore=
set yneve=
echo Complete.
echo Save Folder Setting...
if exist %USERPROFILE%\Documents\PMPG\ (
echo Save Folder Setting to %USERPROFILE%\Documents\PMPG\.
cd %USERPROFILE%\Documents\PMPG\
) ELSE (
echo Creating Save Folder...
cd %USERPROFILE%\Documents\PMPG\
echo Save Folder Setting to %USERPROFILE%\Documents\PMPG\.
)

echo,
echo #####################
echo ## PMPlugGenerator ##
echo ##  Author: Yuu528 ##
echo #####################
echo,
echo Please read README.md.
echo,
echo If the first letter is "#", Leave the column blank.
echo,
echo,
set /P name="Plugin Name: "
set /P author="Author: "
set /P authors="#Authors: "
set /P ver="Plugin Version: "
set /P api="API Version: "

:setload
set /P loadpre="Load Timing(s (STARTUP) or p (POSTWORLD)): "
if "%loadpre%" == "s" (
set load="STARTUP"
) else if "%loadpre%" == "p" (
set load="POSTWORLD"
) else (
echo Please Input "s" or "p".
goto setload
)

set /P desc="#Description: "
set /P web="#Web: "
set /P depend="#Depends: "
set /P sdepend="#Soft Depends: "

echo Saving...
md %name%
cd %name%
echo name: %name%>> plugin.yml
echo main: %author%\%name%>> plugin.yml
echo author: %author%>> plugin.yml
echo authors: [%authors%]>> plugin.yml
echo version: %ver%>> plugin.yml
echo api: [%api%]>> plugin.yml
echo load: %load%>> plugin.yml
if not "%desc%" == "" (
echo description: %desc%>> plugin.yml
)
if not "%web%" == "" (
echo website: %web%>> plugin.yml
)
if not "%depend%" == "" (
echo depend: [%depend%]>> plugin.yml
)
if not "%sdepend%" == "" (
echo softdepend: [%sdepend%]>> plugin.yml
)

:setyncmd
set /P yncmd="Use Command?[y/n]: "
if "%yncmd%" == "y" (
goto cmdy
) else if "%yncmd%" == "n" (
goto cmdn
) else (
goto setyncmd
)

:cmdy
set /P cname=" Command(Without "/"): "
set /P cdesc=" Description: "
set /P cusage=" Usage: "
set /P cperm=" #Permission: "
echo Saving...
echo commands:>> plugin.yml
echo  %cname%:>> plugin.yml
echo   description: %cdesc%>> plugin.yml
echo   usage: %cusage%>> plugin.yml
if not "%cperm%" == "" (
  echo cperm: %cperm%>> plugin.yml
)
goto setyncmore

:cmdtwo
set cname=
set cdesc=
set cusage=
set cperm=

set /P cname=" Command(Without "/"): "
set /P cdesc=" Description: "
set /P cusage=" Usage: "
set /P cperm=" #Permission: "
echo Saving...
echo  %cname%:>> plugin.yml
echo   description: %cdesc%>> plugin.yml
echo   usage: %cusage%>> plugin.yml
if not "%cperm%" == "" (
  echo cperm: %cperm%>> plugin.yml
)
goto setyncmore

:setyncmore
set /P yncmore="Add More Command?[y/n]: "
if "%yncmore%" == "y" (
goto cmdtwo
) else if "%yncmore%" == "n" (
goto cmdn
) else (
goto setyncmore
)

:cmdn
set /P ynperm="Use Permission?[y/n]: "
if "%ynperm%" == "y" (
goto permy
) else if "%ynperm%" == "n" (
goto end
) else (
goto cmdn
)

:permy
set /P pname=" Permission Name: "
set /P pdesc=" Description: "
set /P pdefa=" Default: "
echo Saving...
echo permissions:>> plugin.yml
echo  %pname%:>> plugin.yml
echo   default: %pdefa%>> plugin.yml
echo   description: %pdesc%>> plugin.yml
goto setynpmore

:permtwo
set /P pname=" Permission Name: "
set /P pdesc=" Description: "
set /P pdefa=" Default: "
echo Saving...
echo  %pname%:>> plugin.yml
echo   default: %pdefa%>> plugin.yml
echo   description: %pdesc%>> plugin.yml
goto setynpmore


:setynpmore
set /P ynpmore="Add More Permission?[y/n]: "
if "%ynpmore%" == "y" (
goto permtwo
) else if "%ynpmore%" == "n" (
goto end
) else (
goto setynpmore
)

:end
set /P yneve="Use Event?[y/n]: "
echo,
echo Main code Creating...
md src
cd src
md %author%
cd %author%
echo Saving...
echo ^<?php>> %name%.php
echo,>> %name%.php
echo namespace %author%;>> %name%.php
echo,>> %name%.php
echo use pocketmine\plugin\PluginBase;>> %name%.php
if "%setyncmd%" == "y" (
echo use pocketmine\command\Command;>> %name%.php
echo use pocketmine\command\CommandSender;>> %name%.php
)
if %yneve% == y (
echo use pocketmine\event\Listener;>> %name%.php
echo //Event Use Here>> %name%.php
echo,>> %name%.php
echo class %name% extends PluginBase implements Listener{>> %name%.php
) else (
echo,>> %name%.php
echo class %name% extends PluginBase{>> %name%.php
)
echo     public function onEnable(){>> %name%.php
echo,>> %name%.php
echo     }>> %name%.php
echo,>> %name%.php
echo     public function onDisable()^{>> %name%.php
echo,>> %name%.php
echo     }>> %name%.php

if "%yncmd%" == "y" (
goto addcmdfun
)

:compl
echo }>> %name%.php
cd C:\
cd %USERPROFILE%\Documents\PMPG\%name%\
%~dp0nkf32 -w --overwrite plugin.yml
cd src\%author%\
%~dp0nkf32 -w --overwrite %name%.php
explorer %USERPROFILE%\Documents\PMPG\
exit

:addcmdfun
echo,>> %name%.php
    echo public function onCommand(CommandSender $sender, Command $command, $label, array $args)^{>> %name%.php
echo,>> %name%.php
echo     ^}>> %name%.php
