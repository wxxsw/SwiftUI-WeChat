//
//  ContactHomeView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct ContactHomeView : View {
    var body: some View {
        NavigationLink(destination: ContactHomeView()) {
            Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#if DEBUG
struct ContactHomeView_Previews : PreviewProvider {
    static var previews: some View {
        ContactHomeView()
    }
}
#endif
