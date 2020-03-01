//
//  ContactView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/7/20.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct ContactView : View {
    let contacts: [Contact] = mock(name: "contacts")
    
    var body: some View {
        ZStack {
            VStack {
                Color("light_gray").frame(height: 300) // 下拉时露出的灰色背景
                Spacer() // 避免到底部上拉出现背景
            }
                
            List {
                Group {
                    SearchEntryView()
                    Cell(icon: "contact_new_friend", title: "新的朋友", style: .system, isLast: true)
                    ForEach(contacts) { contact in
                        Section(header: SectionHeader(title: contact.id)) {
                            ForEach(contact.members) { member in
                                Cell(
                                    icon: member.icon,
                                    title: member.name,
                                    style: .member,
                                    isLast: member.id == contact.members.last?.id
                                )
                            }
                        }
                    }
                }
                .listRowInsets(.zero)
            }
        }
        .onAppear {
            self.root.tabNavigationHidden = false
            self.root.tabNavigationTitle = "联系人"
            self.root.tabNavigationBarTrailingItems = .init(Image(systemName: "person.badge.plus"))
        }
    }
    
    @EnvironmentObject var root: RootViewModel
}

#if DEBUG
struct ContactView_Previews : PreviewProvider {
    static var previews: some View {
        ContactView()
            .environmentObject(RootViewModel())
    }
}
#endif

private struct SectionHeader: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.secondary)
            .padding(EdgeInsets(top: 8, leading: 18, bottom: 8, trailing: 18))
    }
}

private struct Cell: View {
    
    enum Style {
        case system
        case member
    }
    
    let icon: String
    let title: String
    let style: Style
    let isLast: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 12) {
                Image(icon)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(style == .system ? 4 : 6)

                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(.primary)
            }
            .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
            
            if !isLast { // 最后一行不增加分割线
                Separator().padding(.leading, 76)
            }
        }
        .navigationLink(destination: ProfileView())
    }
}
