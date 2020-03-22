//
//  Comment.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2020/1/4.
//  Copyright © 2020 Gesen. All rights reserved.
//

import Foundation

struct Comment: Codable, Identifiable {
    
    let id = UUID()
    let name: String
    let content: String
    
}
