//
//  RootViewModel.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/12/29.
//  Copyright © 2019 Gesen. All rights reserved.
//

import Combine
import SwiftUI

class RootViewModel: ObservableObject {
    
    /// 标签栏选中的索引
    @Published var tabSelection: Int = 0
    
    /// 标签栏界面导航是否隐藏
    @Published var tabNavigationHidden: Bool = false
    
    /// 标签栏界面导航标题
    @Published var tabNavigationTitle: LocalizedStringKey = ""
    
    /// 标签栏界面导航右侧按钮
    @Published var tabNavigationBarTrailingItems: AnyView = .init(EmptyView())
    
}
