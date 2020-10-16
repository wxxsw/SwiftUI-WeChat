//
//  ChatList.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

struct ChatList: View {
    let chats: [Chat]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                SearchEntry()
                ForEach(chats) { chat in
                    NavigationLink(destination: ChatView(chat: chat)) {
                        ChatRow(chat: chat)
                    }
                    Separator().padding(.leading, 76)
                }
            }
        }
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList(chats: Chat.all)
    }
}
