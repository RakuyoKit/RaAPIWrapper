//
//  AnyHashableAPIParameterEncoding.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

import Alamofire

/// Make `APIParameterEncoding` follow `Hashable` protocol
public struct AnyAPIHashableParameterEncoding: AnyAPIHashable {
    public typealias Value = APIParameterEncoding
    
    public typealias Input = Value & Hashable
    
    ///
    public let value: Value
    
    ///
    public let equals: (Value) -> Bool
    
    ///
    public let hash: (_ hasher: inout Hasher) -> Void
    
    public init<T: Input>(_ value: T) {
        self.value = value
        self.equals = { ($0 as? T == value) }
        self.hash = { $0.combine(value) }
    }
}

// MARK: - APIParameterEncoding

extension AnyAPIHashableParameterEncoding: APIParameterEncoding {
    public func encode(
        _ urlRequest: Alamofire.URLRequestConvertible,
        with parameters: Alamofire.Parameters?
    ) throws -> URLRequest {
        return try value.encode(urlRequest, with: parameters)
    }
}
