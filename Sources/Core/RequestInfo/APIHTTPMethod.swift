//
//  APIHTTPMethod.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2024 RakuyoKit. All rights reserved.
//

import Foundation

// MARK: - APIHTTPMethod

/// The HTTP method to use when requesting the api.
///
/// With the `ExpressibleByStringLiteral` protocol,
/// you can initialize the object directly with string literals
public struct APIHTTPMethod: RawRepresentable {
    public typealias RawValue = String
    
    public var rawValue: RawValue

    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
}

// MARK: ExpressibleByStringLiteral

extension APIHTTPMethod: ExpressibleByStringLiteral {
    public init(stringLiteral value: RawValue) {
        self.init(rawValue: value)
    }
}

// MARK: Hashable

extension APIHTTPMethod: Hashable { }
