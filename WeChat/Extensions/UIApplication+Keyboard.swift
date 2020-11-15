//
//  UIApplication+Keyboard.swift
//  WeChat
//
//  Created by Gesen on 2020/11/1.
//  Copyright © 2020 Gesen. All rights reserved.
//

import UIKit
import Combine

extension UIApplication {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default
            .publisher(for: UIApplication.keyboardWillShowNotification)
            .map { ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0 }
        
        let willHide = NotificationCenter.default
            .publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        return Publishers.Merge(willShow, willHide)
            .eraseToAnyPublisher()
    }
}
