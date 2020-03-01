//
//  MomentView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/12/4.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI

struct MomentView: View {
    let moments: [Moment] = mock(name: "moments")
    
    var body: some View {
        GeometryReader { proxy in
            List {
                Group {
                    Header()
                        .anchorPreference(key: NavigationKey.self, value: .bottom) { [$0] }
                    
                    ForEach(self.moments) { moment in
                        VStack(spacing: 0) {
                            MomentCell(moment: moment)
                            Separator()
                        }
                    }
                }
                .listRowInsets(.zero)
            }
            .overlayPreferenceValue(NavigationKey.self) { value in
                VStack {
                    self.navigation(proxy: proxy, value: value)
                    Spacer()
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        .navigationBarTitle("朋友圈", displayMode: .inline)
        .navigationBarItems(trailing: Image(systemName: "camera"))
        .onDisappear { UIApplication.shared.setStatusBar(style: .default) }
    }
    
    func navigation(proxy: GeometryProxy, value: [Anchor<CGPoint>]) -> some View {
        let height = proxy.safeAreaInsets.top + 44
        let progress: CGFloat
        
        if let anchor = value.first {
            progress = max(0, min(1, (-proxy[anchor].y + height) / 44))
        } else {
            progress = 1
        }

        UIApplication.shared.setStatusBar(style: progress > 0.3 ? .default : .lightContent)
        
        return Navigation(progress: Double(progress))
            .frame(height: height)
    }
}

struct MomentView_Previews: PreviewProvider {
    static var previews: some View {
        MomentView()
    }
}

private struct NavigationKey: PreferenceKey {
    static var defaultValue: [Anchor<CGPoint>] = []
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.append(contentsOf: nextValue())
    }
}

private struct Navigation: View {
    let progress: Double
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .foregroundColor(
                    Color("light_gray")
                        .opacity(progress)
                )
            
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image("back")
                }
                .padding()
                
                Spacer()
                
                Button(action: { print("camera") }) {
                    Image(systemName: "camera.fill")
                }
                .padding()
            }
            .accentColor(Color(white: 1 - progress))
            .frame(height: 44)
        }
        .frame(maxWidth: .infinity)
    }
    
    @Environment(\.presentationMode) var presentationMode
}

private struct Header: View {
    let member: Member = mock(name: "me")
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 0) {
                Image(member.background ?? "")
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
