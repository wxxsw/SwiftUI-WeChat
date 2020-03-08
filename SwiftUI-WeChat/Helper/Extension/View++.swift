//
//  View++.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2020/3/8.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

extension View {
    
    /// 基于 NavigationLink 跳转，但避免了因为出现在 List 中而出现详情指示器 `>`
    /// ，在 Cell 中调用即可实现跳转
    /// - Parameter destination: 要跳转的界面
    func navigationLink<Destination: View>(destination: Destination) -> some View {
        background(
            NavigationLink(destination: destination) {
                EmptyView() // 不需要实际的 Label 视图，EmtpyView 即可
            }
            .frame(width: 0, height: 0) // 避免占用空间
            .opacity(0) // 不可见
        )
    }
    
}
