//
//  RootView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @State private var selection: Int = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                ChatHome()
                    .tabItem { Item(type: .chat, selection: selection) }
                    .tag(ItemType.chat.rawValue)
                ContactHome()
                    .tabItem { Item(type: .contact, selection: selection) }
                    .tag(ItemType.contact.rawValue)
                DiscoverHome()
                    .tabItem { Item(type: .discover, selection: selection) }
                    .tag(ItemType.discover.rawValue)
                MeHome()
                    .tabItem { Item(type: .me, selection: selection) }
                    .tag(ItemType.me.rawValue)
            }
            .navigationBarHidden(itemType.isNavigationBarHidden(selection: selection))
            .navigationBarTitle(itemType.title, displayMode: .inline)
            .navigationBarItems(trailing: itemType.navigationBarTrailingItems(selection: selection))
        }
    }
    
    enum ItemType: Int {
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
        
        var title: String {
            switch self {
            case .chat:     return "微信"
            case .contact:  return "通讯录"
            case .discover: return "发现"
            case .me:       return "我"
            }
        }
        
        func isNavigationBarHidden(selection: Int) -> Bool {
            selection == ItemType.me.rawValue
        }
        
        func navigationBarTrailingItems(selection: Int) -> AnyView {
            switch ItemType(rawValue: selection)! {
            case .chat:
                return AnyView(Image(systemName: "plus.circle"))
            case .contact:
                return AnyView(Image(systemName: "person.badge.plus"))
            case .discover:
                return AnyView(EmptyView())
            case .me:
                return AnyView(EmptyView())
            }
        }
    }
    
    struct Item: View {
        let type: ItemType
        let selection: Int
        
        var body: some View {
            VStack {
                if type.rawValue == selection {
                    type.selectedImage
                } else {
                    type.image
                }
                
                Text(type.title)
            }
        }
    }
    
    private var itemType: ItemType { ItemType(rawValue: selection)! }
}

struct RootTabView_Previews : PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
