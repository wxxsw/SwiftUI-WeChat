//
//  ContactHome.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct ContactHome : View {
    let contacts: [Contact] = Contact.all
    
    var body: some View {
        ZStack {
            VStack {
                Color("light_gray").frame(height: 300) // 下拉时露出的灰色背景
                Spacer() // 避免到底部上拉出现背景
            }
                
            ContactList(contacts: contacts)
        }
        .onAppear {
            self.root.tabNavigationHidden = false
            self.root.tabNavigationTitle = "联系人"
            self.root.tabNavigationBarTrailingItems = .init(Image(systemName: "person.badge.plus"))
        }
    }
    
    @EnvironmentObject var root: RootViewModel
}

struct ContactHome_Previews : PreviewProvider {
    static var previews: some View {
        ContactHome()
            .environmentObject(RootViewModel())
    }
}
