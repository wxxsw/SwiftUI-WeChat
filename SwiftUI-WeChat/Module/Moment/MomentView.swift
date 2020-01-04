//
//  MomentView.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/12/4.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI
import VideoPlayer

struct MomentView: View {
    let moments: [Moment] = mock(name: "moments")
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                List {
                    Group {
                        Header()
                        ForEach(self.moments) { moment in
                            Cell(moment: moment)
                        }
                    }
                    .listRowInsets(.zero)
                }
                Navigation(opacity: 0)
                    .frame(height: geometry.safeAreaInsets.top + 44)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        .navigationBarTitle("朋友圈", displayMode: .inline)
        .navigationBarItems(trailing: Image(systemName: "camera"))
        .onAppear { self.appStyle.preferredStatusBarStyle = .lightContent }
    }
    
    @EnvironmentObject var appStyle: AppStyle
}

struct MomentView_Previews: PreviewProvider {
    static var previews: some View {
        MomentView()
            .environmentObject(AppStyle())
    }
}

private struct Navigation: View {
    let opacity: Double
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .foregroundColor(
                    Color("light_gray")
                        .opacity(opacity)
                )
            
            HStack {
                Button(action: {
                    self.appStyle.preferredStatusBarStyle = .default
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
            .accentColor(Color(white: 1 - opacity))
            .frame(height: 44)
        }
        .frame(maxWidth: .infinity)
    }
    
    @EnvironmentObject var appStyle: AppStyle
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

private struct Cell: View {
    let moment: Moment
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(moment.author.name)
            
            if moment.text != nil {
                Text(moment.text!)
            }
            
            if moment.images != nil {
                if moment.images!.count == 1 {
                    SingleImage(image: moment.images![0])
                } else {
                    ImageGrid(images: moment.images!)
                }
            }
            
            if moment.video != nil {
                SingleVideo(video: moment.video!)
            }
        }
    }
}

private struct SingleImage: View {
    let image: Media
    let size: CGSize
    
    var body: some View {
        Image(image.cover)
            .resizable()
            .frame(width: size.width, height: size.height)
    }
    
    init(image: Media) {
        self.image = image
        
        // 按照最大区域 180x180 等比缩放
        if image.width > image.height {
            size = CGSize(width: 180, height: image.height * 180 / image.width)
        } else {
            size = CGSize(width: image.width * 180 / image.height, height: 180)
        }
    }
}

private struct ImageGrid: View {
    let images: [Media]
    
    var rows: Int { images.count / cols }
    var cols: Int { images.count == 4 ? 2 : min(images.count, 3) }
    var lastRowCols: Int { images.count % cols }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(0 ..< rows) { row in
                self.rowBody(row: row, isLast: false)
            }
            if lastRowCols > 0 {
                self.rowBody(row: rows, isLast: true)
            }
        }
    }
    
    func rowBody(row: Int, isLast: Bool) -> some View {
        HStack {
            ForEach(0 ..< (isLast ? lastRowCols : self.cols)) { col in
                Image(self.images[row * self.cols + col].cover)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipped()
            }
        }
    }
}

private struct SingleVideo: View {
    let video: Media
    let size: CGSize
    
    /// 控制开始播放 / 控制停止播放
    @State private var isPlay: Bool = false
    
    /// 播放中 / 非播放状态（例如缓冲、错误、暂停等）
    @State private var isPlaying: Bool = false
    
    var body: some View {
        ZStack {
            VideoPlayer(url: URL(string: video.url!)!, isPlay: $isPlay)
                .onStateChanged { state in
                    self.isPlaying = state == .playing
                }
                .onAppear { self.isPlay = true }
                .onDisappear { self.isPlay = false }
            
            if !isPlaying {
                Image(video.cover)
                    .resizable()
            }
        }
        .frame(width: size.width, height: size.height)
    }
    
    init(video: Media) {
        self.video = video
        
        // 按照最大区域 225x225 等比缩放
        if video.width > video.height {
            size = CGSize(width: 225, height: video.height * 225 / video.width)
        } else {
            size = CGSize(width: video.width * 225 / video.height, height: 225)
        }
    }
}
