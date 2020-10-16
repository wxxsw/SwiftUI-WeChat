//
//  DiscoverView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct DiscoverHome : View {
    var body: some View {
        ZStack {
            DiscoverList()
        }
        .onAppear {
            self.root.tabNavigationHidden = false
            self.root.tabNavigationTitle = "发现"
            self.root.tabNavigationBarTrailingItems = .init(EmptyView())
        }
    }
    
    @EnvironmentObject var root: RootViewModel
}

struct DiscoverHome_Previews : PreviewProvider {
    static var previews: some View {
        DiscoverHome()
            .environmentObject(RootViewModel())
    }
}
