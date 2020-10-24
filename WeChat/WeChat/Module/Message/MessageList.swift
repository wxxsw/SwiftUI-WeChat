//
//  MessageList.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

struct MessageList: View {
    let messages: [Message]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(messages) { message in
                    if message.createdAt != nil {
                        Time(date: message.createdAt!.date)
                    }
                    
                    MessageRow(
                        message: message,
                        isMe: message.member.identifier == Member.me.identifier
                    )
                }
            }
            .background(Color("light_gray"))
        }
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
        MessageList(messages: Message.all)
    }
}
