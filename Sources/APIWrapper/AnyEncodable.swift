//
//  AnyEncodable.swift
//  APIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

public struct AnyEncodable {
    private let encodable: Encodable
    
    public init(_ encodable: Encodable) {
        self.encodable = encodable
    }
}

// MARK: - Encodable

extension AnyEncodable: Encodable {
    public func encode(to encoder: Encoder) throws {
        try encodable.encode(to: encoder)
    }
}
