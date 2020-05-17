//
//  SceneDelegate.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/14.
//  Copyright © 2019 Gesen. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        configureAppearance()
        configureWindow(windowScene: windowScene)
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}

}

private extension SceneDelegate {
    
    func configureAppearance() {
        
        let backImage = UIImage(named: "back")?
            .withPadding(.init(top: -2, left: 0, bottom: 0, right: -4))
        
        // 统一列表样式，因无法控制列表分割线及背景色，所以先去掉，全部由自己控制
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
        
        // 统一导航栏样式
        UINavigationBar.appearance().backIndicatorImage = backImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backImage
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor(named: "navigation_tint")
        UINavigationBar.appearance().barTintColor = UIColor(named: "navigation_bar_tint")
    }
    
    func configureWindow(windowScene: UIWindowScene) {
        let rootView = RootView()
        
        window = UIWindow(windowScene: windowScene)
        window!.rootViewController = HostingController(rootView: rootView)
        window!.makeKeyAndVisible()
    }
}
