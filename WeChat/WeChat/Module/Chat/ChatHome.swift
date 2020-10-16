//
//  HomeView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct ChatHome: View {
    @State var chats: [Chat] = Chat.all
    
    var body: some View {
        ZStack {
            VStack {
                Color("light_gray").frame(height: 300) // 下拉时露出的灰色背景
                Spacer() // 避免到底部上拉出现背景
            }
            
            ChatList(chats: chats)
        }
        .onAppear {
            self.root.tabNavigationHidden = false
            self.root.tabNavigationTitle = "微信"
            self.root.tabNavigationBarTrailingItems = .init(Image(systemName: "plus.circle"))
        }
    }
    
    @EnvironmentObject var root: RootViewModel
}

struct ChatHome_Previews : PreviewProvider {
    static var previews: some View {
        ChatHome()
            .environmentObject(RootViewModel())
    }
}
