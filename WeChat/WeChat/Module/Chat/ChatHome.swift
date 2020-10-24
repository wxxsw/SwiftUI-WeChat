//
//  HomeView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct ChatHome: View {
    @State var chats: [Chat] = []
    
    var body: some View {
        ZStack {
            VStack {
                Color("light_gray").frame(height: 300) // 下拉时露出的灰色背景
                Spacer() // 避免到底部上拉出现背景
            }
            
            ChatList(chats: chats)
        }
        .onAppear { if self.chats.isEmpty { self.chats = Chat.all } }
    }
}

struct ChatHome_Previews : PreviewProvider {
    static var previews: some View {
        ChatHome()
    }
}
