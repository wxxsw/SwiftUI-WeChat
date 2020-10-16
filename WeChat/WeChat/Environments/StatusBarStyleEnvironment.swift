//
//  StatusBarStyleEnvironment.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2020/3/8.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    
    var statusBarStyle: StatusBarStyle { self[StatusBarStyle.Key.self] }
}

class StatusBarStyle {
    
    var getter: () -> UIStatusBarStyle = { .default }
    var setter: (UIStatusBarStyle) -> Void = { _ in }

    var current: UIStatusBarStyle {
        get { self.getter() }
        set { self.setter(newValue) }
    }
}

extension StatusBarStyle {
    
    struct Key: EnvironmentKey {
        static let defaultValue: StatusBarStyle = StatusBarStyle()
    }
}

