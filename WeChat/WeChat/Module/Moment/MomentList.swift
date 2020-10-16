//
//  MomentList.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

struct MomentList: View {
    let moments: [Moment]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                Header()
                    // 将 Header 的底部坐标变化传递给上层，用于导航栏变化
                    .anchorPreference(key: MomentHome.NavigationKey.self, value: .bottom) { [$0] }
                
                ForEach(self.moments) { moment in
                    VStack(spacing: 0) {
                        MomentRow(moment: moment)
                        Separator()
                    }
                }
            }
        }
    }
    
    struct Header: View {
        let member: Member = .me
        
        var body: some View {
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 0) {
                    Image(member.background ?? "")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 20)
                }
                
                HStack(spacing: 20) {
                    Text(member.name)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                        .shadow(radius: 2)
                        .alignmentGuide(VerticalAlignment.center) { d in 20 }
                    
                    Image(member.icon)
                        .resizable()
                        .cornerRadius(6)
                        .frame(width: 70, height: 70)
                        .padding(.trailing, 12)
                }
            }
        }
    }
}

struct MomentList_Previews: PreviewProvider {
    static var previews: some View {
        MomentList(moments: Moment.all)
    }
}
