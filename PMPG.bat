@echo off
cls
echo �ϐ���������...
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
echo �����B
echo �ۑ��t�H���_�m�F��...
if exist %USERPROFILE%\Documents\PMPG\ (
	echo �ۑ��t�H���_��%USERPROFILE%\Documents\PMPG\�Ɏw�肵�܂����B
	cd %USERPROFILE%\Documents\PMPG\
) ELSE (
	echo �ۑ��t�H���_�쐬��...
	cd %USERPROFILE%\Documents\
	md PMPG
	cd PMPG
	echo �ۑ��t�H���_��%USERPROFILE%\Documents\PMPG\�Ɏw�肵�܂����B
)

echo,
echo #####################
echo ## PMPlugGenerator ##
echo ##  Author: Yuu528 ##
echo #####################
echo,
echo ���߂�README.md�t�@�C������README.txt�t�@�C����
echo ���ǂ݂��������B
echo,
echo �󔒂ł��悢�Ƃ����#�}�[�N��t���Ă��܂�
echo,
echo,
set /P name="�v���O�C����: "
set /P author="�쐬��: "
set /P authors="#�����쐬��: "
set /P ver="�v���O�C���o�[�W����: "
set /P api="API�o�[�W����: "

:setload
set /P loadpre="���[�h�^�C�~���O(STARTUP�Ȃ�s �܂��� POSTWORLD�Ȃ�p): "
if "%loadpre%" == "s" (
	set load="STARTUP"
) else if "%loadpre%" == "p" (
	set load="POSTWORLD"
) else (
	echo ���[�h�^�C�~���O��s�܂���p�Őݒ肵�Ă�������
	goto setload
)

set /P desc="#����: "
set /P web="#�E�F�u�T�C�g: "
set /P depend="#�ˑ�: "
set /P sdepend="#�\�t�g�̈ˑ�: "

echo �Z�[�u���Ă��܂�...
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
set /P yncmd="�R�}���h���g���v���O�C���ł���?[y/n]: "
if "%yncmd%" == "y" (
	goto cmdy
) else if "%yncmd%" == "n" (
	goto cmdn
) else (
	goto setyncmd
)

:cmdy
set /P cname=" �R�}���h(/����): "
set /P cdesc=" ����: "
set /P cusage=" �g����: "
set /P cperm=" #�p�[�~�b�V����: "
echo �Z�[�u���Ă��܂�...
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

set /P cname=" �R�}���h(/����): "
set /P cdesc=" ����: "
set /P cusage=" �g����: "
set /P cperm=" #�p�[�~�b�V����: "
echo �Z�[�u���Ă��܂�...
echo  %cname%:>> plugin.yml
echo   description: %cdesc%>> plugin.yml
echo   usage: %cusage%>> plugin.yml
if not "%cperm%" == "" (
	echo   cperm: %cperm%>> plugin.yml
)
goto setyncmore

:setyncmore
set /P yncmore="����ɃR�}���h��ǉ����܂���?[y/n]: "
if "%yncmore%" == "y" (
	goto cmdtwo
) else if "%yncmore%" == "n" (
	goto cmdn
) else (
	goto setyncmore
)

:cmdn
set /P ynperm="�p�[�~�b�V�����𗘗p���܂���?[y/n]: "
if "%ynperm%" == "y" (
	goto permy
) else if "%ynperm%" == "n" (
	goto end
) else (
	goto cmdn
)

:permy
set /P pname=" �p�[�~�b�V������: "
set /P pdesc=" ����: "
set /P pdefa=" �f�t�H���g�p�[�~�b�V����: "
echo �Z�[�u���Ă��܂�...
echo permissions:>> plugin.yml
echo  %pname%:>> plugin.yml
echo   default: %pdefa%>> plugin.yml
echo   description: %pdesc%>> plugin.yml
goto setynpmore

:permtwo
set /P pname=" �p�[�~�b�V������: "
set /P pdesc=" ����: "
set /P pdefa=" �f�t�H���g�p�[�~�b�V����: "
echo �Z�[�u���Ă��܂�...
echo  %pname%:>> plugin.yml
echo   default: %pdefa%>> plugin.yml
echo   description: %pdesc%>> plugin.yml
goto setynpmore


:setynpmore
set /P ynpmore="����Ƀp�[�~�b�V������ǉ����܂���?[y/n]: "
if "%ynpmore%" == "y" (
	goto permtwo
) else if "%ynpmore%" == "n" (
	goto end
) else (
	goto setynpmore
)

:end
set /P yneve="Event���g�p���܂���?[y/n]: "
echo,
echo src�t�@�C��, ���C���R�[�h�𐶐����܂�
md src
cd src
md %author%
cd %author%
echo �Z�[�u���Ă��܂�...
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
	echo //�g�p����Event��use���������Ă�������>> %name%.php
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