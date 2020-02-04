//
//  MeView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct MeView : View {
    let me: Member = mock(name: "me")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Group {
                    Header(member: me)
                    Line()
                }
                Group {
                    Cell(icon: "me_pay", title: "支付")
                    Line()
                }
                Group {
                    Cell(icon: "me_favorite", title: "收藏")
                    Separator().padding(.leading, 52)
                    Cell(icon: "me_photo_album", title: "相册")
                    Separator().padding(.leading, 52)
                    Cell(icon: "me_bank_card", title: "卡包")
                    Separator().padding(.leading, 52)
                    Cell(icon: "me_emoji", title: "表情")
                    Line()
                }
                Group {
                    Cell(icon: "me_setting", title: "设置")
                    Line()
                }
            }
            .background(Color("cell"))
        }
        .background(Color("light_gray"))
        .onAppear {
            self.root.tabNavigationHidden = true
            self.root.tabNavigationTitle = ""
            self.root.tabNavigationBarTrailingItems = .init(EmptyView())
        }
    }
    
    @EnvironmentObject var root: RootViewModel
}

#if DEBUG
struct MeView_Previews : PreviewProvider {
    static var previews: some View {
        MeView()
            .environmentObject(RootViewModel())
    }
}
#endif

private struct Header: View {
    let member: Member
    
    var body: some View {
        VStack(spacing: 36) {
            HStack {
                Spacer()
                Image(systemName: "camera.fill")
                    .padding(.trailing, 4)
            }
            .frame(height: 44)
            
            HStack(spacing: 20) {
                Image(member.icon)
                    .resizable()
                    .cornerRadius(6)
                    .frame(width: 62, height: 62)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(member.name)
                        .font(.system(size: 22, weight: .medium))
                    
                    HStack {
                        Text("微信号：\(member.id)")
                            .foregroundColor(Color.secondary)
                        
                        Spacer()
                        
                        Image("me_qrcode")
                        Image("cell_detail_indicator")
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 40, trailing: 16))
    }
}

private struct Cell: View {
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

private struct Line: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color("light_gray"))
            .frame(height: 8)
    }
}
