//
//  MeHome.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct MeHome : View {
    var body: some View {
        ZStack {
            VStack {
                Color("cell").frame(height: 300) // 下拉时露出的白色背景
                Color("light_gray") // 其余区域是灰色背景
            }
            
            MeList()
        }
    }
}

struct MeHome_Previews : PreviewProvider {
    static var previews: some View {
        MeHome()
    }
}
