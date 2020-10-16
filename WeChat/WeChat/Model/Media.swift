//
//  Media.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2020/1/4.
//  Copyright © 2020 Gesen. All rights reserved.
//

import Foundation

struct Media: Codable, Identifiable {
    var id: UUID { UUID() }
    let cover: String?
    let width: Double?
    let height: Double?
    let url: String
}
