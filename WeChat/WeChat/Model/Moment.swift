//
//  Moment.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2020/1/4.
//  Copyright © 2020 Gesen. All rights reserved.
//

import Foundation

struct Moment: Codable, Identifiable {
    var id: UUID { UUID() }
    let author: Member
    let comments: [Comment]?
    let images: [Media]?
    let likes: [String]?
    let text: String?
    let time: String
    let video: Media?
    
    struct Comment: Codable, Identifiable {
        var id: UUID { UUID() }
        let name: String
        let content: String
    }
}

extension Moment {
    static let all: [Moment] = [
        Moment(
            author: .swiftui,
            comments: [
                Comment(
                    name: "Combine",
                    content: "我们是最佳拍档！😁"
                ),
                Comment(
                    name: "Flutter",
                    content: "毫无疑问，声明式 UI 是大势所趋。而且... 我认为跨平台也是😏"
                ),
            ],
            images: [
                Media(
                    cover: nil,
                    width: 2314,
                    height: 1218,
                    url: "data_moment_1_1"
                ),
                Media(
                    cover: nil,
                    width: 1200,
                    height: 704,
                    url: "data_moment_1_2"
                ),
                Media(
                    cover: nil,
                    width: 1600,
                    height: 900,
                    url: "data_moment_1_3"
                ),
                Media(
                    cover: nil,
                    width: 1430,
                    height: 799,
                    url: "data_moment_1_4"
                ),
                Media(
                    cover: nil,
                    width: 1400,
                    height: 1400,
                    url: "data_moment_1_5"
                ),
                Media(
                    cover: nil,
                    width: 1960,
                    height: 1166,
                    url: "data_moment_1_6"
                ),
                Media(
                    cover: nil,
                    width: 2000,
                    height: 1333,
                    url: "data_moment_1_7"
                ),
                Media(
                    cover: nil,
                    width: 1764,
                    height: 887,
                    url: "data_moment_1_8"
                ),
                Media(
                    cover: nil,
                    width: 1300,
                    height: 867,
                    url: "data_moment_1_9"
                ),
            ],
            likes: [
                "Swift",
                "Combine",
                "Android",
                "Flutter",
                "UIKit",
                "RxSwift",
                "ReactNative"
            ],
            text: "SwiftUI is a modern way to declare user interfaces for any Apple platform. Create beautiful, dynamic apps faster than ever before.",
            time: "11 分钟前",
            video: nil
        ),
        Moment(
            author: .goddess,
            comments: [
                Comment(
                    name: "追求者",
                    content: "最美的不是下雨天，是曾与你躲过雨的屋檐"
                )
            ],
            images: [
                Media(
                    cover: nil,
                    width: 2843,
                    height: 3554,
                    url: "data_moment_2_1"
                )
            ],
            likes: [
                "小张",
                "小王",
                "小巫"
            ],
            text: "雨过天晴☀️还是很美的😊",
            time: "1 小时前",
            video: nil
        ),
        Moment(
            author: .pm,
            comments: nil,
            images: [
                Media(
                    cover: nil,
                    width: 1500,
                    height: 1000,
                    url: "data_moment_3_1"
                )
            ],
            likes: nil,
            text: "AppStore！赐我一些灵感吧！",
            time: "6 小时前",
            video: nil
        ),
        Moment(
            author: .foodie,
            comments: nil,
            images: [
                Media(
                    cover: nil,
                    width: 1000,
                    height: 1500,
                    url: "data_moment_4_1"
                ),
                Media(
                    cover: nil,
                    width: 1500,
                    height: 1000,
                    url: "data_moment_4_2"
                ),
                Media(
                    cover: nil,
                    width: 1000,
                    height: 1293,
                    url: "data_moment_4_3"
                ),
                Media(
                    cover: nil,
                    width: 1000,
                    height: 1418,
                    url: "data_moment_4_4"
                ),
            ],
            likes: nil,
            text: "精致的生活，从精致的每一餐开始！看到这些美食，你难道不会流口水吗？",
            time: "昨天",
            video: nil
        ),
        Moment(
            author: .me,
            comments: nil,
            images: nil,
            likes: nil,
            text: "这是一个大雄兔在线视频，全长一分钟",
            time: "3 天前",
            video: Media(
                cover: "data_moment_10_1",
                width: 2346,
                height: 1290,
                url: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
            )
        ),
    ]
}
