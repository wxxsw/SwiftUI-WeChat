//
//  Chat.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/8/4.
//  Copyright © 2019 Gesen. All rights reserved.
//

import Foundation

struct Chat: Codable, Identifiable {
    
    let id = UUID()
    let icon: String
    let name: String
    let desc: String
    let time: String
    
}
