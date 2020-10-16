//
//  Member.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/11/29.
//  Copyright © 2019 Gesen. All rights reserved.
//

import Foundation

struct Member: Codable {
    let background: String?
    let icon: String
    let identifier: String?
    let name: String
}

extension Member: Identifiable {
    var id: UUID { UUID() }
}

extension Member {
    static let swiftui = Member(
        background: nil,
        icon: "data_avatar1",
        identifier: nil,
        name: "SwiftUI"
    )
    
    static let goddess = Member(
        background: nil,
        icon: "data_avatar2",
        identifier: nil,
        name: "女神"
    )
    
    static let pm = Member(
        background: nil,
        icon: "data_avatar3",
        identifier: nil,
        name: "产品经理"
    )
    
    static let landlord = Member(
        background: nil,
        icon: "data_avatar4",
        identifier: nil,
        name: "房东"
    )
    
    static let wang = Member(
        background: nil,
        icon: "data_avatar5",
        identifier: nil,
        name: "王同学"
    )
    
    static let princess = Member(
        background: nil,
        icon: "data_avatar6",
        identifier: nil,
        name: "公主"
    )
    
    static let foodie = Member(
        background: nil,
        icon: "data_avatar7",
        identifier: nil,
        name: "吃货"
    )
    
    static let nameless = Member(
        background: nil,
        icon: "data_avatar8",
        identifier: nil,
        name: "无名"
    )
    
    static let chives = Member(
        background: nil,
        icon: "data_avatar9",
        identifier: nil,
        name: "中国好韭菜"
    )
    
    static let me = Member(
        background: "data_moment_background",
        icon: "data_avatar10",
        identifier: "sen_baby",
        name: "森仔"
    )
}
