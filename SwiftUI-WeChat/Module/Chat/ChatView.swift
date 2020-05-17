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
                Separator(color: Color("navigation_separator"))
                
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
                
                Send(proxy: proxy)
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

private struct Send: View {
    let proxy: GeometryProxy
    
    @State var text: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            Separator(color: Color("chat_send_line"))
            
            ZStack {
                Color("chat_send_background")
                
                VStack {
                    HStack(spacing: 12) {
                        Image("chat_send_voice")
                        
                        TextField("", text: $text)
                            .frame(height: 40)
                            .background(Color("chat_send_text_background"))
                            .cornerRadius(4)
                        
                        Image("chat_send_emoji")
                        Image("chat_send_more")
                    }
                    .frame(height: 56)
                    .padding(.horizontal, 12)
                    
                    Spacer()
                }
            }
            .frame(height: proxy.safeAreaInsets.bottom + 56)
        }
    }
}
