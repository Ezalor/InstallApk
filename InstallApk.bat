@echo off
title ��װ APK
:start
set z=0
adb devices >nul 2>nul
adb devices > %~dp0tmptmp.txt
set a=0
for /f "delims= skip=1" %%i in ( %~dp0tmptmp.txt ) do (
set /a a+=1 & call set f%%a%%=%%i
)
call set b=%a%

if %a% EQU 0 (
    echo û���豸����
	echo+
	goto x
	pause >nul
	cls
	goto start
)

if %a% EQU 1 goto t

echo ��ѡ��װ�豸��
for /L %%j in (1,1,%b%) do (
    call echo [%%j] %%f%%j%%
	call echo %%f%%j%% > %~dp0tmptmp%%j.txt
)


set c=1
for /L %%k in (1,1,%b%) do (
    for /f "delims=	" %%l in ( %~dp0tmptmp%%k.txt ) do (
	    call set g%%c%%=%%l & set /a c+=1
	)
)
if defined %h% ( cls & goto s )

choice /C 12345 /N /M "�����룺"
if "%errorlevel%"=="1" set h=%g1% & goto :r1
if "%errorlevel%"=="2" set h=%g2% & goto :r2
if "%errorlevel%"=="3" set h=%g3% & goto :r3
if "%errorlevel%"=="4" set h=%g4% & goto :r4
if "%errorlevel%"=="5" set h=%g5% & goto :r5

:r1
if not defined g1 (
    echo �豸ѡ�����������ѡ�񡣰���������¿�ʼ����
	pause >nul
	cls
	goto start
)

echo+
echo ��ѡ�� %g1%
echo+
call :clean

goto s

:r2
if not defined g2 (
    echo �豸ѡ�����������ѡ�񡣰���������¿�ʼ����
	pause >nul
	cls
	goto start
)

echo+
echo ��ѡ�� %g2%
echo+
call :clean

goto s

:r3
if not defined g3 (
    echo �豸ѡ�����������ѡ�񡣰���������¿�ʼ����
	pause >nul
	cls
	goto start
)

echo+
echo ��ѡ�� %g3%
echo+
call :clean

goto s

:r4
if not defined g4 (
    echo �豸ѡ�����������ѡ�񡣰���������¿�ʼ����
	pause >nul
	cls
	goto start
)

echo+
echo ��ѡ�� %g4%
echo+
call :clean

goto s

:r5
if not defined g5 (
    echo �豸ѡ�����������ѡ�񡣰���������¿�ʼ����
	pause >nul
	cls
	goto start
)

echo+
echo ��ѡ�� %g5%
echo+
call :clean

goto s




:s

if %z% EQU 1 goto y

set h=%h: =%

if defined w echo ��ѡ��%h% & echo+

:y
set w=<nul
set w=%1
if not defined w goto s
if not exist %w% cls & echo �ļ������ڣ��������Ϸš��� & echo+ & goto s

echo+
echo adb -s %h% install -r %w%
echo+


for /f "delims=" %%o in ('adb -s %h% install -r %w% 2^<^&1') do (
    echo.%%o
    set result=%%o
)

if "%result%"=="Success" (
    echo+
    echo ��װ�ɹ���
	echo+
) else (
    echo+
    echo ��װʧ�ܣ����顭��
	echo+
)

echo ��������˳�...
pause >nul
exit


echo ����������¿�ʼ...
pause >nul
cls
goto s

:t
set z=1
::pause
for /f "delims=	" %%l in ( "%f1%" ) do (
    echo ��װ�豸��%%l & call set h=%%l
)

goto s


echo TTTT
pause & exit

:x
echo ��ѡ�������ѱ�����豸��
choice /C 12 /N /M "[1] ���ֻ�    [2] ������"
if "%errorlevel%"=="1" call "%~dp0���ֻ�.bat" & goto :start
if "%errorlevel%"=="2" call "%~dp0������.bat" & goto :start


:clean
    echo ������ʱ�ļ�����
	echo+
	del %~dp0tmp.txt >nul 2>nul
	del %~dp0tmptmp.txt >nul 2>nul
	del %~dp0tmptmp1.txt >nul 2>nul
	del %~dp0tmptmp2.txt >nul 2>nul
	del %~dp0tmptmp3.txt >nul 2>nul
	del %~dp0tmptmp4.txt >nul 2>nul
	del %~dp0tmptmp5.txt >nul 2>nul




