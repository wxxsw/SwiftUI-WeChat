![SwiftUI-WeChat](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/logo.png?1212)

<p align="center">
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/language-Swift%205.1-f48041.svg?style=flat"></a>
<a href="https://developer.apple.com/swiftui"><img src="https://img.shields.io/badge/framework-SwiftUI-blue.svg?style=flat"></a>
<a href="https://developer.apple.com/ios"><img src="https://img.shields.io/badge/platform-iOS%2013%2b-blue.svg?style=flat"></a>
<a href="https://github.com/apple/swift-package-manager"><img src="https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat"></a>
<a href="https://github.com/wxxsw/SwiftUI-WeChat/blob/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat"></a>
</p>
<br/>

- [Overview](#overview)
- [Features](#features)
- [Screenshots](#screenshots)
- [Progress](#progress)
- [Requirements](#requirements)
- [License](#license)

## Overview

- 此项目仅为 `SwiftUI` 学习交流，非商业项目。

- 本人会不断跟进技术发展，目标是将 `SwiftUI-WeChat` 达到无限接近微信的体验。因为微信大家很熟悉，所以当你要实现一个和微信类似的功能，你可以在此项目中很快找到这个功能如何实现，所以相信这个项目会对大家有帮助。

- 计划会一直完善到 SwiftUI 和 iOS 13 普及，每周末更新。如果您对实现有疑问，或者有更好的想法，欢迎提 issue 与我交流探讨。

- 如果喜欢请 ★ Star

## Features

- 全部基于 SwiftUI 实现
- 实现二级页面隐藏 TabView
- 实现 List 的自定义样式（包括消除 NavigationLink 的样式）
- 通过 modifier 控制状态栏样式
- 完全支持 Dark Mode
- 特殊处理、知识点包含注释
- 使用 Swift Package Manager

## Screenshots

Light Mode|Dark Mode
---|---
![HomeView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_home_light.png?1212)|![HomeView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_home_dark.png?1212)
![ContactView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_contact_light.png?1212)|![ContactView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_contact_dark.png?1212)
![DiscoverView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_discover_light.png?1212)|![DiscoverView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_discover_dark.png?1212)
![MeView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_me_light.png?1212)|![MeView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_me_dark.png?1212)

## Progress

界面|位置|状态
---|---|---
标签栏|Module/Root/RootTabView|✅
首页|Module/Home/HomeView|✅
联系人|Module/Contact/ContactView|✅
发现|Module/Discover/DiscoverView|✅
我的|Module/Me/MeView|✅
朋友圈|Module/Timeline/TimelineView|🔨
聊天|Module/Chat/ChatView|待开发
搜索|Module/Search/SearchView|待开发
其它|...|待开发

## Requirements

- iOS 13+
- Xcode 11+
- Swift 5.1+

## Contributors

Create by [Gesen](https://github.com/wxxsw)

Banner Design by [@aduqin](https://dribbble.com/aduqin)

## License

SwiftUI-WeChat is released under the MIT license. [See LICENSE](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/LICENSE) for details.
