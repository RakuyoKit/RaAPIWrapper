//
//  APIParameters.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

public protocol APIParameter {
    /// Converts the target to an Encodable-compliant type.
    var toParameters: Encodable { get }
}

// MARK: - Array

extension Array: APIParameter {
    public var toParameters: Encodable {
        lazy.compactMap { $0 as? Encodable }.map { AnyEncodable($0) }
    }
}

// MARK: - Dictionary

extension Dictionary: APIParameter where Key == String {
    public var toParameters: Encodable {
        compactMapValues { $0 as? Encodable }.mapValues { AnyEncodable($0) }
    }
}
