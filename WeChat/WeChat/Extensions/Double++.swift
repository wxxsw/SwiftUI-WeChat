//
//  Double++.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import Foundation

extension Double {
    var date: Date {
        Date(timeIntervalSince1970: self)
    }
}
