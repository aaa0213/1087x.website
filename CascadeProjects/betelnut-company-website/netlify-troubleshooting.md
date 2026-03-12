# Netlify部署故障排查指南

## 🔍 常见问题和解决方案

### 1. 网站无法打开 - 检查清单

#### ✅ 第一步：检查部署状态
在Netlify控制台查看：
- [ ] 部署状态是否显示 "Published"？
- [ ] 有没有红色错误信息？
- [ ] 生成的URL是什么？

#### ✅ 第二步：检查文件结构
确保上传的文件结构正确：
```
根目录/
├── index.html (必须存在)
├── script.js
├── styles.css
└── assets/
    └── images/
        ├── product-1.jpg
        ├── product-2.jpg
        ├── product-3.jpg
        ├── product-4.jpg
        ├── product-5.jpg
        └── background.jpg
```

#### ✅ 第三步：检查index.html
确保index.html在根目录，不是在子文件夹中。

## 🛠️ 具体解决方案

### 问题1：404错误
**原因**：index.html不在根目录
**解决**：
1. 重新上传，确保index.html在根目录
2. 或在Netlify设置中重定向到正确路径

### 问题2：图片无法显示
**原因**：路径问题或文件未上传
**解决**：
1. 检查assets/images/文件夹是否存在
2. 确保所有图片文件都已上传
3. 检查文件名大小写

### 问题3：JavaScript不工作
**原因**：CORS问题或路径错误
**解决**：
1. 检查script.js是否正确上传
2. 确保路径引用正确

### 问题4：CSS样式丢失
**原因**：Tailwind CSS CDN问题
**解决**：
1. 检查网络连接
2. 或使用本地CSS文件

## 🚀 快速修复步骤

### 步骤1：重新部署
1. 在Netlify控制台点击 "Deploys"
2. 点击 "Trigger deploy"
3. 选择 "Deploy site"

### 步骤2：检查部署日志
1. 在部署页面点击具体部署
2. 查看部署日志
3. 找到错误信息

### 步骤3：手动修复文件
如果文件结构有问题：
1. 下载当前部署的文件
2. 重新整理文件结构
3. 重新上传

## 📱 测试步骤

### 1. 本地测试
```bash
# 在本地用浏览器打开index.html
# 确保所有功能正常
```

### 2. Netlify测试
```bash
# 访问生成的URL
# 检查控制台错误
# 查看网络请求
```

## 🔧 高级故障排除

### 检查Netlify配置
创建 `netlify.toml` 文件：
```toml
[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200

[build]
  publish = "."

[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "DENY"
    X-XSS-Protection = "1; mode=block"
```

### 检查DNS
如果使用自定义域名：
```bash
# 检查DNS解析
nslookup yourdomain.com

# 应该指向Netlify的IP
```

## 📞 获取帮助

### 1. Netlify文档
- 官方文档：https://docs.netlify.com
- 社区论坛：https://community.netlify.com

### 2. 检查浏览器控制台
1. 按F12打开开发者工具
2. 查看Console标签
3. 查看Network标签
4. 记录错误信息

## 🎯 紧急解决方案

### 如果所有方法都失败：
1. **使用简化版本**：只上传index.html
2. **检查文件编码**：确保UTF-8编码
3. **重置网站**：删除重建Netlify网站

---

## 📋 请提供以下信息以便帮助您：

1. **Netlify部署状态**：成功/失败/进行中？
2. **生成的URL**：完整的网站地址
3. **错误信息**：任何显示的错误
4. **浏览器控制台错误**：按F12查看的错误

**提供这些信息后，我可以更准确地帮您解决问题！**
