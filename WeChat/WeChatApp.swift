//
//  WeChatApp.swift
//  WeChat
//
//  Created by Gesen on 2020/9/26.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

@main
struct WeChatApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .onAppear(perform: setupAppearance)
                .onAppear(perform: setupStatusBarStyle)
        }
    }
    
    func setupAppearance() {
        let backImage = UIImage(named: "back")?
                .withPadding(.init(top: -2, left: 0, bottom: 0, right: -4))
        
        // 统一导航栏样式
        UINavigationBar.appearance().backIndicatorImage = backImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backImage
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor(named: "navigation_tint")
        UINavigationBar.appearance().barTintColor = UIColor(named: "navigation_bar_tint")
    }
    
    func setupStatusBarStyle() {
        guard
            let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first,
            let statusBarManager = window.windowScene?.statusBarManager
            else { return }
        
        StatusBarStyle.Key.defaultValue.getter = {
            statusBarManager.statusBarStyle
        }
        StatusBarStyle.Key.defaultValue.setter = {
            /// 暂时还没有找到更好的方法
            UIApplication.shared.statusBarStyle = $0
        }
    }
}
