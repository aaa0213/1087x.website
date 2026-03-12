# 原力槟果1087X - GitHub Pages部署指南

## 🚀 快速部署到GitHub Pages

### 1. 创建GitHub仓库
1. 访问 https://github.com
2. 创建新仓库：`1087x-website`
3. 选择Public（公开）

### 2. 上传网站文件
1. 将所有网站文件上传到仓库
2. 确保包含：
   - index.html
   - script.js
   - styles.css
   - assets/ 文件夹

### 3. 启用GitHub Pages
1. 进入仓库设置
2. 找到Pages选项
3. 选择Source: Deploy from a branch
4. 选择Branch: main
5. 选择Folder: /root
6. 点击Save

### 4. 访问网站
等待几分钟后，访问：
https://yourusername.github.io/1087x-website

## 🌐 绑定自定义域名

### 1. 购买域名
推荐购买平台：
- 阿里云：万网
- 腾讯云：DNSPod
- Cloudflare

### 2. 配置DNS
在域名DNS设置中添加：
```
类型: CNAME
名称: @
值: yourusername.github.io
类型: CNAME  
名称: www
值: yourusername.github.io
```

### 3. 在GitHub中设置域名
1. 进入仓库Pages设置
2. 在Custom domain中输入您的域名
3. 点击Save

## 📱 优势
- ✅ 完全免费
- ✅ 全球CDN加速
- ✅ 自动HTTPS
- ✅ 高可用性
- ✅ 支持自定义域名

## 🔧 注意事项
1. 图片路径需要使用相对路径
2. 避免使用服务器端代码
3. 确保所有资源都可以通过HTTP访问

---

🎉 **这样您的网站就可以全球访问了！**
