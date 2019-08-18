//
//  Api.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/8/18.
//  Copyright © 2019 Gesen. All rights reserved.
//

import Foundation
import Combine

enum RequestError: Error {
    case request(code: Int, error: Error?)
    case unknown
}

enum Api {
    
    enum MockError: Error {
        case underline(Error)
        case unknown
    }
    
    // TODO：等待正式版的 Combine 接口稳定了再改这里
//    static func mock(name: String) -> AnyPublisher<Data, MockError> {
//        AnyPublisher<Data, MockError> { _ in
//            guard let url = Bundle.main.url(forResource: name, withExtension: "json") else {
//                subscriber.receive(completion: .failure(.unknown))
//                return
//            }
//
//            do {
//                let data = try Data(contentsOf: url)
//                subscriber.receive(completion: .success(data))
//            } catch {
//                subscriber.receive(completion: .failure(.underline(error)))
//            }
//        }
//    }
    
}
