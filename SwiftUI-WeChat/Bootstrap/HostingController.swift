//
//  HostingController.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/12/28.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI
import Combine

class HostingController<Content: View>: UIHostingController<HostingMiddle<Content>> {
    
    private var statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            if oldValue != statusBarStyle {
                setNeedsStatusBarAppearanceUpdate()
            }
        }
    }
    
    init(rootView: Content) {
        super.init(rootView: HostingMiddle(content: rootView))
        
        StatusBarStyle.Key.defaultValue.getter = { self.statusBarStyle }
        StatusBarStyle.Key.defaultValue.setter = { self.statusBarStyle = $0 }
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        statusBarStyle
    }

}

struct HostingMiddle<Content: View>: View {
    let content: Content
    
    var body: some View {
        content
            // 预留设置全局 modifier 的位置
    }
}
