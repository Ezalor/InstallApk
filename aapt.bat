@echo off

set w=%1

aapt2 d badging %w% > %~dp0tmpaapt.txt
set u=0
for /f "eol=i delims=" %%i in ( %~dp0tmpaapt.txt ) do (
set /a u+=1 & call set q%%u%%=%%i
echo "%%i" | findstr "application-label:" >nul && call set tt1=%%i
echo "%%i" | findstr "application-label-zh-CN:" >nul && call set tt2=%%i
)

if defined tt1 (
echo %tt1% > %~dp0tmptt1.txt
%~dp0EnTextChange.exe -Text:"%~dp0tmptt1.txt" > %~dp0tmptt11.txt
for /f "tokens=2 delims='" %%i in ( %~dp0tmptt11.txt ) do set yym1=%%i
)

if defined tt2 (
echo %tt2% > %~dp0tmptt2.txt
%~dp0EnTextChange.exe -Text:"%~dp0tmptt2.txt" > %~dp0tmptt22.txt
for /f "tokens=2 delims='" %%i in ( %~dp0tmptt22.txt ) do set yym2=%%i
)

for /f "tokens=1-4 delims= " %%i in ( "%q1%" ) do (
set rr1=%%i
set rr2=%%j
set rr3=%%k
set rr4=%%l
)

rem 包名
for /f "tokens=2 delims='" %%i in ( "%rr2%" ) do set bm=%%i
rem 版本号
for /f "tokens=2 delims='" %%i in ( "%rr4%" ) do set bbh=%%i
rem 构建号
for /f "tokens=2 delims='" %%i in ( "%rr3%" ) do set gjh=%%i

set q2=%q2:'= %
set q3=%q3:'= %

echo 应用名——
echo 	EN：%yym1%
if defined yym2 echo 	ZH：%yym2%
echo 包名：%bm%
echo 版本号：%bbh%
echo 构建号：%gjh%
echo %q2%
echo %q3%
