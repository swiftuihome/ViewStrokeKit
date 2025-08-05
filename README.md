# ViewStrokeKit

![Swift Version](https://img.shields.io/badge/Swift-5.9+-orange.svg) ![Platform](https://img.shields.io/badge/Platform-iOS%2015+%20%7C%20macOS%2012+%20%7C%20tvOS%2015+%20%7C%20watchOS%208+-lightgrey.svg) ![License](https://img.shields.io/badge/License-MIT-blue.svg) ![SPM Ready](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg)

ViewStrokeKit 是一个轻量级 SwiftUI 扩展库，专为视图描边效果设计。通过简单的修饰符，即可为任意 SwiftUI 视图添加单层或多层描边效果，完美支持文本、图像等各种视图元素。

## 功能亮点

✨ **一键描边** - 使用 `viewStroke` 修饰符快速添加描边  
🌈 **多重描边** - 支持叠加多层不同颜色的描边效果  
🖼 **全视图支持** - 适用于 Text、Image 及自定义视图  
📱 **全平台适配** - 支持 iOS/macOS/tvOS/watchOS  
⚡️ **高性能实现** - 基于 SwiftUI 原生 Canvas 实现  

## 安装指南

### Swift Package Manager

1. 在 Xcode 菜单中选择 **File > Add Packages...**
2. 输入仓库地址：`https://github.com/swiftuihome/ViewStrokeKit`
3. 选择版本规则（推荐选择最新版本）
4. 点击 **Add Package**

或直接在 `Package.swift` 中添加依赖：

```swift
dependencies: [
    .package(url: "https://github.com/swiftuihome/ViewStrokeKit.git", from: "1.0.0")
]
```

## 使用示例

### 基础描边

```swift
import ViewStrokeKit

Text("你好，世界！")
    .font(.title)
    .foregroundColor(.white)
    .viewStroke(color: .black, width: 2)
```

### 多层描边效果

```swift
Text("多重描边")
    .font(.largeTitle)
    .foregroundColor(.yellow)
    .viewStroke(color: .red, width: 4)  // 第一层红色描边
    .viewStroke(color: .black, width: 2) // 第二层黑色描边
```

### 图像描边

```swift
Image(systemName: "heart.fill")
    .font(.system(size: 60))
    .foregroundColor(.pink)
    .viewStroke(color: .white, width: 3)
```

### 完整示例

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            // 单层描边文本
            Text("SwiftUI")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.white)
                .viewStroke(color: .blue, width: 3)
            
            // 多层描边文本
            Text("描边效果")
                .font(.system(size: 50, weight: .black))
                .foregroundColor(.yellow)
                .viewStroke(color: .red, width: 5)
                .viewStroke(color: .black, width: 2)
            
            // 图像描边
            Image(systemName: "swift")
                .font(.system(size: 60))
                .foregroundColor(.orange)
                .viewStroke(color: .white, width: 4)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.gradient)
    }
}
```

## API 文档

### `viewStroke(color:width:)`

为视图添加描边效果

**参数**:
- `color`: 描边颜色（`Color` 类型）
- `width`: 描边宽度（`CGFloat` 类型，建议值 1-5）

**返回值**:
返回应用了描边效果的视图

## 进阶技巧

1. **动态效果**：与动画修饰符结合创建动态描边效果
   ```swift
   @State private var strokeWidth: CGFloat = 1
   
   Text("动态描边")
       .viewStroke(color: .purple, width: strokeWidth)
       .onTapGesture {
           withAnimation {
               strokeWidth = strokeWidth == 1 ? 5 : 1
           }
       }
   ```

2. **渐变色描边**：使用 `.overlay` 实现特殊效果
   ```swift
   Text("渐变描边")
       .foregroundColor(.white)
       .viewStroke(color: .clear, width: 4)
       .overlay(
           LinearGradient(colors: [.red, .blue], 
                         startPoint: .leading, 
                         endPoint: .trailing)
               .mask {
                   Text("渐变描边")
                       .viewStroke(color: .white, width: 4)
               }
       )
   ```

## 常见问题

**Q：描边效果在部分视图上显示不完整？**  
A：请确保目标视图有足够的空间，可通过添加 `padding` 解决：
```swift
MyView()
    .padding(5)  // 为描边留出空间
    .viewStroke(color: .red, width: 3)
```

**Q：如何调整描边位置？**  
A：描边默认居中显示，可通过组合多个修饰符实现偏移效果：
```swift
Text("偏移描边")
    .foregroundColor(.white)
    .viewStroke(color: .black, width: 3)
    .offset(x: 2, y: 2)  // 模拟阴影偏移
```

## 贡献指南

欢迎通过 Issue 提交问题或 Pull Request 贡献代码。提交前请确保：
1. 代码通过 SwiftLint 检查
2. 包含相应的单元测试
3. 更新文档说明

## 许可证

本项目采用 MIT 开源许可证，详情见 [LICENSE](LICENSE) 文件。
