//
//  Chat.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/8/4.
//  Copyright © 2019 Gesen. All rights reserved.
//

import Foundation

struct Chat: Codable, Identifiable {
    var id = UUID()
    let desc: String
    let sender: Member
    let time: String
}

extension Chat {
    static let all: [Chat] = [
        swiftui,
        goddess,
        pm,
        landlord,
        wang,
        princess,
        foodie,
        nameless,
        chives,
        me,
    ]
    
    static let swiftui = Chat(
        desc: "SwiftUI is a modern way to declare user interfaces for any Apple platform. Create beautiful, dynamic apps faster than ever before.",
        sender: .swiftui,
        time: "18:14"
    )
    
    static let goddess = Chat(
        desc: "你在干嘛？怎么不说话🥺",
        sender: .goddess,
        time: "18:05"
    )
    
    static let pm = Chat(
        desc: "今天开会提到的需求，下班之前弄完！",
        sender: .pm,
        time: "18:01"
    )
    
    static let landlord = Chat(
        desc: "兄弟，下个月的房租该交了",
        sender: .landlord,
        time: "16:23"
    )
    
    static let wang = Chat(
        desc: "看到了",
        sender: .wang,
        time: "昨天"
    )
    
    static let princess = Chat(
        desc: "[视频通话]",
        sender: .princess,
        time: "星期二"
    )
    
    static let foodie = Chat(
        desc: "晚上去撸串不？",
        sender: .foodie,
        time: "2019/11/12"
    )
    
    static let nameless = Chat(
        desc: "[视频]",
        sender: .nameless,
        time: "2019/10/28"
    )
    
    static let chives = Chat(
        desc: "在吗？",
        sender: .chives,
        time: "2019/08/03"
    )
    
    static let me = Chat(
        desc: "SwiftUI 写起来爽么？",
        sender: .me,
        time: "2019/07/14"
    )
}
