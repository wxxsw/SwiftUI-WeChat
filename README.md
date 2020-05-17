![SwiftUI-WeChat](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/logo.png?1212)

<p align="center">
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/language-Swift%205.1-f48041.svg?style=flat"></a>
<a href="https://developer.apple.com/swiftui"><img src="https://img.shields.io/badge/framework-SwiftUI-blue.svg?style=flat"></a>
<a href="https://developer.apple.com/ios"><img src="https://img.shields.io/badge/platform-iOS%2013%2b-blue.svg?style=flat"></a>
<a href="https://codebeat.co/projects/github-com-wxxsw-swiftui-wechat-master"><img alt="codebeat badge" src="https://codebeat.co/badges/5b74e3e1-8235-4730-b3e9-82373c921301" /></a>
<a href="https://github.com/wxxsw/SwiftUI-WeChat/blob/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat"></a>
</p>
<br/>

- [Overview](#overview)
- [Features](#features)
- [Screenshots](#screenshots)
- [TODO](#todo)
- [Requirements](#requirements)
- [License](#license)

## Overview

- 此项目仅为 `SwiftUI` 学习交流，非商业项目

- 本人会不断跟进技术发展，目标是将 `SwiftUI-WeChat` 达到无限接近微信的体验。因为微信大家都很熟悉，所以当你要实现一个和微信类似的功能，你可以在此项目中很快找到这个功能如何实现，所以相信这个项目会对大家有帮助

- 计划会一直完善到 `SwiftUI` 和 `iOS 13` 普及，每周末更新。如果您对实现有疑问，或者有更好的想法，欢迎在 [issue](https://github.com/wxxsw/SwiftUI-WeChat/issues) 里与我交流探讨

- 如果喜欢请 ★ Star

## Features

- [x] 全部基于 SwiftUI 实现
- [x] 首页切换时导航栏变化，二级页面隐藏 TabView
- [x] 动态列表使用 List，自定义样式（包括消除 NavigationLink 的样式）
- [x] 朋友圈图片宫格、在线视频播放、滚动列表时状态栏、导航栏跟随变化
- [x] 特殊处理、知识点包含注释
- [x] 完全支持 Dark Mode

## Screenshots

Light Mode|Dark Mode
---|---
![HomeView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_home_light.png?0301)|![HomeView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_home_dark.png?0301)
![ChatView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_chat_light.png?0517)|![ChatView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_chat_dark.png?0517)
![ContactView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_contact_light.png?0301)|![ContactView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_contact_dark.png?0301)
![DiscoverView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_discover_light.png?0301)|![DiscoverView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_discover_dark.png?0301)
![MomentView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_moment_light.png?0204)|![MomentView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_moment_dark.png?0204)
![MeView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_me_light.png?0301)|![MeView](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/Images/screenshot_me_dark.png?0301)

## TODO

- [ ] 主界面完善：可左滑删除聊天内容
- [ ] 聊天界面完善：键盘处理，文本框多行变高度，发送内容，更多媒体类型，emoji，语音等
- [ ] 朋友圈界面完善：下拉刷新，上拉加载，图片视频全屏预览，评论、点赞等
- [ ] 搜索界面

## Requirements

- iOS 13+
- Xcode 11+
- Swift 5.1+

## Contributors

Create by [森仔](https://github.com/wxxsw)

Banner Design by [@aduqin](https://dribbble.com/aduqin)

## License

SwiftUI-WeChat is released under the MIT license. [See LICENSE](https://github.com/wxxsw/SwiftUI-WeChat/blob/master/LICENSE) for details.
