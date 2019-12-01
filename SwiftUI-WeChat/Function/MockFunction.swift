//
//  MockFunction.swift
//  SwiftUI-WeChat
//
//  Created by Gesen on 2019/11/29.
//  Copyright © 2019 Gesen. All rights reserved.
//

import Foundation

struct Mock<T: Decodable>: Decodable {
    let data: T
}

func mock<T: Decodable>(name: String) -> T {
    let url = Bundle.main.url(forResource: name, withExtension: "json")!
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let result = try decoder.decode(Mock<T>.self, from: data)
        return result.data
    } catch {
        fatalError(error.localizedDescription)
    }
}
