//
//  HostingController.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/12/28.
//  Copyright © 2019 Gesen. All rights reserved.
//

import SwiftUI
import Combine

class HostingController<Content: View>: UIHostingController<HostingMiddle<Content>> {
    private var appStyle = AppStyle()
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(rootView: Content) {
        super.init(rootView: HostingMiddle(appStyle: appStyle, content: rootView))
        
        appStyle.objectWillChange
            .sink { [weak self] in self?.setNeedsStatusBarAppearanceUpdate() }
            .store(in: &cancellableSet)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        appStyle.preferredStatusBarStyle
    }

}

struct HostingMiddle<Content: View>: View {
    let appStyle: AppStyle
    let content: Content
    
    var body: some View {
        content
            .environmentObject(appStyle)
    }
}
