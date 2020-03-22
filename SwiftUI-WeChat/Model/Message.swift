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
    let desc: String?
    let time: Date
    
}
