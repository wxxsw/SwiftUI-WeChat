//
//  RootView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var root = RootViewModel()
    
    var body: some View {
        NavigationView {
            TabView(selection: $root.tabSelection) {
                HomeView()
                    .tabItem { Item(index: $root.tabSelection, style: .chat) }
                    .tag(0)
                ContactView()
                    .tabItem { Item(index: $root.tabSelection, style: .contact) }
                    .tag(1)
                DiscoverView()
                    .tabItem { Item(index: $root.tabSelection, style: .discover) }
                    .tag(2)
                MeView()
                    .tabItem { Item(index: $root.tabSelection, style: .me) }
                    .tag(3)
            }
            .accentColor(.green) // 选中某个 Tab 时，Item 的高亮颜色
            .environmentObject(root)
            .navigationBarHidden(root.tabNavigationHidden)
            .navigationBarItems(trailing: root.tabNavigationBarTrailingItems)
            .navigationBarTitle(root.tabNavigationTitle, displayMode: .inline)
        }
    }
}

#if DEBUG
struct RootTabView_Previews : PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
#endif

private struct Item: View {
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
}

extension Item {
    
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
