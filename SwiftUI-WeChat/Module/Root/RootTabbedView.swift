//
//  RootTabbedView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct RootTabbedView : View {
    
    @State private var index: Int = 0
    
    var body: some View {
        TabbedView(selection: $index) {
            ChatHomeView()
                .tabItem { RootTabbedItemView(index: $index, style: .chat) }
                .tag(0)
            ContactHomeView()
                .tabItem { RootTabbedItemView(index: $index, style: .contact) }
                .tag(1)
            DiscoverHomeView()
                .tabItem { RootTabbedItemView(index: $index, style: .discover) }
                .tag(2)
            MeHomeView()
                .tabItem { RootTabbedItemView(index: $index, style: .me) }
                .tag(3)
        }
        .accentColor(.green)
    }
}

#if DEBUG
struct RootTabbedView_Previews : PreviewProvider {
    static var previews: some View {
        RootTabbedView()
    }
}
#endif
