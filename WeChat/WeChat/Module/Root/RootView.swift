//
//  RootView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @StateObject var model = RootViewModel()
    
    let chatView = ChatHome()
    let contactView = ContactHome()
    let discoverView = DiscoverHome()
    let meView = MeHome()
    
    var body: some View {
        NavigationView {
            TabView(selection: $model.tabSelection) {
                chatView
                    .tabItem { Item(index: $model.tabSelection, style: .chat) }
                    .tag(0)
                contactView
                    .tabItem { Item(index: $model.tabSelection, style: .contact) }
                    .tag(1)
                discoverView
                    .tabItem { Item(index: $model.tabSelection, style: .discover) }
                    .tag(2)
                meView
                    .tabItem { Item(index: $model.tabSelection, style: .me) }
                    .tag(3)
            }
//            .accentColor(.green) // 选中某个 Tab 时，Item 的高亮颜色
            .navigationBarHidden(model.tabNavigationHidden)
            .navigationBarItems(trailing: model.tabNavigationBarTrailingItems)
            .navigationBarTitle(model.tabNavigationTitle, displayMode: .inline)
            .environmentObject(model)
        }
    }
    
    struct Item: View {
        @Binding var index: Int
        
        let style: Style
        
        var body: some View {
            VStack {
                if index == style.rawValue {
                    style.selectedImage
                } else {
                    style.image
                }
                
                Text(style.text)
            }
        }
        
        enum Style: Int {
            case chat
            case contact
            case discover
            case me
            
            var image: Image {
                switch self {
                case .chat:     return Image("root_tab_chat")
                case .contact:  return Image("root_tab_contact")
                case .discover: return Image("root_tab_discover")
                case .me:       return Image("root_tab_me")
                }
            }
            
            var selectedImage: Image {
                switch self {
                case .chat:     return Image("root_tab_chat_selected")
                case .contact:  return Image("root_tab_contact_selected")
                case .discover: return Image("root_tab_discover_selected")
                case .me:       return Image("root_tab_me_selected")
                }
            }
            
            var text: String {
                switch self {
                case .chat:     return "微信"
                case .contact:  return "通讯录"
                case .discover: return "发现"
                case .me:       return "我"
                }
            }
        }
    }
}

struct RootTabView_Previews : PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
