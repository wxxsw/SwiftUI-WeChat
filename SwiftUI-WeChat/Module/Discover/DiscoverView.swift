//
//  DiscoverView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct DiscoverView : View {
    
    @EnvironmentObject var tab: RootTab
    
    var body: some View {
        Text("待开发")
        .onAppear {
            self.tab.navigationTitle = Text("发现")
            self.tab.navigationTrailing = nil
        }
    }
}

#if DEBUG
struct DiscoverView_Previews : PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
#endif
