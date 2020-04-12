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
        Text("待开发")
            .navigationBarTitle("聊天", displayMode: .inline)
            .onAppear { print(self.messages) }
    }
}

#if DEBUG
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
#endif

