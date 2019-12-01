//
//  HomeView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct HomeView : View {
    let chats: [Chat] = mock(name: "chats")
    
    var body: some View {
        List {
            Group {
                SearchEntryView()
                ForEach(chats) { chat in
                    Cell(chat: chat)
                }
            }
            .listRowInsets(EdgeInsets())
        }
        .navigationBarTitle("微信", displayMode: .inline)
        .navigationBarItems(trailing: Image(systemName: "plus.circle"))
    }
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
#endif

private struct Cell: View {
    let chat: Chat
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(chat.icon)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 48, height: 48)
                    .cornerRadius(8)

                VStack(alignment: .leading, spacing: 6) {
                    HStack(alignment: .top) {
                        Text(chat.name)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.primary)
                        Spacer()
                        Text(chat.time)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }

                    Text(chat.desc)
                        .lineLimit(1)
                        .font(.system(size: 15))
                        .foregroundColor(.secondary)
                }
            }
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
            
            Divider()
                .padding(EdgeInsets(top: 0, leading: 76, bottom: 0, trailing: 0))
            
            EmptyNavigationLink(destination: ChatView())
        }
    }
}
