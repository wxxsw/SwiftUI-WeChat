//
//  StatusBarStyleModifier.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/12/29.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

extension View {
    
    func statusBar(style: UIStatusBarStyle) -> ModifiedContent<Self, StatusBarStyleModifier> {
        modifier(StatusBarStyleModifier(style: style))
    }
}

struct StatusBarStyleModifier: ViewModifier {
    let style: UIStatusBarStyle

    func body(content: Content) -> some View {
        var recoveryStyle: UIStatusBarStyle?
        
        return content
            .onAppear {
                recoveryStyle = self.appState.preferredStatusBarStyle
                self.appState.preferredStatusBarStyle = self.style
            }
            .onDisappear {
                self.appState.preferredStatusBarStyle = recoveryStyle ?? .default
            }
    }
    
    @EnvironmentObject var appState: AppState
}
