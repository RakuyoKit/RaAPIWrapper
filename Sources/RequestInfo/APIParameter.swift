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

// MARK: - Default

extension APIParameter where Self: Encodable {
    public var toParameters: Encodable { self }
}

// MARK: - Array

extension Array: APIParameter {
    public var toParameters: Encodable {
        (self as [Any?])
            .lazy
            .compactMap {
                if let value = $0 as? Encodable { return value }
                if let value = $0 as? APIParameter { return value.toParameters }
                return mapAnyObjectToEncodable($0 as? AnyObject)
            }
            .map { AnyEncodable($0) }
    }
}

// MARK: - Dictionary

extension Dictionary: APIParameter where Key == String {
    public var toParameters: Encodable {
        (self as [String: Any?])
            .compactMapValues {
                if let value = $0 as? Encodable { return value }
                if let value = $0 as? APIParameter { return value.toParameters }
                return mapAnyObjectToEncodable($0 as? AnyObject)
            }
            .mapValues { AnyEncodable($0) }
    }
}

// MARK: - Tools

fileprivate extension APIParameter {
    func mapAnyObjectToEncodable(_ value: AnyObject?) -> Encodable? {
        guard let _value = value else { return nil }
        
        if let result = _value as? String { return result }
        if let result = _value as? Int { return result }
        if let result = _value as? Double { return result }
        if let result = _value as? Bool { return result }
        if let result = _value as? Data { return result }
        if let result = _value as? [String: Any] { return result.toParameters }
        if let result = _value as? [Any] { return result.toParameters }
        
        return nil
    }
}
