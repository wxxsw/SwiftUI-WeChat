//
//  DiscoverView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct DiscoverView : View {
    var body: some View {
        Text("待开发")
            .navigationBarTitle(Text("发现"), displayMode: .inline)
    }
}

#if DEBUG
struct DiscoverView_Previews : PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
#endif
