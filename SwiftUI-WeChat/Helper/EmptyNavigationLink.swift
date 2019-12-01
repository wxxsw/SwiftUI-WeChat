//
//  EmptyNavigationLink.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/12/1.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

// 基于普通的导航跳转，但避免了因为出现在 List 中而出现详情指示器 >
// 只要放入 Cell 中即可，放入任何位置都可以实现跳转
// 但要避免放入带有 spacing 的 Stack 中，虽然此视图不占用空间，但会多出 spacing 的空间
struct EmptyNavigationLink<Destination>: View where Destination : View {
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            EmptyView() // 不需要实际的 Label 视图，EmtpyView 即可
        }
        .frame(width: 0, height: 0) // 避免占用空间
        .opacity(0) // 不可见
    }
}
