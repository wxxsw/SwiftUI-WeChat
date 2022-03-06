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
        
        // 避免 iOS15 的行为导致 NavigationBar 没有背景色
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        
        // 避免 iOS15 的行为导致 TabBar 没有背景色
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        // 避免 iOS15 增加的列表顶部空白
        UITableView.appearance().sectionHeaderTopPadding = 0
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
