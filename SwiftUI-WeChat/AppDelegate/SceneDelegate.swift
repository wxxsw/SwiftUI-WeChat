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
        
        UITableView.appearance().separatorInset = .init(top: 0, left: 72, bottom: 0, right: 0)
        UITableView.appearance().separatorColor = UIColor(named: "separator")
        
        if let windowScene = scene as? UIWindowScene {
            let rootView = RootTabView()
                .environmentObject(Root())
            
            window = UIWindow(windowScene: windowScene)
            window!.rootViewController = UIHostingController(rootView: rootView)
            window!.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}

}

