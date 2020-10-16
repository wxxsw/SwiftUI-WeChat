//
//  Message.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/11/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import Foundation

struct Message: Codable {
    let createdAt: Double?
    let image: Media?
    let member: Member
    let text: String?
    let type: MessageType
    let voice: String?
    let video: Media?
    
    enum MessageType: String, Codable {
        case text
        case image
        case voice
        case video
    }
}

extension Message: Identifiable {
    var id: UUID { UUID() }
}

extension Message {
    static let all: [Message] = [
        Message(
            createdAt: 1559535000,
            image: nil,
            member: .swiftui,
            text: "编写更少的代码，打造更出色的 app",
            type: .text,
            voice: nil,
            video: nil
        ),
        Message(
            createdAt: 1559550000,
            image: nil,
            member: .swiftui,
            text: "SwiftUI 是一种创新、简洁的编程方式，通过 Swift 的强大功能，在所有 Apple 平台上构建用户界面。借助它，您只需一套工具和 API，即可创建面向任何 Apple 设备的用户界面。",
            type: .text,
            voice: nil,
            video: nil
        ),
        Message(
            createdAt: nil,
            image: nil,
            member: .swiftui,
            text: "采用简单易懂、编写方式自然的声明式 Swift 语法，可无缝支持新的 Xcode 设计工具，让您的代码与设计保持高度同步。",
            type: .text,
            voice: nil,
            video: nil
        ),
        Message(
            createdAt: nil,
            image: nil,
            member: .swiftui,
            text: "原生支持“动态字体”、“深色模式”、本地化和辅助功能——第一行您写出的 SwiftUI 代码，就已经是您编写过的、功能最强大的 UI 代码。",
            type: .text,
            voice: nil,
            video: nil
        ),
        Message(
            createdAt: 1559550000,
            image: nil,
            member: .swiftui,
            text: "采用声明式语法，您只需声明用户界面应具备的功能即可。例如，您可以写明您需要一个由文本栏组成的项目列表，然后描述各个栏位的对齐方式、字体和颜色。您的代码比以往更加简单直观和易于理解，可以节省您的时间和维护工作。",
            type: .text,
            voice: nil,
            video: nil
        ),
        Message(
            createdAt: nil,
            image: nil,
            member: .swiftui,
            text: "这种声明式风格甚至适用于动画等复杂的概念。只需几行代码，就能轻松地向几乎任何控件添加动画并选择一系列即时可用的特效。在运行时，系统会处理所有必要的步骤和中断因素，来保证您的代码流畅运行、保持稳定。实现动画效果是如此简单，您还能探索新的方式让 app 更生动出彩。",
            type: .text,
            voice: nil,
            video: nil
        ),
        Message(
            createdAt: 1559555000,
            image: nil,
            member: .swiftui,
            text: "数十年来，我们打造出世界上最具新意、最为直观的用户界面，SwiftUI 便是在这一经验基础上构建而成。Apple 生态系统中为用户所钟爱的一切，例如控件和平台专有体验等，都能美轮美奂地呈现在您的代码中。SwiftUI 是真正原生的，只需少量的代码和直观的设计画布，就能让您的 app 直接利用各个平台上经过验证的技术。",
            type: .text,
            voice: nil,
            video: nil
        ),
        Message(
            createdAt: 1559560000,
            image: nil,
            member: .me,
            text: "🤩 啥也别说了，我这就去学！",
            type: .text,
            voice: nil,
            video: nil
        ),
    ]
}
