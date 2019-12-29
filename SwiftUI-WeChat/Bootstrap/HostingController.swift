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
    private var appState = AppState()
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(rootView: Content) {
        super.init(rootView: HostingMiddle(appState: appState, content: rootView))
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        appState.preferredStatusBarStyle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appState.objectWillChange
            .sink { [unowned self] in self.setNeedsStatusBarAppearanceUpdate() }
            .store(in: &cancellableSet)
    }

}

struct HostingMiddle<Content: View>: View {
    let appState: AppState
    let content: Content
    
    var body: some View {
        content
            .environmentObject(appState)
    }
}
