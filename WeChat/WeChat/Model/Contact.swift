//
//  Contact.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/11/29.
//  Copyright © 2019 Gesen. All rights reserved.
//

import Foundation

struct Contact: Codable, Identifiable {
    var id: UUID { UUID() }
    let letter: String
    let members: [Member]
}

extension Contact {
    static let all: [Contact] = [
        c, f, g, n, s, w, z
    ]
    
    static let c = Contact(
        letter: "C",
        members: [.pm, .foodie]
    )
    
    static let f = Contact(
        letter: "F",
        members: [.landlord]
    )
    
    static let g = Contact(
        letter: "G",
        members: [.princess]
    )
    
    static let n = Contact(
        letter: "N",
        members: [.goddess]
    )
    
    static let s = Contact(
        letter: "S",
        members: [.swiftui, .me]
    )
    
    static let w = Contact(
        letter: "W",
        members: [.wang, .nameless]
    )
    
    static let z = Contact(
        letter: "Z",
        members: [.chives]
    )
}
