//
//  AnyEncodable.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

struct AnyEncodable {
    private let encodable: Encodable
    
    init(_ encodable: Encodable) {
        self.encodable = encodable
    }
}

// MARK: - Encodable

extension AnyEncodable: Encodable {
    func encode(to encoder: Encoder) throws {
        try encodable.encode(to: encoder)
    }
}
