//
//  APIParameterConvertible.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2024 RakuyoKit. All rights reserved.
//

import Foundation

// MARK: - APIParameterConvertible

/// Means that the type can be converted to an interface parameter for requesting an api.
protocol APIParameterConvertible {
    /// Converts the target to an Encodable-compliant type.
    var toParameters: AnyAPIParameter { get }
}

// MARK: - Array + APIParameterConvertible

extension Array: APIParameterConvertible {
    /// For `[AnyObject]` arrays, or a mixed array with very complex elements.
    var toParameters: AnyAPIParameter {
        let filtered = (self as [Any?]).compactMap { $0 }

        let result: [AnyAPIParameter] = filtered.compactMap {
            if let value = $0 as? AnyAPIParameter { return value }
            if let value = $0 as? (any APIParameter) { return .init(value) }
            if let value = $0 as? APIParameterConvertible { return value.toParameters }
            return mapAnyObjectToEncodable($0 as AnyObject)
        }

        assert(
            filtered.count == result.count,
            "There are elements in the container type that are not nil that cannot be converted to AnyAPIParameter type. This behavior will cause the parameter to be discarded and not sent to the server. This behavior is usually dangerous and needs to be fixed, please check your code!"
        )

        return .init(result)
    }
}

// MARK: - Dictionary + APIParameterConvertible

extension Dictionary: APIParameterConvertible where Key == String {
    /// For a `[String: AnyObject]` dictionary, or a mixed dictionary with very complex elements.
    var toParameters: AnyAPIParameter {
        let filtered = (self as [String: Any?]).compactMapValues { $0 }

        let result: [String: AnyAPIParameter] = filtered.compactMapValues {
            if let value = $0 as? AnyAPIParameter { return value }
            if let value = $0 as? (any APIParameter) { return .init(value) }
            if let value = $0 as? APIParameterConvertible { return value.toParameters }

            if let value = $0 as? (any RawRepresentable) {
                return mapAnyObjectToEncodable(value.rawValue as AnyObject)
            }
            return mapAnyObjectToEncodable($0 as AnyObject)
        }

        assert(
            filtered.count == result.count,
            "There are elements in the container type that are not nil that cannot be converted to AnyAPIParameter type. This behavior will cause the parameter to be discarded and not sent to the server. This behavior is usually dangerous and needs to be fixed, please check your code!"
        )
        
        return .init(result)
    }
}

// MARK: - Tools

extension APIParameterConvertible {
    fileprivate func mapAnyObjectToEncodable(_ value: AnyObject) -> AnyAPIParameter? {
        if let result = value as? String { return .init(result) }
        if let result = value as? Character { return .init(String(result)) }
        if let result = value as? Int { return .init(result) }
        if let result = value as? UInt { return .init(result) }
        if let result = value as? Double { return .init(result) }
        if let result = value as? Float { return .init(result) }
        if let result = value as? Bool { return .init(result) }
        if let result = value as? Data { return .init(result) }
        if let result = value as? Date { return .init(result) }
        if let result = value as? [String: Any] { return result.toParameters }
        if let result = value as? [Any] { return result.toParameters }

        return nil
    }
}
