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
        HStack(spacing: 12) {
            Image("avatar")
                .resizable()
                .frame(width: 48, height: 48)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 6) {
                HStack(alignment: .top) {
                    Text("森仔")
                        .font(.system(size: 18, weight: .bold))
                    
                    Spacer()
                    
                    Text("16:00")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                    
                Text("[视频]")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
        }
        .listRowBackground(Color("background"))
        .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
    }
}

#if DEBUG
struct ChatHomeCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ChatHomeCellView()
        }
    }
}
#endif
