#!/bin/bash

# 原力槟果1087X网站自动部署脚本
# 使用方法：chmod +x deploy.sh && ./deploy.sh

echo "🚀 开始部署原力槟果1087X网站..."

# 检查是否为root用户
if [ "$EUID" -ne 0 ]; then 
    echo "❌ 请使用root用户运行此脚本"
    exit 1
fi

# 更新系统
echo "📦 更新系统包..."
apt update && apt upgrade -y

# 安装必要软件
echo "🔧 安装必要软件..."
apt install -y python3 python3-pip nginx unzip wget curl

# 创建网站目录
echo "📁 创建网站目录..."
mkdir -p /var/www/1087x
cd /var/www/1087x

# 下载网站文件（如果您的网站文件在某个地方）
echo "⬇️ 准备网站文件..."
# 如果您有网站文件的URL，可以在这里下载
# wget -O website.zip https://your-website-files-url.com/website.zip
# unzip website.zip

# 或者如果您已经上传了文件，确保它们在正确位置
if [ ! -f "index.html" ]; then
    echo "❌ 找不到index.html文件，请确保网站文件已上传到/var/www/1087x/"
    exit 1
fi

# 设置文件权限
echo "🔐 设置文件权限..."
chown -R www-data:www-data /var/www/1087x
chmod -R 755 /var/www/1087x

# 配置Nginx
echo "🌐 配置Nginx..."
cat > /etc/nginx/sites-available/1087x << 'EOF'
server {
    listen 80;
    server_name 139.199.1.35;
    root /var/www/1087x;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location /assets/ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }

    # 安全头
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header X-Content-Type-Options "nosniff" always;
}
EOF

# 启用站点
echo "🔗 启用Nginx站点..."
ln -sf /etc/nginx/sites-available/1087x /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

# 测试Nginx配置
nginx -t
if [ $? -eq 0 ]; then
    echo "✅ Nginx配置正确"
    systemctl restart nginx
    systemctl enable nginx
else
    echo "❌ Nginx配置错误"
    exit 1
fi

# 创建systemd服务
echo "⚙️ 创建systemd服务..."
cat > /etc/systemd/system/1087x.service << 'EOF'
[Unit]
Description=1087X Website Service
After=network.target

[Service]
Type=simple
User=www-data
WorkingDirectory=/var/www/1087x
ExecStart=/usr/bin/python3 -m http.server 8000
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

# 启动服务
echo "🎯 启动1087X服务..."
systemctl daemon-reload
systemctl enable 1087x
systemctl start 1087x

# 配置防火墙
echo "🛡️ 配置防火墙..."
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 8000/tcp
ufw --force enable

# 检查服务状态
echo "📊 检查服务状态..."
systemctl status nginx --no-pager
systemctl status 1087x --no-pager

# 显示访问信息
echo ""
echo "🎉 部署完成！"
echo "=================="
echo "📱 访问地址："
echo "   - http://139.199.1.35 (通过Nginx)"
echo "   - http://139.199.1.35:8000 (直接访问)"
echo ""
echo "🔧 管理命令："
echo "   - 查看服务状态: systemctl status 1087x"
echo "   - 重启服务: systemctl restart 1087x"
echo "   - 查看日志: journalctl -u 1087x -f"
echo "   - 重启Nginx: systemctl restart nginx"
echo ""
echo "📁 网站目录: /var/www/1087x"
echo "📝 Nginx配置: /etc/nginx/sites-available/1087x"
echo ""
echo "🌐 下一步："
echo "   1. 购买域名并解析到 139.199.1.35"
echo "   2. 配置SSL证书 (可选): certbot --nginx"
echo "   3. 测试网站功能"
echo ""

# 测试网站是否可访问
sleep 3
if curl -s -o /dev/null -w "%{http_code}" http://localhost:8000 | grep -q "200"; then
    echo "✅ 网站服务运行正常"
else
    echo "❌ 网站服务可能有问题，请检查日志"
fi

echo "🚀 原力槟果1087X网站部署完成！"
