![SwiftUI-WeChat](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/logo.png)

<p align="center">
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/language-Swift%205.1-f48041.svg?style=flat"></a>
<a href="https://developer.apple.com/swiftui"><img src="https://img.shields.io/badge/framework-SwiftUI-blue.svg?style=flat"></a>
<a href="https://developer.apple.com/ios"><img src="https://img.shields.io/badge/platform-iOS%2013%2b-blue.svg?style=flat"></a>
<a href="https://github.com/apple/swift-package-manager"><img src="https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat"></a>
<a href="https://github.com/wxxsw/SwiftUI-WeChat/blob/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat"></a>
</p>

- [Overview](#overview)
- [Features](#features)
- [Progress](#progress)
- [Screenshots](#screenshots)
- [Requirements](#requirements)
- [License](#license)

## Overview

- 此项目仅为 SwiftUI 学习交流项目，本人希望通过此项目不断跟进 SwiftUI 技术发展，前期完成微信的界面效果，后期尽量实现接近微信的交互效果，最终达到无限接近微信的体验，并通过这种方式完全掌握 SwiftUI。

- 此项目是一个业余项目，计划会一直更新维护到 SwiftUI 和 iOS 13 普及，每周末更新。若你也喜欢 SwiftUI，也欢迎你参与进来，提问题、意见建议或贡献代码都好，希望可以和大家一同学习，交流进步。

## Features

- 全部基于 SwiftUI 实现（除了第三方依赖）
- 使用 List 而不是 ScrollView
- 使用 TabView 嵌套 NavigationView
- 使用 SF Symbols
- 使用 Swift Package Manager 管理依赖
- 支持 Dark Mode
- 特殊处理、知识点包含注释
- 持续更新...

## Progress

界面|位置|状态
---|---|---
标签栏|Module/Root/RootTabView|✅
首页|Module/Home/HomeView|✅
联系人界面|Module/Contact/ContactView|✅
发现界面|Module/Discover/DiscoverView|🔨
我的界面|Module/Me/MeView|待开发
聊天界面|Module/Chat/ChatView|待开发
搜索界面|Module/Search/SearchView|待开发
朋友圈界面|Module/Timeline/TimelineView|待开发
其它|...|待开发

## Screenshots

Light Mode|Dark Mode
---|---
![HomeView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_home_light.png)|![HomeView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_home_dark.png)
![ContactView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_contact_light.png)|![ContactView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_contact_dark.png)

## Requirements

- iOS 13+
- Xcode 11+
- Swift 5.1+

## Thanks

Banner Design by [@aduqin](https://dribbble.com/aduqin)

## License

SwiftUI-WeChat is released under the MIT license. [See LICENSE](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/LICENSE) for details.
