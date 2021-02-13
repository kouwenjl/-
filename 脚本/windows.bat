你的名字:

chcp 65001
echo 开始编译 切换到D 盘
D:
echo 删除static 下的文件
del /s/q  D:\workSpace\yfids-auxiliary-tool\src\main\resources\static\*.*
echo 删除static 下的目录
rd /s/q   D:\workSpace\yfids-auxiliary-tool\src\main\resources\static\static
echo 打包前端
cd D:\workSpace\yfids-auxiliary-tool\src\main\frontend
call npm run build
echo 赋值前端到web
xcopy D:\workSpace\yfids-auxiliary-tool\src\main\frontend\dist D:\workSpace\yfids-auxiliary-tool\src\main\resources\static /e
echo 结束
pause

你的名字:
chcp 936
@echo off
::要打包的磁盘符
set drive=D:
::项目路径
set work=workSpace
::jar输出路径
set outPutPath=D:\testjar


set sourcePath=%drive%\%work%

echo.
echo 项目路径:%sourcePath%
echo 输出路径:%outPutPath%
echo.


md %outPutPath%\save
for %%i in (%outPutPath%\*.jar) do (
echo %%i
copy  "%%i" %outPutPath%\save
del /q "%%i"
)

        
echo ========== 打包开始 ==========
%drive%
cd %sourcePath%
if exist %sourcePath%\pom.xml goto single

for /d  %%i in (%sourcePath%\*) ^
do (
echo.
echo %%~ni 文件开始打包中....
if exist %sourcePath%\%%~ni\pom.xml (
call cd %sourcePath%\%%~ni
call git pull
call del /q  %sourcePath%\%%~ni\src\main\frontend\package-lock.json
call mvn -Dout-put-path=%outPutPath% install -Dmaven.test.skip=true
) else ( echo %%~ni 不是一个maven项目)
echo %%~ni 文件开始打包结束
)
echo =========== 打包结束 ============

goto end


:single
echo %sourcePath% 文件开始打包中....
call git pull
call del /q  %sourcePath%\src\main\frontend\package-lock.json
call mvn -Dout-put-path=%outPutPath% install -Dmaven.test.skip=true
echo %sourcePath% 文件打包结束
:end
for /f "tokens=1-3 delims=-/ " %%1 in ("%date%") do set ddd=%%1%%2%%3
for %%i in (%outPutPath%\*.jar) do (
echo %%i
ren "%%i" "%%~ni-%ddd%.jar"
)


chcp 936
@echo off
::要打包的磁盘符
set drive=D:
::项目路径
set work=workSpace
::jar输出路径
set outPutPath=D:\testjar


set sourcePath=%drive%\%work%

echo.
echo 项目路径:%sourcePath%
echo 输出路径:%outPutPath%
echo.


md %outPutPath%\save
for %%i in (%outPutPath%\*.jar) do (
echo %%i
copy  "%%i" %outPutPath%\save
del /q "%%i"
)

        
echo ========== 打包开始 ==========
%drive%
cd %sourcePath%
if exist %sourcePath%\pom.xml goto single

for /d  %%i in (%sourcePath%\*) ^
do (
echo.
echo %%~ni 文件开始打包中....
if exist %sourcePath%\%%~ni\pom.xml (
call cd %sourcePath%\%%~ni
call git pull
call del /q  %sourcePath%\%%~ni\src\main\frontend\package-lock.json
call mvn -Dout-put-path=%outPutPath% install -Dmaven.test.skip=true
) else ( echo %%~ni 不是一个maven项目)
echo %%~ni 文件开始打包结束
)
echo =========== 打包结束 ============

goto end


:single
echo %sourcePath% 文件开始打包中....
call git pull
call del /q  %sourcePath%\src\

你的名字:
:single
echo %sourcePath% 文件开始打包中....
call git pull
call del /q  %sourcePath%\src\main\frontend\package-lock.json
call mvn -Dout-put-path=%outPutPath% install -Dmaven.test.skip=true
echo %sourcePath% 文件打包结束
:end
for /f "tokens=1-3 delims=-/ " %%1 in ("%date%") do set ddd=%%1%%2%%3
for %%i in (%outPutPath%\*.jar) do (
echo %%i
ren "%%i" "%%~ni-%ddd%.jar"
)
pause
