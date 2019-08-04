//
//  RootNavigationView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct RootNavigationView : View {
    var body: some View {
//        NavigationView {
            RootTabbedView()
//        }
    }
}

#if DEBUG
struct RootNavigationView_Previews : PreviewProvider {
    static var previews: some View {
        RootNavigationView()
    }
}
#endif
