//
//  ChatHomeSearchView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct ChatHomeSearchView : View {
    @State var isSearchPresented = false
    
    var body: some View {
        Button(action: { self.isSearchPresented.toggle() }) {
            VStack {
                Spacer()
                HStack(spacing: 4) {
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 13, height: 13)
                    Text("搜索")
                        .font(.system(size: 16))
                    Spacer()
                }
                .foregroundColor(Color(hex: 0x8F8F93))
                Spacer()
            }
        }
        .background(Color.white)
        .cornerRadius(6)
        .listRowBackground(Color("background"))
        .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        .sheet(isPresented: $isSearchPresented, content: { ChatSearchView() })
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
