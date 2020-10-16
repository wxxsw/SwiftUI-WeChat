//
//  ContactList.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

struct ContactList: View {
    let contacts: [Contact]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                SearchEntry()
                ContactRow(icon: "contact_new_friend", title: "新的朋友", style: .system)
                Separator().padding(.leading, 76)
                ForEach(contacts) { contact in
                    Section(header: SectionHeader(title: contact.letter)) {
                        ForEach(contact.members) { member in
                            NavigationLink(destination: ProfileView()) {
                                ContactRow(
                                    icon: member.icon,
                                    title: member.name,
                                    style: .member
                                )
                            }
                            
                            if member.id != contact.members.last?.id {
                                Separator().padding(.leading, 76)
                            }
                        }
                    }
                }
            }
        }
    }
    
    struct SectionHeader: View {
        let title: String
        
        var body: some View {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.secondary)
                .padding(EdgeInsets(top: 8, leading: 18, bottom: 8, trailing: 18))
        }
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        ContactList(contacts: Contact.all)
    }
}
