//
//  ChatRow.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

struct ChatRow: View {
    let chat: Chat
    
    var body: some View {
        HStack(spacing: 12) {
            Image(chat.sender.icon)
                .renderingMode(.original)
                .resizable()
                .frame(width: 48, height: 48)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: .top) {
                    Text(chat.sender.name)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.primary)
                    Spacer()
                    Text(chat.time)
                        .font(.system(size: 10))
                        .foregroundColor(.secondary)
                }

                Text(chat.desc)
                    .lineLimit(1)
                    .font(.system(size: 15))
                    .foregroundColor(.secondary)
            }
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chat: .swiftui)
    }
}
