//
//  RootTabView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct RootTabView : View {
    
    @EnvironmentObject var tab: RootTab
    
    @State private var index: Int = 0
    
    var body: some View {
        TabView(selection: $index) {
            HomeView()
                .tabItem { RootTabItemView(index: $index, style: .chat) }
                .tag(0)
            ContactView()
                .tabItem { RootTabItemView(index: $index, style: .contact) }
                .tag(1)
            DiscoverView()
                .tabItem { RootTabItemView(index: $index, style: .discover) }
                .tag(2)
            MeView()
                .tabItem { RootTabItemView(index: $index, style: .me) }
                .tag(3)
        }
        .accentColor(.green)
        .navigationBarTitle(tab.navigationTitle, displayMode: .inline)
        .navigationBarItems(trailing: tab.navigationTrailing)
    }
}

#if DEBUG
struct RootTabView_Previews : PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
#endif
