@echo off
cls
echo 変数初期化中...
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
echo 完了。
echo 保存フォルダ確認中...
if exist %USERPROFILE%\Documents\PMPG\ (
	echo 保存フォルダを%USERPROFILE%\Documents\PMPG\に指定しました。
	cd %USERPROFILE%\Documents\PMPG\
) ELSE (
	echo 保存フォルダ作成中...
	cd %USERPROFILE%\Documents\
	md PMPG
	cd PMPG
	echo 保存フォルダを%USERPROFILE%\Documents\PMPG\に指定しました。
)

echo,
echo #####################
echo ## PMPlugGenerator ##
echo ##  Author: Yuu528 ##
echo #####################
echo,
echo 初めにREADME.mdファイル又はREADME.txtファイルを
echo お読みください。
echo,
echo 空白でもよいところは#マークを付けています
echo,
echo,
set /P name="プラグイン名: "
set /P author="作成者: "
set /P authors="#複数作成者: "
set /P ver="プラグインバージョン: "
set /P api="APIバージョン: "

:setload
set /P loadpre="ロードタイミング(STARTUPならs または POSTWORLDならp): "
if "%loadpre%" == "s" (
	set load="STARTUP"
) else if "%loadpre%" == "p" (
	set load="POSTWORLD"
) else (
	echo ロードタイミングはsまたはpで設定してください
	goto setload
)

set /P desc="#説明: "
set /P web="#ウェブサイト: "
set /P depend="#依存: "
set /P sdepend="#ソフトの依存: "

echo セーブしています...
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
set /P yncmd="コマンドを使うプラグインですか?[y/n]: "
if "%yncmd%" == "y" (
	goto cmdy
) else if "%yncmd%" == "n" (
	goto cmdn
) else (
	goto setyncmd
)

:cmdy
set /P cname=" コマンド(/無し): "
set /P cdesc=" 説明: "
set /P cusage=" 使い方: "
set /P cperm=" #パーミッション: "
echo セーブしています...
echo commands:>> plugin.yml
echo  %cname%:>> plugin.yml
echo   description: %cdesc%>> plugin.yml
echo   usage: %cusage%>> plugin.yml
if not "%cperm%" == "" (
	echo   cperm: %cperm%>> plugin.yml
)
goto setyncmore

:cmdtwo
set cname=
set cdesc=
set cusage=
set cperm=

set /P cname=" コマンド(/無し): "
set /P cdesc=" 説明: "
set /P cusage=" 使い方: "
set /P cperm=" #パーミッション: "
echo セーブしています...
echo  %cname%:>> plugin.yml
echo   description: %cdesc%>> plugin.yml
echo   usage: %cusage%>> plugin.yml
if not "%cperm%" == "" (
	echo   cperm: %cperm%>> plugin.yml
)
goto setyncmore

:setyncmore
set /P yncmore="さらにコマンドを追加しますか?[y/n]: "
if "%yncmore%" == "y" (
	goto cmdtwo
) else if "%yncmore%" == "n" (
	goto cmdn
) else (
	goto setyncmore
)

:cmdn
set /P ynperm="パーミッションを利用しますか?[y/n]: "
if "%ynperm%" == "y" (
	goto permy
) else if "%ynperm%" == "n" (
	goto end
) else (
	goto cmdn
)

:permy
set /P pname=" パーミッション名: "
set /P pdesc=" 説明: "
set /P pdefa=" デフォルトパーミッション: "
echo セーブしています...
echo permissions:>> plugin.yml
echo  %pname%:>> plugin.yml
echo   default: %pdefa%>> plugin.yml
echo   description: %pdesc%>> plugin.yml
goto setynpmore

:permtwo
set /P pname=" パーミッション名: "
set /P pdesc=" 説明: "
set /P pdefa=" デフォルトパーミッション: "
echo セーブしています...
echo  %pname%:>> plugin.yml
echo   default: %pdefa%>> plugin.yml
echo   description: %pdesc%>> plugin.yml
goto setynpmore


:setynpmore
set /P ynpmore="さらにパーミッションを追加しますか?[y/n]: "
if "%ynpmore%" == "y" (
	goto permtwo
) else if "%ynpmore%" == "n" (
	goto end
) else (
	goto setynpmore
)

:end
set /P yneve="Eventを使用しますか?[y/n]: "
echo,
echo srcファイル, メインコードを生成します
md src
cd src
md %author%
cd %author%
echo セーブしています...
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
	echo //使用するEventのuse文を書いてください>> %name%.php
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
	echo     public function onCommand(CommandSender $sender, Command $command, $label, array $args)^{>> %name%.php
	echo,>> %name%.php
	echo     ^}>> %name%.php
	goto compl