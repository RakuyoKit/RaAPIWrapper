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
    var toParameters: AnyAPIHashableParameter { get }
}

// MARK: - Default

extension APIParameter where Self: APIHashableParameter {
    public var toParameters: AnyAPIHashableParameter { .init(self) }
}

// MARK: - Array

extension Array: APIParameter {
    public var toParameters: AnyAPIHashableParameter {
        let result: [AnyAPIHashableParameter] = (self as [Any?])
            .compactMap {
                if let value = $0 as? (any APIHashableParameter) { return .init(value) }
                if let value = $0 as? APIParameter { return value.toParameters }
                return mapAnyObjectToEncodable($0 as? AnyObject)
            }
        
        return .init(result)
    }
}

// MARK: - Dictionary

extension Dictionary: APIParameter where Key == String {
    public var toParameters: AnyAPIHashableParameter {
        let result: [String: AnyAPIHashableParameter] = (self as [String: Any?])
            .compactMapValues {
                if let value = $0 as? (any APIHashableParameter) { return .init(value) }
                if let value = $0 as? APIParameter { return value.toParameters }
                return mapAnyObjectToEncodable($0 as? AnyObject)
            }
        
        return .init(result)
    }
}

// MARK: - Tools

fileprivate extension APIParameter {
    func mapAnyObjectToEncodable(_ value: AnyObject?) -> AnyAPIHashableParameter? {
        guard let _value = value else { return nil }
        
        if let result = _value as? String { return .init(result) }
        if let result = _value as? Int { return .init(result) }
        if let result = _value as? Double { return .init(result) }
        if let result = _value as? Bool { return .init(result) }
        if let result = _value as? Data { return .init(result) }
        if let result = _value as? [String: Any] { return result.toParameters }
        if let result = _value as? [Any] { return result.toParameters }
        
        return nil
    }
}
