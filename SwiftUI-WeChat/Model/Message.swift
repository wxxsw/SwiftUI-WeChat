//
//  Message.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/11/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import Foundation

struct Message: Codable {
    
    let id = UUID()
    let createdAt: Date
    let image: Media?
    let member: Member
    let text: String?
    let type: MessageType
    let voice: String?
    let video: Media?
    
}

extension Message {
    
    enum MessageType: String, Codable {
        case text
        case image
        case voice
        case video
    }
}
