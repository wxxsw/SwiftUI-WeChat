//
//  Contact.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/11/29.
//  Copyright © 2019 Gesen. All rights reserved.
//

import Foundation

struct Contact: Codable, Identifiable {
    
    let id: String
    let members: [Member]
    
}
