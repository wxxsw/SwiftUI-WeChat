//
//  ChatCell.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2020/4/19.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

struct ChatCell: View {
    let message: Message
    let isMe: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            if isMe { Spacer() } else { Avatar(icon: message.member.icon) }
            TextMessage(isMe: isMe, text: message.text ?? "")
            if isMe { Avatar(icon: message.member.icon) } else { Spacer() }
        }
        .padding(.init(top: 8, leading: 12, bottom: 8, trailing: 12))
    }
}

struct ChatCell_Previews: PreviewProvider {
    static var previews: some View {
        let messages: [Message] = mock(name: "messages")
        return ChatCell(message: messages[0], isMe: false).previewLayout(.sizeThatFits)
    }
}

private struct TextMessage: View {
    let isMe: Bool
    let text: String
    
    var body: some View {
        Text(text)
            .padding()
            .background(background)
    }
    
    private var background: some View {
        RoundedRectangle(cornerRadius: 3)
            .foregroundColor(Color("chat_\(isMe ? "me" : "friend")_background"))
    }
}

private struct Avatar: View {
    let icon: String
    
    var body: some View {
        Image(icon)
            .resizable()
            .frame(width: 40, height: 40)
    }
}
