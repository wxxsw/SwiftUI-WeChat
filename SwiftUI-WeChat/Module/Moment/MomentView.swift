//
//  MomentView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/12/4.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct MomentView: View {
    @State private var navigationOpacity: Double = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                List {
                    Group {
                        Header()
                            // TODO: 优化为滚动渐变
                            .onAppear { self.navigationOpacity = 0 }
                            .onDisappear { self.navigationOpacity = 1 }
                        
                        ForEach(0 ..< 20) { _ in
                            Cell()
                        }
                    }
                    .listRowInsets(.zero)
                }
                Navigation(opacity: self.$navigationOpacity)
                    .frame(height: geometry.safeAreaInsets.top + 44)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        .navigationBarTitle("朋友圈", displayMode: .inline)
        .navigationBarItems(trailing: Image(systemName: "camera"))
        .statusBar(style: navigationOpacity > 0.5 ? .default : .lightContent)
    }
    
    @EnvironmentObject var appState: AppState
}

struct MomentView_Previews: PreviewProvider {
    static var previews: some View {
        MomentView()
            .environmentObject(AppState())
    }
}

private struct Navigation: View {
    @Binding var opacity: Double
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .foregroundColor(Color("light_gray").opacity(opacity))
            
            HStack {
                Button(action: { print("back") }) {
                    Image("back")
                }
                .padding()
                
                Spacer()
                
                Button(action: { print("camera") }) {
                    Image(systemName: "camera.fill")
                }
                .padding()
            }
            .accentColor(Color(white: 1 - opacity))
            .frame(height: 44)
        }
        .frame(maxWidth: .infinity)
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

private struct Cell: View {
    var body: some View {
        Text("asd")
    }
}
