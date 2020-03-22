//
//  Member.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/11/29.
//  Copyright © 2019 Gesen. All rights reserved.
//

import Foundation

struct Member: Codable, Identifiable {
    
    let id = UUID()
    let background: String?
    let icon: String
    let identifier: String?
    let name: String
    
}
