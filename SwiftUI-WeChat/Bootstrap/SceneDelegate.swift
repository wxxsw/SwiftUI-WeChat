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
        
        UITableView.appearance().separatorStyle = .none
        
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

