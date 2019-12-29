//
//  HostingController.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/12/28.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

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

extension View {
    
    func statusBar(style: UIStatusBarStyle) -> Self {
        self
        .modifier(StatusBarStyleModifier())
    }
    
}

class HostingController<Content: View>: UIHostingController<Content> {
    
    @EnvironmentObject var appState: AppState

    override var preferredStatusBarStyle: UIStatusBarStyle {
        appState.preferredStatusBarStyle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
