//
//  ChatHomeCellView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/8/4.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct ChatHomeCellView: View {
    var body: some View {
        HStack {
            NavigationLink(destination: ContactHomeView()) {
                Text("a")
            }
        }
    }
}

#if DEBUG
struct ChatHomeCellView_Previews: PreviewProvider {
    static var previews: some View {
        ChatHomeCellView()
    }
}
#endif
