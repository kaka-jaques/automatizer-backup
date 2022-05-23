@echo off
title AUTOMATIZER BACKUP 6.7
echo ===================================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX AUTOMATIZER BACKUP INICIADO! v6.8 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXX by Kalil J. Fakhouri XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ===================================================================================================

net session >nul 2>&1
if %ERRORLEVEL% == 0(goto errorAdm)

::SELEÇÃO DE REDE OU LOCAL
:genesis
echo ===================================================================
set /p choice="DIGITE L PARA FAZER O BACKUP NO HOST LOCAL OU DIGITE R PARA REDE:(L/R) "

::SELECIONAR PASTAS PARA FAZER O BACKUP
:folders
echo ===================================================================
echo PADRAO................(DESKTOP, IMAGENS, DOCUMENTOS, DOWNLOADS, VIDEOS)
echo ESPECIFICO............(PODE SELECIONAR O DIRETORIO DESDE A RAIZ ATE QUALQUER DIRETORIO)
echo PADRAO + ESPECIFICO...(SERA USADO O METODO PADRAO E TAMBEM SELECIONARA MAIS DIRETORIOS OU ARQUIVOS A SEREM COPIADOS)
set /p back="DESEJA FAZER BACKUP PADRAO, ESPECIFICO OU PADRAO + ESPECIFICA?(P/E/F) "
if %choice%==R (call net)
if %choice%==r (call net)  
if %choice%==L (call verify)
if %choice%==l (call verify) else (goto erroInput)

if ERRORLEVEL 1 CALL 

if %back%==P (goto FunBackP)
if %back%==p (goto FunBackP)
if %back%==E (goto FunBackE)
if %back%==e (goto FunBackE)
if %back%==F (goto FunBackF)
if %back%==f (goto FunBackF)

::FUNÇÃO DE DEFINIÇÃO DO BACKUP PADRÃO
:FunBackP
echo>backupCopy.bat
echo>>backupCopy.bat xcopy %systemdrive%\users\%username%\desktop\*.* %host%\BKP_%username%\Desktop /e /h /c /i
echo>>backupCopy.bat xcopy %systemdrive%\users\%username%\documents\*.* %host%\BKP_%username%\Documentos /e /h /c /i
echo>>backupCopy.bat xcopy %systemdrive%\users\%username%\downloads\*.* %host%\BKP_%username%\Downloads /e /h /c /i
echo>>backupCopy.bat xcopy %systemdrive%\users\%username%\images\*.* %host%\BKP_%username%\Imagens /e /h /c /i
echo>>backupCopy.bat xcopy %systemdrive%\users\%username%\videos\*.* %host%\BKP_%username%\Videos /e /h /c /i
echo>>backupCopy.bat xcopy %systemdrive%\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Bookmarks %host%\BKP_%username%\Google /e /h /c /i
echo>>backupCopy.bat xcopy %systemdrive%\users\%username%\AppData\Local\Mozilla\Firefox\Profiles\*.* %host%\BKP_%username%\Firefox /e /h /c /i
echo>>backupCopy.bat msg * CÓPIA DOS ARQUIVOS FINALIZADO! /time:30
echo>>backupCopy.bat PAUSE

::FUNÇÃO DE DEFINIÇÃO DO BACKUP ESPECIFICA
:FunBackE
echo =====================================================================================
cd %systemdrive%\
dir
goto try
:no
echo =====================================================================================
echo ARQUIVO NAO ENCONTRADO!
goto try
:full
echo =====================================================================================
echo ADICIONADO COM SUCESSO!
:try
echo =====================================================================================
set /p dire="DIGITE O NOME DO DIRETORIO A COPIAR, S PARA SAIR, C PARA PROSSEGUIR OU D PARA ENTRAR EM UM DIRETORIO (<nome>/S/C/D): "
if %dire%==S (goto end)
if %dire%==s (goto end)
if %dire%==C (goto cho)
if %dire%==c (goto cho)
if %dire%==D (goto sel)
if %dire%==d (goto sel)
if not exist %dire% (goto no) else (echo>>backupCopy.bat %cd%\%dire%)
goto full
:sel
echo =====================================================================================
set /p dire="DIGITE O NOME DO DIRETORIO QUE DESEJA IR: "
echo =====================================================================================
cd %dire%
dir
goto try
:cho
echo>>backupCopy.bat msg * CÓPIA DOS ARQUIVOS FINALIZADO! /time:30
echo>>backupCopy.bat PAUSE
if %choice%==R (goto net)
if %choice%==r (goto net)  
if %choice%==L (goto verify)
if %choice%==l (goto verify)

::FUNÇÃO DE DEFINIÇÃO DO BACKUP PADRÃO + ESPECIFICA
:FunBackF
echo>>backupCopy.bat xcopy %systemdrive%\users\%username%\desktop\*.* %host%\BKP_%username%\Desktop /e /h /c /i
echo>>backupCopy.bat xcopy %systemdrive%\users\%username%\documents\*.* %host%\BKP_%username%\Documentos /e /h /c /i
echo>>backupCopy.bat xcopy %systemdrive%\users\%username%\downloads\*.* %host%\BKP_%username%\Downloads /e /h /c /i
echo>>backupCopy.bat xcopy %systemdrive%\users\%username%\images\*.* %host%\BKP_%username%\Imagens /e /h /c /i
echo>>backupCopy.bat xcopy %systemdrive%\users\%username%\videos\*.* %host%\BKP_%username%\Videos /e /h /c /i
echo>>backupCopy.bat xcopy %systemdrive%\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Bookmarks %host%\BKP_%username%\Google /e /h /c /i
echo>>backupCopy.bat xcopy %systemdrive%\users\%username%\AppData\Local\Mozilla\Firefox\Profiles\*.* %host%\BKP_%username%\Firefox /e /h /c /i
echo =====================================================================================
cd %systemdrive%\
dir
goto try2
:no2
echo =====================================================================================
echo ARQUIVO NAO ENCONTRADO!
goto try2
:full2
echo =====================================================================================
echo ADICIONADO COM SUCESSO!
:try2
echo =====================================================================================
set /p dire="DIGITE O NOME DO DIRETORIO A COPIAR, S PARA SAIR, C PARA PROSSEGUIR OU D PARA ENTRAR EM UM DIRETORIO (<nome>/S/C/D): "
if %dire%==S (goto end)
if %dire%==s (goto end)
if %dire%==C (goto cho2)
if %dire%==c (goto cho2)
if %dire%==D (goto sel2)
if %dire%==d (goto sel2)
if not exist %dire% (goto no2) else (echo>>backupCopy.bat %cd%\%dire%)
goto full2
:sel2
echo =====================================================================================
set /p dire="DIGITE O NOME DO DIRETORIO QUE DESEJA IR: "
cd %dire%
dir
goto try2
:cho2
echo>>backupCopy.bat msg * CÓPIA DOS ARQUIVOS FINALIZADO! /time:30
echo>>backupCopy.bat PAUSE
if %choice%==R (goto net)
if %choice%==r (goto net)  
if %choice%==L (goto verify)
if %choice%==l (goto verify)

::VERIFICAÇÃO DE ESPAÇO NO DISCO INTERNO
:verify
set livre=wmic logicaldisk %SYSTEMDRIVE% get freespace
set usado=wmic logicaldisk %SYSTEMDRIVE% get freespace
if usado LSS livre (goto process) else (goto captcha)

::ERRO ORDINÁRIO DE ESPAÇO
:captcha
echo ===================================================================================================
set /p ask="ESPACO INSFUCIENTE PARA BACKUP! QUER CONTINUAR OU SELECIONAR OUTRO DISCO? (Continuar/Sair/Disco): "
if %ask%==c (goto process)
if %ask%==C (goto process)
if %ask%==s (goto end)
if %ask%==S (goto end)
if %ask%==d (goto select)
if %ask%==D (goto select)

::EXIBE LISTA DE DISCOS DISPONÍVEIS NO PC
:select
@echo off
echo>list.txt
echo>list.txt list vol
@echo on
diskpart -s list.txt
@echo off
echo ==================================================
set /p host="SELECIONE UM DISCO COM MAIS ESPACO: "
echo ==================================================
set /p ask="QUER PARTICIONAR O DISCO SELECIONADO?(sim/nao): "
if %ask%==S (goto process2)
if %ask%==s (goto process2)
if %ask%==n (goto conHostLocal)
if %ask%==N (goto conHostLocal)

::PROCESSO DE BACKUP PRINCIPAL
:process
@echo off
echo>system.txt
echo>system.txt select vol %SYSTEMDRIVE%
echo>>system.txt shrink desired=120000 minimum=50000
echo>>system.txt create partition primary
echo>>system.txt assign letter=G
@echo on
set host=G:\
goto disk

::PROCESSO DE BACKUP SECUNDÁRIO\USANDO OUTRO DISCO
:process2
@echo off
echo>system.txt
echo>system.txt select vol %host%
echo>>system.txt shrink desired=120000 minimum=50000
echo>>system.txt create partition primary
echo>>system.txt assign letter=G
@echo on
set host=G:\
goto disk

::SELEÇÃO DO SERVER PARA BACKUP
:net
echo =================================================================================================================
echo //AVISO!! ANTES DE COMECAR, VERIFIQUE SE HA ALGUM COMPUTADOR NA REDE COM UMA PASTA COMPARTILHADA (BKP_Clientes)//
echo =================================================================================================================
set /p host="SELECIONE O HOST DESTINÁTARIO (SHOWTEC: CPU - 1/KALIL - 2) OU DIGITE O NOME DO HOST MANUALMENTE (ID OU IP): "
if %host%==2 (goto filterHost)
if %host%==1 (goto filterHost)
if not %host%==1 (goto confirmation)
if not %host%==2 (goto confirmation)

::CRIAR PARTIÇÃO PARA BACKUP
:disk
@echo on
diskpart -s system.txt
G:
@echo off
format g: /fs:ntfs /q
goto createFH

::DEFINE IP PREDEFINIDO
:filterHost
if %host%==1 (set host=\\cpu\Backup_Clientes) else (set host=\\%host%\BKP_Clientes)
if %host%==2 (set host=\\kalil\BKP_Clientes) else (set host=\\%host%\BKP_Clientes)
set /p conf="%host% IP/ID destino esta correto?(sim/nao): "
if %conf%==s (goto createFH)
if %conf%==S (goto createFH)
if %conf%==n (goto net)
if %conf%==N (goto net)

::CONFIRMAÇÃO DE IP 
:confirmation
set /p conf="%host% IP/ID destino esta correto?(sim/nao): "
if %conf%==s (goto conHostIP)
if %conf%==S (goto conHostIP)
if %conf%==n (goto net)
if %conf%==N (goto net)

::CONVERSOR DO IP
:conHostIP
set host=\\%host%\BKP_Clientes
goto createFH

::CONVERSOR DO DISCO LOCAL
:conHostLocal
set host=%host%:\BKP_Clientes
goto createFH

::CRIAÇÃO DOS DIRETÓRIOS PRINCIPAIS
:createFH
mkdir %host%\BKP_%username%\Desktop
mkdir %host%\BKP_%username%\Documentos
mkdir %host%\BKP_%username%\Imagens
mkdir %host%\BKP_%username%\Videos
mkdir %host%\BKP_%username%\Downloads
mkdir %host%\BKP_%username%\Google
mkdir %host%\BKP_%username%\Firefox
if %back%==P (goto FunBackP)
if %back%==p (goto FunBackP)
if %back%==E (goto FunBackE)
if %back%==e (goto FunBackE)
if %back%==F (goto FunBackF)
if %back%==f (goto FunBackF)

::PROCESSO DE CÓPIA DOS ARQUIVOS
start backupCopy.bat

::FUNÇÃO ERRO ADMINISTRATIVO
:errorAdm
msg * SEM PERMISSÃO ADMINISTRATIVO! /time:5
goto end

::ERRO DE INPUT
:erroInput
msg * OPÇÃO INVALIDA! /time:3
goto genesis

::FIM DO PROGRAMA
:end
echo ====================================================================================================================
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX AUTOMATIZER BACKUP FINALIZADO! v6.8 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXX by Kalil J. Fakhouri XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo ====================================================================================================================
PAUSE