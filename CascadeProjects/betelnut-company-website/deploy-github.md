# GitHub Pages 一键部署指南

## 🎯 推荐方案：GitHub Pages + 自定义域名

### 为什么选择GitHub Pages？
- ✅ **完全免费** - 无需服务器费用
- ✅ **全球CDN** - 访问速度快
- ✅ **自动HTTPS** - 安全加密
- ✅ **高可用** - 99.9%在线率
- ✅ **自定义域名** - 支持绑定自己的域名

## 📋 部署步骤

### 第一步：创建GitHub账号
1. 访问 https://github.com
2. 注册免费账号
3. 验证邮箱

### 第二步：创建仓库
1. 点击右上角 "+" → "New repository"
2. 仓库名：`1087x-website`
3. 选择 "Public"
4. 点击 "Create repository"

### 第三步：上传文件
#### 方法A：网页上传（适合少量文件）
1. 点击 "Add file" → "Upload files"
2. 拖拽所有网站文件
3. 提交更改

#### 方法B：Git上传（推荐）
```bash
# 安装Git后执行
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/yourusername/1087x-website.git
git push -u origin main
```

### 第四步：启用GitHub Pages
1. 进入仓库设置
2. 左侧菜单找到 "Pages"
3. Source选择 "Deploy from a branch"
4. Branch选择 "main"，文件夹选择 "/root"
5. 点击 "Save"

### 第五步：访问网站
等待2-5分钟，访问：
https://yourusername.github.io/1087x-website

## 🌐 绑定自定义域名

### 购买域名推荐
- **阿里云**：.com 29-69元/年
- **腾讯云**：.cn 28元/年  
- **Cloudflare**：.com 8美元/年

### DNS配置示例
```
# 阿里云DNS设置
记录类型: CNAME
主机记录: @
记录值: yourusername.github.io

记录类型: CNAME  
主机记录: www
记录值: yourusername.github.io
```

### GitHub设置域名
1. 在Pages设置中输入域名
2. 点击Save
3. 等待DNS生效（5分钟-24小时）

## 📱 移动端优化
您的网站已包含响应式设计，在手机上也能完美显示。

## 🚀 部署后效果
- 全球用户都能访问
- 自动HTTPS加密
- 快速加载速度
- 支持自定义域名

## 💡 额外优化建议

### 1. 添加统计代码
```html
<!-- 在index.html中添加Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
```

### 2. 优化SEO
```html
<!-- 在head中添加 -->
<meta name="description" content="原力槟果1087X - 新型精萃槟榔产品">
<meta property="og:title" content="原力槟果1087X">
<meta property="og:description" content="1087X精萃槟榔技术革新">
```

### 3. 添加favicon
```html
<link rel="icon" type="image/x-icon" href="assets/favicon.ico">
```

---

## 🎉 完成后您的网站地址将是：

**免费域名**：https://yourusername.github.io/1087x-website

**自定义域名**：https://yourdomain.com

**全球用户都能访问，无需服务器维护！**
