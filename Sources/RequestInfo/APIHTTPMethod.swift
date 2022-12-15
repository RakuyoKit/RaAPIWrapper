//
//  APIHTTPMethod.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

public protocol APIHTTPMethodWrapper {
    static var httpMethod: APIHTTPMethod { get }
}

/// Type representing HTTP methods.
public struct APIHTTPMethod: RawRepresentable {
    public typealias RawValue = String
    
    public var rawValue: RawValue
    
    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
}

// MARK: - ExpressibleByStringLiteral

extension APIHTTPMethod: ExpressibleByStringLiteral {
    public init(stringLiteral value: RawValue) {
        self.init(rawValue: value)
    }
}

// MARK: - Hashable

extension APIHTTPMethod: Hashable { }
