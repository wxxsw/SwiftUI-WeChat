//
//  MeList.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

struct MeList: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Group {
                    Header()
                    Line()
                }
                Group {
                    MeRow(icon: "me_pay", title: "支付")
                    Line()
                }
                Group {
                    MeRow(icon: "me_favorite", title: "收藏")
                    Separator().padding(.leading, 52)
                    MeRow(icon: "me_photo_album", title: "相册")
                    Separator().padding(.leading, 52)
                    MeRow(icon: "me_bank_card", title: "卡包")
                    Separator().padding(.leading, 52)
                    MeRow(icon: "me_emoji", title: "表情")
                    Line()
                }
                Group {
                    MeRow(icon: "me_setting", title: "设置")
                    Line()
                }
            }
            .background(Color("cell"))
        }
    }
    
    struct Header: View {
        @State var me = Member.me
        
        var body: some View {
            VStack(spacing: 36) {
                HStack {
                    Spacer()
                    Image(systemName: "camera.fill")
                        .padding(.trailing, 4)
                }
                .frame(height: 44)
                
                HStack(spacing: 20) {
                    Image(me.icon)
                        .resizable()
                        .cornerRadius(6)
                        .frame(width: 62, height: 62)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(me.name)
                            .font(.system(size: 22, weight: .medium))
                        
                        HStack {
                            Text("微信号：\(me.identifier ?? "")")
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
    
    struct Line: View {
        var body: some View {
            Rectangle()
                .foregroundColor(Color("light_gray"))
                .frame(height: 8)
        }
    }
}

struct MeList_Previews: PreviewProvider {
    static var previews: some View {
        MeList()
    }
}
