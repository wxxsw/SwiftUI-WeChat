//
//  ContactList.swift
//  WeChat
//
//  Created by Gesen on 2020/10/16.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI

struct ContactList: View {
    @State private var contacts: [Contact] = []
    
    var body: some View {
        List {
            Group {
                SearchEntry()
                
                ContactRow(icon: "contact_new_friend", title: "新的朋友", style: .system)
                
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
                        }
                    }
                }
            }
            .listRowInsets(.zero)
        }
        .listStyle(PlainListStyle())
        .onAppear(perform: load)
        .id(contacts.count)
    }
    
    func load() {
        guard contacts.isEmpty else { return }
        contacts = Contact.all
    }
    
    struct SectionHeader: View {
        let title: String
        
        var body: some View {
            ZStack(alignment: .leading) {
                Color("light_gray")
                    .frame(maxWidth: .infinity)
                
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.secondary)
                    .padding(EdgeInsets(top: 8, leading: 18, bottom: 8, trailing: 18))
            }
        }
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContactList()
                .navigationBarTitle("通讯录", displayMode: .inline)
        }
    }
}
