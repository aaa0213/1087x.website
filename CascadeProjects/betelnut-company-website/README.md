# 新型槟榔公司官网

一个现代化的企业官网，专注于新型槟榔产品的展示和推广。

## 🌟 特性

- **响应式设计** - 完美适配桌面端和移动端
- **现代化UI** - 使用Tailwind CSS构建美观界面
- **产品展示** - 详细的产品介绍和咨询功能
- **文章资讯** - 支持文章发布和阅读
- **联系表单** - 便捷的客户联系渠道
- **SEO优化** - 良好的搜索引擎优化
- **性能优化** - 图片懒加载、代码压缩等

## 📁 项目结构

```
betelnut-company-website/
├── index.html          # 主页面
├── styles.css          # 自定义样式
├── script.js           # JavaScript功能
├── README.md           # 项目说明
└── assets/             # 静态资源（如需要）
```

## 🚀 快速开始

### 直接使用

1. 下载项目文件到本地
2. 在浏览器中打开 `index.html`
3. 网站即可正常运行

### 本地服务器

推荐使用本地服务器来避免跨域问题：

```bash
# 使用Python
python -m http.server 8000

# 使用Node.js (需要安装http-server)
npx http-server

# 使用PHP
php -S localhost:8000
```

然后在浏览器中访问 `http://localhost:8000`

## 🎨 技术栈

- **HTML5** - 语义化标记
- **CSS3** - 现代样式设计
- **Tailwind CSS** - 实用优先的CSS框架
- **JavaScript (ES6+)** - 现代JavaScript特性
- **Remix Icons** - 精美图标库

## 📱 功能模块

### 1. 首页展示
- 公司介绍横幅
- 特色优势展示
- 产品预览
- 公司简介

### 2. 产品中心
- 产品分类展示
- 产品详情查看
- 产品咨询功能
- 产品收藏功能

### 3. 文章资讯
- 分类文章展示
- 文章详情阅读
- 加载更多功能
- 文章搜索

### 4. 联系我们
- 在线联系表单
- 公司联系方式
- 地图位置展示
- 社交媒体链接

## 🛠️ 自定义配置

### 修改公司信息

在 `index.html` 中修改以下内容：

```html
<!-- 公司名称 -->
<span class="text-xl font-bold text-gray-800">新型槟榔</span>

<!-- 联系信息 -->
<p class="text-gray-600">湖南省长沙市岳麓区高新技术产业开发区</p>
<p class="text-gray-600">0731-8888-8888</p>
<p class="text-gray-600">info@newbetelnut.com</p>
```

### 修改产品信息

在 `script.js` 中修改 `products` 数组：

```javascript
const products = [
    {
        id: 1,
        name: "产品名称",
        description: "产品描述",
        price: "¥价格",
        image: "产品图片URL",
        badge: "标签",
        category: "分类"
    }
    // 添加更多产品...
];
```

### 修改文章内容

在 `script.js` 中修改 `articles` 数组：

```javascript
const articles = [
    {
        id: 1,
        title: "文章标题",
        excerpt: "文章摘要",
        category: "文章分类",
        date: "2024-03-08",
        author: "作者",
        image: "文章图片URL",
        readTime: "阅读时间"
    }
    // 添加更多文章...
];
```

## 🎯 优化建议

### SEO优化
- 为每个页面添加独特的meta描述
- 使用语义化HTML标签
- 优化图片alt属性
- 添加结构化数据

### 性能优化
- 压缩图片资源
- 使用CDN加载静态资源
- 启用Gzip压缩
- 实施缓存策略

### 内容管理
- 考虑集成CMS系统
- 添加后台管理功能
- 实现动态内容更新
- 添加用户权限管理

## 📞 技术支持

如果在使用过程中遇到问题，请：

1. 检查浏览器控制台错误信息
2. 确认网络连接正常
3. 尝试清除浏览器缓存
4. 使用最新版本的浏览器

## 📄 许可证

本项目采用 MIT 许可证，详情请查看 LICENSE 文件。

## 🤝 贡献

欢迎提交Issue和Pull Request来改进这个项目。

---

**注意**: 这是一个前端展示项目，如需完整的后台管理系统和数据库支持，需要进一步开发后端服务。
