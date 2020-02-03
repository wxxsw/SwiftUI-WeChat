//
//  MomentCell.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2020/2/3.
//  Copyright © 2020 Gesen. All rights reserved.
//

import SwiftUI
import VideoPlayer

struct MomentCell: View {
    let moment: Moment
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(moment.author.icon)
                .resizable()
                .frame(width: 42, height: 42)
                .cornerRadius(4)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(moment.author.name)
                    .foregroundColor(Color("link"))
                    .font(.system(size: 16, weight: .medium))
                    .padding(.bottom, -6)
                
                if moment.text != nil {
                    Text(moment.text!)
                        .font(.system(size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
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
                
                HStack {
                    Text(moment.time)
                        .foregroundColor(.secondary)
                        .font(.system(size: 14))
                    
                    Spacer()
                    
                    Image("moment_comment")
                }
            }
        }
        .padding(12)
    }
}

struct MomentCell_Previews: PreviewProvider {
    static var previews: some View {
        let moments: [Moment] = mock(name: "moments")
        return MomentCell(moment: moments[0])
            .previewLayout(.sizeThatFits)
    }
}

private struct SingleImage: View {
    let image: Media
    
    var body: some View {
        // 按照最大区域 180x180 等比缩放
        Image(image.cover)
            .resizable()
            .aspectRatio(CGSize(width: image.width, height: image.height), contentMode: .fit)
            .frame(maxWidth: 180, maxHeight: 180, alignment: .leading)
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
        HStack(spacing: 6) {
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
                // 可见时播放，不可见时暂停
                .onAppear { self.isPlay = true }
                .onDisappear { self.isPlay = false }
            
            if !isPlaying {
                // 非播放状态下显示封面图
                Image(video.cover)
                    .resizable()
            }
        }
        // 按照最大区域 225x225 等比缩放
        .aspectRatio(CGSize(width: video.width, height: video.height), contentMode: .fit)
        .frame(maxWidth: 225, maxHeight: 225, alignment: .leading)
    }
}
