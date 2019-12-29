//
//  MomentView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/12/4.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct MomentView: View {
    var body: some View {
        List {
            Group {
                Header()
            }
            .listRowInsets(.zero)
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        .navigationBarTitle("朋友圈", displayMode: .inline)
        .navigationBarItems(trailing: Image(systemName: "camera"))
    }
    
    @EnvironmentObject var appState: AppState
}

struct MomentView_Previews: PreviewProvider {
    static var previews: some View {
        MomentView()
    }
}

private struct Navigtion: View {
    var body: some View {
        HStack {
            Button(action: {
                print("back")
            }) {
                Text("<")
            }
        }
    }
}

private struct Header: View {
    let member: Member = mock(name: "me")
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 0) {
                Image(member.background ?? "mock_background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipped()
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 20)
            }
            
            HStack(spacing: 20) {
                Text(member.name)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .shadow(radius: 2)
                    .alignmentGuide(VerticalAlignment.center) { d in 20 }
                
                Image(member.icon)
                    .resizable()
                    .cornerRadius(6)
                    .frame(width: 70, height: 70)
                    .padding(.trailing, 12)
            }
        }
    }
}
