//
//  AnyHashableAPIParameterEncoding.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2024 RakuyoKit. All rights reserved.
//

import Foundation

import Alamofire

#if !COCOAPODS
import APIWrapper
#endif

/// Represents an arbitrary api parameter.
public typealias AnyAPIParameterEncoding = AnyAPIHashableParameterEncoding

// MARK: - AnyAPIHashableParameterEncoding

/// Make `AlamofireParameterEncoding` follow `Hashable` protocol.
public struct AnyAPIHashableParameterEncoding: AnyAPIHashable {
    public typealias Value = ParameterEncoding

    public typealias Input = Hashable & Value

    public let value: Value

    public let equals: (Value) -> Bool

    public let hash: (_ hasher: inout Hasher) -> Void

    public init<T: Input>(_ value: T) {
        self.value = value
        equals = { ($0 as? T == value) }
        hash = { $0.combine(value) }
    }
}

// MARK: - AnyAPIParameterEncoding + ParameterEncoding

extension AnyAPIParameterEncoding: ParameterEncoding {
    public func encode(
        _ urlRequest: Alamofire.URLRequestConvertible,
        with parameters: Alamofire.Parameters?
    ) throws -> URLRequest {
        try value.encode(urlRequest, with: parameters)
    }
}
