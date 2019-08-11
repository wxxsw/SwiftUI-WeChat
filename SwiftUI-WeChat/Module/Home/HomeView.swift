//
//  HomeView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct HomeView : View {
    
    @EnvironmentObject var tab: RootTab
    
    var body: some View {
        List {
            HomeSearchCellView()
//            NavigationLink(destination: ChatView()) {
                HomeCellView()
//            }
        }
        .onAppear {
            self.tab.navigationTitle = Text("微信")
        }
    }
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
