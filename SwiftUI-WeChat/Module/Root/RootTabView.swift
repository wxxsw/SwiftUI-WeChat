//
//  RootTabView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct RootTabView : View {
    
    @EnvironmentObject var root: Root
    
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView { HomeView() }
                .tabItem { ItemView(index: $selection, style: .chat) }
                .tag(0)
            NavigationView { ContactView() }
                .tabItem { ItemView(index: $selection, style: .contact) }
                .tag(1)
            NavigationView { DiscoverView() }
                .tabItem { ItemView(index: $selection, style: .discover) }
                .tag(2)
            NavigationView { MeView() }
                .tabItem { ItemView(index: $selection, style: .me) }
                .tag(3)
        }
        .accentColor(.green) // 选中某个 Tab 时，Item 的高亮颜色
        .edgesIgnoringSafeArea(.top) // 为了导航栏可以延伸到状态栏后面
        .sheet(isPresented: $root.isSearchPresented, content: { SearchView() }) // 这样处理弹出界面，是因为如果在具体的界面处理会出现弹出一次后无法弹出第二次
    }
}

#if DEBUG
struct RootTabView_Previews : PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
#endif

private struct ItemView : View {
    
    enum Style: Int {
        case chat
        case contact
        case discover
        case me
        
        var image: UIImage {
            switch self {
            case .chat:     return UIImage(named: "root_tab_chat")!
            case .contact:  return UIImage(named: "root_tab_contact")!
            case .discover: return UIImage(named: "root_tab_discover")!
            case .me:       return UIImage(named: "root_tab_me")!
            }
        }
        
        var selectedImage: UIImage {
            switch self {
            case .chat:     return UIImage(named: "root_tab_chat_selected")!
            case .contact:  return UIImage(named: "root_tab_contact_selected")!
            case .discover: return UIImage(named: "root_tab_discover_selected")!
            case .me:       return UIImage(named: "root_tab_me_selected")!
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
    
    @Binding var index: Int
    
    let style: Style
    
    var body: some View {
        VStack {
            Image(uiImage: index == style.rawValue ? style.selectedImage : style.image)
            Text(style.text)
        }
    }
}
