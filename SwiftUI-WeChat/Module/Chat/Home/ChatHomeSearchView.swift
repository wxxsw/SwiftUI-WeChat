//
//  ChatHomeSearchView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct ChatHomeSearchView : View {
    var body: some View {
        PresentationLink(destination: ChatSearchView()) {
            Spacer()
            HStack(alignment: .bottom, spacing: 2) {
                Spacer()
                Image("chat_home_search_icon")
                Text("搜索")
                    .font(.system(size: 16))
                Spacer()
            }
            .foregroundColor(Color(hex: 0x8F8F93))
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(6)
    }
}

#if DEBUG
struct ChatHomeSearchView_Previews : PreviewProvider {
    static var previews: some View {
        ChatHomeSearchView()
            .previewLayout(.fixed(width: 375, height: 56))
    }
}
#endif
