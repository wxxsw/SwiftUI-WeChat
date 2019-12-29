//
//  AppState.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/12/28.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI
import Combine

class AppState: ObservableObject {
    
    @Published var preferredStatusBarStyle: UIStatusBarStyle = .default
    
}
