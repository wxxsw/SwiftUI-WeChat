//
//  Separator.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/8/18.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct Separator: View {
    
    @State var inset = EdgeInsets(top: 0, leading: 72, bottom: 0, trailing: 0)
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color("separator"))
            .frame(height: 0.5)
            .padding(inset)
    }
}

#if DEBUG
struct Separator_Previews: PreviewProvider {
    static var previews: some View {
        Separator()
    }
}
#endif
