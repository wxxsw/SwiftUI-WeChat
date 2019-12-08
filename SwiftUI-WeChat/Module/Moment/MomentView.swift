//
//  MomentView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/12/4.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct MomentView: View {
    @State var test: Bool = false
    
    var body: some View {
        List {
            Group {
                Header()
            }
            .listRowInsets(.zero)
        }
        .navigationBarTitle("朋友圈", displayMode: .inline)
        .navigationBarItems(trailing: Image(systemName: "camera"))
    }
}

struct MomentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { MomentView() }
    }
}

private struct Header: View {
    let member: Member = mock(name: "me")
    
    var body: some View {
        ZStack {
            Image(member.background ?? "mock_background")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .frame(height: 300)
                .clipped()
            
            Image(member.icon)
                .frame(width: 70, height: 70)
        }
    }
}
