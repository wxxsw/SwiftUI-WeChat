//
//  ChatView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/8/11.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    let messages: [Message] = mock(name: "messages")
    let me: Member = mock(name: "me")
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                List {
                    Group {
                        ForEach(self.messages) { message in
                            ChatCell(
                                message: message,
                                isMe: message.member.identifier == self.me.identifier
                            )
                        }
                    }
                    .listRowBackground(Color("light_gray"))
                    .listRowInsets(.zero)
                }
                
                VStack(spacing: 0) {
                    Color("chat_send_line")
                        .frame(height: 1)
                    Color("chat_send_background")
                        .frame(height: proxy.safeAreaInsets.bottom + 56)
                }
            }
        }
        .background(Color("light_gray"))
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle("SwiftUI", displayMode: .inline)
    }
}

#if DEBUG
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
#endif
