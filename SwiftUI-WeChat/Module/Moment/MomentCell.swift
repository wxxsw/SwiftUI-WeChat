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
            Avatar(icon: moment.author.icon)
            
            VStack(alignment: .leading, spacing: 10) {
                Name(name: moment.author.name)
                
                if moment.text != nil {
                    TextContent(text: moment.text!)
                }
                
                if moment.images != nil {
                    if moment.images!.count == 1 {
                        SingleImage(image: moment.images![0])
                    } else {
                        ImageGrid(images: moment.images!)
                    }
                }
                
                if moment.video != nil {
                    Video(video: moment.video!)
                }
                
                HStack {
                    Time(time: moment.time)
                    
                    Spacer()
                    
                    Image("moment_comment")
                }
                
                if moment.likes != nil || moment.comments != nil {
                    VStack(alignment: .leading, spacing: 0) {
                        if moment.likes != nil {
                            Likes(likes: moment.likes!)
                        }
                        
                        if moment.likes != nil && moment.comments != nil {
                            Separator(color: Color("moment_comment_separator"))
                        }
                        
                        if moment.comments != nil {
                            Comments(comments: moment.comments!)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color("moment_comment_background"))
                    .cornerRadius(3)
                }
            }
        }
        .padding(.init(top: 12, leading: 12, bottom: 14, trailing: 12))
    }
}

struct MomentCell_Previews: PreviewProvider {
    static var previews: some View {
        let moments: [Moment] = mock(name: "moments")
        return MomentCell(moment: moments[0])
            .previewLayout(.sizeThatFits)
    }
}

private struct Avatar: View {
    let icon: String
    
    var body: some View {
        Image(icon)
            .resizable()
            .frame(width: 42, height: 42)
            .cornerRadius(4)
    }
}

private struct Name: View {
    let name: String
    
    var body: some View {
        Text(name)
            .foregroundColor(Color("link"))
            .font(.system(size: 16, weight: .medium))
            .padding(.bottom, -6)
    }
}

private struct TextContent: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 15))
            .frame(maxWidth: .infinity, alignment: .leading)
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
            ForEach(0 ..< rows, id: \.self) { row in
                self.rowBody(row: row, isLast: false)
            }
            if lastRowCols > 0 {
                self.rowBody(row: rows, isLast: true)
            }
        }
    }
    
    func rowBody(row: Int, isLast: Bool) -> some View {
        HStack(spacing: 6) {
            ForEach(0 ..< (isLast ? self.lastRowCols : self.cols), id: \.self) { col in
                Image(self.images[row * self.cols + col].cover)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 60, maxWidth: 80, minHeight: 60, maxHeight: 80)
                    .aspectRatio(1, contentMode: .fill)
                    .clipped()
            }
        }
    }
}

private struct Video: View {
    let video: Media
    
    /// 控制开始播放 / 控制停止播放
    @State private var play: Bool = false
    
    /// 播放中 / 非播放状态（例如缓冲、错误、暂停等）
    @State private var isPlaying: Bool = false
    
    var body: some View {
        ZStack {
            VideoPlayer(url: URL(string: video.url!)!, play: $play)
                .onStateChanged { state in
                    switch state {
                    case .playing:  self.isPlaying = true
                    default:        self.isPlaying = false
                    }
                }
                // 可见时播放，不可见时暂停
                .onAppear { self.play = true }
                .onDisappear { self.play = false }
            
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

private struct Time: View {
    let time: String
    
    var body: some View {
        Text(time)
            .foregroundColor(.secondary)
            .font(.system(size: 14))
    }
}

private struct Likes: View {
    let likes: [String]
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            makeLikesText()
                .fixedSize(horizontal: false, vertical: true)

            // 固定位置，即便文字有多行，心形位置也不会变
            Image("moment_like")
                .resizable()
                .frame(width: 12, height: 12)
                .offset(y: 5)
        }
        .padding(.init(top: 4, leading: 14, bottom: 4, trailing: 14))
    }
    
    func makeLikesText() -> Text {
        var text = Text("    ") // 空格是为了给心形留位置
        
        for (i, like) in likes.enumerated() {
            if i > 0 { text = text + Text(", ") }
            
            text = text + Text(like)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color("link"))
        }
        
        return text
    }
}

private struct Comments: View {
    let comments: [Comment]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(comments) { comment in
                self.makeCommentText(comment: comment)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.init(top: 6, leading: 12, bottom: 6, trailing: 12))
    }
    
    func makeCommentText(comment: Comment) -> Text {
        Text(comment.name)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(Color("link")) +
        Text("：\(comment.content)")
            .font(.system(size: 14))
    }
}
