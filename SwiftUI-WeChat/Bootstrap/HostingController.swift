//
//  HostingController.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/12/28.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI
import Combine

extension UIApplication {
    
    /// 设置状态栏样式
    /// - Parameter style: 样式
    func setStatusBar(style: UIStatusBarStyle) {
        NotificationCenter.default.post(name: .StatusBarDidChange, object: nil, userInfo: ["style": style])
    }
}

class HostingController<Content: View>: UIHostingController<HostingMiddle<Content>> {
    private var statusBarStyle: UIStatusBarStyle = .default
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(rootView: Content) {
        super.init(rootView: HostingMiddle(content: rootView))
        
        NotificationCenter.default
            .publisher(for: .StatusBarDidChange)
            .sink { [unowned self] notification in
                guard
                    let userInfo = notification.userInfo,
                    let style = userInfo["style"] as? UIStatusBarStyle,
                    self.statusBarStyle != style
                    else { return }
                
                UIView.animate(withDuration: 0.25) {
                    self.statusBarStyle = style
                    self.setNeedsStatusBarAppearanceUpdate()
                }
            }
            .store(in: &cancellableSet)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        statusBarStyle
    }

}

struct HostingMiddle<Content: View>: View {
    let content: Content
    
    var body: some View {
        content
            // 预留设置全局 modifier 的位置
    }
}

private extension Notification.Name {
    
    static let StatusBarDidChange = Notification.Name("StatusBarDidChange")
}
