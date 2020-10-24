//
//  DiscoverList.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

struct DiscoverList: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Group {
                    NavigationLink(destination: MomentHome()) {
                        DiscoverRow(icon: "discover_moment", title: "朋友圈")
                    }
                    Line()
                }
                Group {
                    DiscoverRow(icon: "discover_qrcode", title: "扫一扫")
                    Separator().padding(.leading, 52)
                    DiscoverRow(icon: "discover_shake", title: "摇一摇")
                    Line()
                }
                Group {
                    DiscoverRow(icon: "discover_see", title: "看一看")
                    Separator().padding(.leading, 52)
                    DiscoverRow(icon: "discover_search", title: "搜一搜")
                    Line()
                }
                Group {
                    DiscoverRow(icon: "discover_nearby", title: "附近的人")
                    Line()
                }
                Group {
                    DiscoverRow(icon: "discover_shop", title: "购物")
                    Separator().padding(.leading, 52)
                    DiscoverRow(icon: "discover_game", title: "游戏")
                    Line()
                }
                Group {
                    DiscoverRow(icon: "discover_miniprogram", title: "小程序")
                    Line()
                }
            }
            .background(Color("cell"))
        }
        .background(Color("light_gray"))
    }
    
    struct Line: View {
        var body: some View {
            Rectangle()
                .foregroundColor(Color("light_gray"))
                .frame(height: 8)
        }
    }
}

struct DiscoverList_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverList()
    }
}
