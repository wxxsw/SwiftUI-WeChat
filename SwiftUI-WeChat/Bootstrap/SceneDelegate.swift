//
//  SceneDelegate.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/14.
//  Copyright © 2019 Gesen. All rights reserved.
//

import UIKit
import SwiftUI
import Extension

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // 因无法控制列表分割线，所以先去掉，全部由自己控制
        UITableView.appearance().separatorStyle = .none
        
        // 统一导航栏样式
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().barTintColor = UIColor(named: "light_gray")
        
        if let windowScene = scene as? UIWindowScene {
            let rootView = RootTabView()
                .environmentObject(AppState())
            
            window = UIWindow(windowScene: windowScene)
            window!.rootViewController = HostingController(rootView: rootView)
            window!.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}

}

