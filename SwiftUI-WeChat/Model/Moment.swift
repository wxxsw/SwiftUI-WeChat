//
//  Moment.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2020/1/4.
//  Copyright © 2020 Gesen. All rights reserved.
//

import Foundation

struct Moment: Codable, Identifiable {
    
    let id: String
    let author: Member
    let comments: [Comment]?
    let images: [Media]?
    let likes: [String]?
    let text: String?
    let time: String
    let video: Media?
    
}
