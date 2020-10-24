//
//  MeRow.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

struct MeRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(icon)
                
                Text(title)
                    .font(.system(size: 16))
                
                Spacer()
                
                Image("cell_detail_indicator")
            }
            .padding()
        }
        .frame(height: 54)
    }
}

struct MeRow_Previews: PreviewProvider {
    static var previews: some View {
        MeRow(icon: "me_setting", title: "设置")
    }
}
