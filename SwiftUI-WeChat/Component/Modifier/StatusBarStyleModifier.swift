//
//  StatusBarStyleModifier.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/12/29.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

extension View {
    
    /// 控制状态栏样式
    func statusBar(style: UIStatusBarStyle) -> ModifiedContent<Self, StatusBarStyleModifier> {
        modifier(StatusBarStyleModifier(style: style))
    }
}

struct StatusBarStyleModifier: ViewModifier {
    let style: UIStatusBarStyle

    func body(content: Content) -> some View {
        if self.style != self.appState.preferredStatusBarStyle {
            self.appState.preferredStatusBarStyle = self.style
        }
        
        return content
            .onDisappear { self.appState.preferredStatusBarStyle = .default }
    }
    
    @EnvironmentObject var appState: AppState
}
