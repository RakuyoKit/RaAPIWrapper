//
//  APIParameters.swift
//  APIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

public protocol APIParameters {
    /// Converts the target to an Encodable-compliant type.
    var toParameter: Encodable { get }
}

// MARK: - Array

extension Array: APIParameters {
    public var toParameter: Encodable {
        lazy.compactMap { $0 as? Encodable }.map { AnyEncodable($0) }
    }
}

// MARK: - Dictionary

extension Dictionary: APIParameters where Key == String {
    public var toParameter: Encodable {
        compactMapValues { $0 as? Encodable }.mapValues { AnyEncodable($0) }
    }
}
