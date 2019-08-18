//
//  HomeCellView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/8/4.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct HomeCellView: View {
    var body: some View {
        NavigationLink(destination: ChatView()) {
            HStack(spacing: 12) {
                Image("swiftui")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 48, height: 48)
                    .cornerRadius(8)

                VStack(alignment: .leading, spacing: 6) {
                    HStack(alignment: .top) {
                        Text("SwiftUI")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.primary)
                        Spacer()
                        Text("16:00")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }

                    Text("[视频]")
                        .font(.system(size: 15))
                        .foregroundColor(.secondary)
                }
            }
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        }
        .background(Color("cell"))
        .listRowInsets(EdgeInsets())
    }
}

#if DEBUG
struct HomeCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            HomeCellView()
        }
    }
}
#endif
