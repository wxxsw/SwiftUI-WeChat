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
        ScrollView {
            VStack(spacing: 0) {
                HomeSearchCellView()
                Separator(inset: .zero)
                HomeCellView()
                Separator()
                HomeCellView()
            }
        }
        .onAppear {
            self.tab.navigationTitle = Text("微信")
            self.tab.navigationTrailing = AnyView(Image(systemName: "plus.circle"))
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
