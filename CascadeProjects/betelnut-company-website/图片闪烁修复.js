// 图片闪烁修复补丁
// 将此代码添加到script.js文件末尾

// 修复图片闪烁问题
document.addEventListener('DOMContentLoaded', function() {
    // 移除所有图片的opacity动画
    const allImages = document.querySelectorAll('img');
    
    allImages.forEach(img => {
        // 确保图片立即显示
        img.style.opacity = '1';
        img.style.transition = 'none';
        
        // 移除可能的onerror处理
        img.removeAttribute('onerror');
        
        // 添加错误处理但不闪烁
        img.addEventListener('error', function() {
            // 使用简单的占位符，不触发重新渲染
            if (!img.dataset.errorHandled) {
                img.dataset.errorHandled = 'true';
                img.style.display = 'none';
                
                // 创建占位符div
                const placeholder = document.createElement('div');
                placeholder.className = 'w-full h-48 bg-pink-100 flex items-center justify-center';
                placeholder.innerHTML = '<span class="text-pink-600">Product Image</span>';
                img.parentNode.insertBefore(placeholder, img);
            }
        });
    });
    
    // 禁用IntersectionObserver导致的图片处理
    if (window.originalImageObserver) {
        window.originalImageObserver = null;
    }
});

// CSS修复 - 添加到styles.css
const imageFixCSS = `
/* 图片闪烁修复 */
.product-image img {
    opacity: 1 !important;
    transition: none !important;
    z-index: 2 !important;
    position: relative !important;
}

.product-image::before {
    z-index: 1 !important;
}

/* 移除图片加载动画 */
img {
    opacity: 1 !important;
    animation: none !important;
}
`;

// 动态添加CSS修复
const styleSheet = document.createElement('style');
styleSheet.textContent = imageFixCSS;
document.head.appendChild(styleSheet);
