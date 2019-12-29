//
//  DiscoverView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct DiscoverView : View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Group {
                    NavigationLink(destination: MomentView()) {
                        Cell(icon: "discover_moment", title: "朋友圈")
                    }
                    Line()
                }
                Group {
                    Cell(icon: "discover_qrcode", title: "扫一扫")
                    Divider().padding(.leading, 52)
                    Cell(icon: "discover_shake", title: "摇一摇")
                    Line()
                }
                Group {
                    Cell(icon: "discover_see", title: "看一看")
                    Divider().padding(.leading, 52)
                    Cell(icon: "discover_search", title: "搜一搜")
                    Line()
                }
                Group {
                    Cell(icon: "discover_nearby", title: "附近的人")
                    Line()
                }
                Group {
                    Cell(icon: "discover_shop", title: "购物")
                    Divider().padding(.leading, 52)
                    Cell(icon: "discover_game", title: "游戏")
                    Line()
                }
                Group {
                    Cell(icon: "discover_miniprogram", title: "小程序")
                    Line()
                }
            }
            .background(Color("cell"))
        }
        .background(Color("light_gray"))
        .onAppear {
            self.root.tabNavigationHidden = false
            self.root.tabNavigationTitle = "发现"
            self.root.tabNavigationBarTrailingItems = .init(EmptyView())
        }
    }
    
    @EnvironmentObject var root: RootViewModel
}

#if DEBUG
struct DiscoverView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView { DiscoverView() }
    }
}
#endif

private struct Cell: View {
    let icon: String
    let title: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(icon)
                    .renderingMode(.original)
                
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image("cell_detail_indicator")
                    .renderingMode(.original)
            }
            .padding()
        }
        .frame(height: 54)
    }
}

private struct Line: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color("light_gray"))
            .frame(height: 8)
    }
}
