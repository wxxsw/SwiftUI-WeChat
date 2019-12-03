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
            .listRowInsets(EdgeInsets())
        }
        .navigationBarTitle("联系人", displayMode: .inline)
        .navigationBarItems(trailing: Image(systemName: "person.badge.plus"))
    }
}

#if DEBUG
struct ContactView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContactView()
        }
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
            HStack(spacing: 14) {
                Image(icon)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .cornerRadius(style == .system ? 4 : 6)

                Text(title)
                    .font(.system(size: 18))
                    .foregroundColor(.primary)
            }
            .padding(EdgeInsets(top: 10, leading: 18, bottom: 10, trailing: 18))
            
            if !isLast { // 最后一行不增加分割线
                Divider()
                    .padding(EdgeInsets(top: 0, leading: 76, bottom: 0, trailing: 0))
            }
        }
        .navigationLink(destination: ProfileView())
    }
}
