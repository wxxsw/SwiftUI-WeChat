//
//  HomeSearchCellView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct HomeSearchCellView : View {
    
    @EnvironmentObject var root: Root
    
    var body: some View {
        Button(action: { self.root.isSearchPresented.toggle() }) {
            VStack {
                Spacer()
                HStack(spacing: 4) {
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 13, height: 13)
                        .foregroundColor(.gray)
                    Text("搜索")
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                    Spacer()
                }
                Spacer()
            }
            .background(Color("home_search_corner_background"))
            .cornerRadius(6)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
        .background(Color("root_navigation_background"))
        .listRowInsets(EdgeInsets())
    }
    
}

#if DEBUG
struct HomeSearchCellView_Previews : PreviewProvider {
    static var previews: some View {
        HomeSearchCellView()
            .previewLayout(.fixed(width: 375, height: 56))
    }
}
#endif
