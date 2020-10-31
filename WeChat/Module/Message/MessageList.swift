//
//  MessageList.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import Combine
import SwiftUI

struct MessageList: View {
    @State private var messages: [Message] = []
    
    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                LazyVStack(spacing: 0) {
                    ForEach(messages) { message in
                        if message.createdAt != nil {
                            Time(date: message.createdAt!.date)
                        }
                        
                        MessageRow(
                            message: message,
                            isMe: message.member.identifier == Member.me.identifier
                        )
                        .id(message.id)
                    }
                }
                .background(Color("light_gray"))
                .onChange(of: messages) { messages in
                    if let lastId = messages.last?.id {
                        proxy.scrollTo(lastId) // 消息变化时跳到最后一条消息
                    }
                }
            }
        }
        .onAppear(perform: load)
    }
    
    func load() {
        guard messages.isEmpty else { return }
        messages = Message.all
    }
    
    struct Time: View {
        let date: Date
        
        var body: some View {
            Text(date.formatString)
                .foregroundColor(Color("chat_time"))
                .font(.system(size: 14, weight: .medium))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 4)
        }
    }
}

struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        MessageList()
    }
}
