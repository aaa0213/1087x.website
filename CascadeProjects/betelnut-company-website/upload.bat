@echo off
chcp 65001 >nul
echo 🚀 原力槟果1087X网站上传脚本
echo ================================

set SERVER_IP=139.199.1.35
set SERVER_USER=root
set REMOTE_PATH=/tmp/1087x
set LOCAL_PATH=%~dp0

echo 📁 本地路径: %LOCAL_PATH%
echo 🌐 服务器IP: %SERVER_IP%
echo 👤 用户名: %SERVER_USER%
echo 📂 远程路径: %REMOTE_PATH%
echo.

echo 🔍 检查必要工具...
where scp >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo ❌ 找不到scp命令，请安装OpenSSH客户端
    echo 💡 下载地址: https://github.com/PowerShell/Win32-OpenSSH/releases
    pause
    exit /b 1
)

echo 📦 开始上传文件...
echo.

echo 📁 上传网站文件到服务器...
scp -r "%LOCAL_PATH%" %SERVER_USER%@%SERVER_IP%:%REMOTE_PATH%

if %ERRORLEVEL% neq 0 (
    echo ❌ 上传失败，请检查：
    echo    1. 服务器IP地址是否正确
    echo    2. SSH服务是否运行
    echo    3. 网络连接是否正常
    echo    4. 是否有权限访问
    pause
    exit /b 1
)

echo ✅ 文件上传成功！
echo.

echo 🔧 准备在服务器上运行部署命令...
echo.

echo 📋 请在服务器上执行以下命令：
echo    ssh %SERVER_USER%@%SERVER_IP%
echo    cd %REMOTE_PATH%/betelnut-company-website
echo    chmod +x deploy.sh
echo    ./deploy.sh
echo.

echo 🌐 或者手动部署：
echo    1. 移动文件: mv /tmp/1087x/betelnut-company-website/* /var/www/1087x/
echo    2. 设置权限: chown -R www-data:www-data /var/www/1087x
echo    3. 启动服务: python3 -m http.server 8000
echo.

echo 🎯 上传完成！现在请登录服务器继续部署...
echo.
pause
