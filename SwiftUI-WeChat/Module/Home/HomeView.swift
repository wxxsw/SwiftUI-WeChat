//
//  HomeView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct HomeView : View {
    var body: some View {
        List {
            Section {
                HomeSearchCellView()
                HomeCellView()
            }
        }
        .navigationBarTitle(Text("微信"), displayMode: .inline)
        .navigationBarItems(trailing: Image(systemName: "plus.circle"))
    }
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
#endif

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
