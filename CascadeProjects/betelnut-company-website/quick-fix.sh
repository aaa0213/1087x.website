#!/bin/bash

echo "🔧 1087X网站快速修复脚本"
echo "========================"

# 1. 检查文件是否存在
echo "📁 检查文件..."
if [ ! -d "/var/www/1087x" ]; then
    echo "❌ 目录不存在，创建目录..."
    mkdir -p /var/www/1087x
fi

if [ ! -f "/var/www/1087x/index.html" ]; then
    echo "❌ index.html不存在，重新复制文件..."
    cp -r /tmp/betelnut-company-website/* /var/www/1087x/
fi

# 2. 设置权限
echo "🔐 设置权限..."
chown -R www-data:www-data /var/www/1087x
chmod -R 755 /var/www/1087x

# 3. 检查文件内容
echo "📄 检查关键文件..."
if [ -f "/var/www/1087x/index.html" ]; then
    echo "✅ index.html 存在"
    echo "📊 文件大小: $(du -h /var/www/1087x/index.html | cut -f1)"
else
    echo "❌ index.html 仍然不存在"
    exit 1
fi

# 4. 重新配置Nginx
echo "🌐 重新配置Nginx..."
cat > /etc/nginx/sites-available/1087x << 'EOF'
server {
    listen 80;
    server_name 1087x.139.199.1.35;
    root /var/www/1087x;
    index index.html;
    
    # 日志
    access_log /var/log/nginx/1087x_access.log;
    error_log /var/log/nginx/1087x_error.log;
    
    location / {
        try_files $uri $uri/ =404;
    }
    
    # 静态文件缓存
    location ~* \.(css|js|jpg|jpeg|png|gif|ico|svg)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }
}
EOF

# 5. 启用站点
echo "🔗 启用站点..."
ln -sf /etc/nginx/sites-available/1087x /etc/nginx/sites-enabled/

# 6. 测试Nginx配置
echo "🧪 测试Nginx配置..."
if nginx -t; then
    echo "✅ Nginx配置正确"
    systemctl restart nginx
else
    echo "❌ Nginx配置错误"
    exit 1
fi

# 7. 启动Python服务
echo "🚀 启动Python服务..."
pkill -f "python3 -m http.server 8001" 2>/dev/null
cd /var/www/1087x
nohup python3 -m http.server 8001 > /var/log/1087x.log 2>&1 &

# 8. 检查服务状态
echo "📊 检查服务状态..."
sleep 2

echo ""
echo "🔍 服务状态检查："
echo "=================="

# 检查Nginx
if systemctl is-active --quiet nginx; then
    echo "✅ Nginx: 运行中"
else
    echo "❌ Nginx: 未运行"
fi

# 检查Python服务
if pgrep -f "python3 -m http.server 8001" > /dev/null; then
    echo "✅ Python服务: 运行中 (端口8001)"
else
    echo "❌ Python服务: 未运行"
fi

# 检查端口
echo "📡 端口检查："
netstat -tlnp | grep -E ':(80|8001)' || echo "❌ 端口未监听"

# 9. 测试访问
echo ""
echo "🌐 测试访问："
echo "============"
if curl -s -o /dev/null -w "%{http_code}" http://localhost:8001 | grep -q "200"; then
    echo "✅ 本地访问成功 (http://localhost:8001)"
else
    echo "❌ 本地访问失败"
fi

if curl -s -o /dev/null -w "%{http_code}" http://localhost | grep -q "200"; then
    echo "✅ Nginx访问成功 (http://localhost)"
else
    echo "❌ Nginx访问失败"
fi

# 10. 显示访问地址
echo ""
echo "🎯 修复完成！访问地址："
echo "======================"
echo "🌐 http://139.199.1.35:8001"
echo "🌐 http://1087x.139.199.1.35"
echo "🌐 http://139.199.1.35 (原网站)"
echo ""
echo "📝 日志文件："
echo "   - Nginx: /var/log/nginx/1087x_error.log"
echo "   - Python: /var/log/1087x.log"
echo ""
echo "🔧 如有问题，请查看日志文件获取详细错误信息！"
