//
//  MeView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct MeView : View {
    var body: some View {
        Text("待开发")
            .navigationBarTitle(Text("我的"), displayMode: .inline)
    }
}

#if DEBUG
struct MeView_Previews : PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
#endif
