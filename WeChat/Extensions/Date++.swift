//
//  Date++.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2020/5/17.
//  Copyright © 2020 Gesen. All rights reserved.
//

import Foundation

private let yearFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy 年 M 月 d 日"
    return formatter
}()

private let timeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter
}()

extension Date {
    
    var formatString: String {
        let date = Date()
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self, to: date)
        
        if components.year! >= 1 || components.month! >= 1 || components.day! > 1 {
            return "\(yearFormatter.string(from: self)) \(timeFormatter.string(from: self))"
        } else if components.day == 1 {
            return "昨天 \(timeFormatter.string(from: self))"
        } else {
            return timeFormatter.string(from: self)
        }
    }
}
