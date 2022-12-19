//
//  APIParameters.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

/// Used to constrain what types can be used as api parameters.
public typealias APIParametrizable = AnyAPIParameter.Input

/// Means that the type can be converted to an interface parameter for requesting an api.
public protocol APIParameterConvertible {
    /// Converts the target to an Encodable-compliant type.
    var toParameters: AnyAPIParameter { get }
}

// MARK: - Default

extension APIParameterConvertible where Self: APIParametrizable {
    public var toParameters: AnyAPIParameter { .init(self) }
}

// MARK: - AnyAPIParameter

extension AnyAPIParameter: APIParameterConvertible { }

// MARK: - String

extension String: APIParameterConvertible { }

// MARK: - Number

extension Int: APIParameterConvertible { }
extension Float: APIParameterConvertible { }
extension Double: APIParameterConvertible { }

// MARK: - Bool

extension Bool: APIParameterConvertible { }

// MARK: - Array

extension Array: APIParameterConvertible {
    public var toParameters: AnyAPIParameter {
        let result: [AnyAPIParameter] = (self as [Any?])
            .compactMap {
                if let value = $0 as? (any APIParametrizable) { return .init(value) }
                if let value = $0 as? APIParameterConvertible { return value.toParameters }
                return mapAnyObjectToEncodable($0 as? AnyObject)
            }
        
        return .init(result)
    }
}

// MARK: - Dictionary

extension Dictionary: APIParameterConvertible where Key == String {
    public var toParameters: AnyAPIParameter {
        let result: [String: AnyAPIParameter] = (self as [String: Any?])
            .compactMapValues {
                if let value = $0 as? (any APIParametrizable) { return .init(value) }
                if let value = $0 as? APIParameterConvertible { return value.toParameters }
                return mapAnyObjectToEncodable($0 as? AnyObject)
            }
        
        return .init(result)
    }
}

// MARK: - Tools

fileprivate extension APIParameterConvertible {
    func mapAnyObjectToEncodable(_ value: AnyObject?) -> AnyAPIParameter? {
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
