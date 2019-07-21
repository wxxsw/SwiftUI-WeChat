//
//  RootTabbedItemView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct RootTabbedItemView : View {
    
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
