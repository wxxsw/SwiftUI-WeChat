//
//  ContactView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct ContactView : View {
    
    @EnvironmentObject var tab: RootTab
    
    var body: some View {
        Text("待开发")
        .onAppear {
            self.tab.navigationTitle = Text("联系人")
        }
    }
}

#if DEBUG
struct ContactView_Previews : PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
#endif
