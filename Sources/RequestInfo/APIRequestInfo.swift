//
//  APIRequestInfo.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

/// Information needed to request the api
open class APIRequestInfo: APIInfoProtocol {
    /// The path to the requested api
    public let path: String
    
    /// A special api base url.
    ///
    /// Should be a setting item independent of your global configuration.
    public let specialBaseURL: URL?
    
    /// Type representing HTTP methods
    public let method: APIHTTPMethod
    
    /// API header
    public let header: APIHeaders?
    
    /// Parameters of the requested api
    public let parameters: APIParameters?
    
    /// Encoding of `parameters`
    public let parameterEncoding: APIParameterEncoding?
    
    public init(
        path: String,
        specialBaseURL: URL?,
        method: APIHTTPMethod,
        header: APIHeaders?,
        parameters: APIParameters?,
        parameterEncoding: APIParameterEncoding?
    ) {
        self.path = path
        self.specialBaseURL = specialBaseURL
        self.method = method
        self.header = header
        self.parameters = parameters
        self.parameterEncoding = parameterEncoding
    }
}

// MARK: - Hashable

extension APIRequestInfo: Hashable {
    public static func == (lhs: APIRequestInfo, rhs: APIRequestInfo) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

// MARK: - CustomStringConvertible

extension APIRequestInfo: CustomStringConvertible {
    public var description: String {
        "specialBaseURL: \(specialBaseURL?.absoluteString ?? "nil"); path: \(path); method: \(method.rawValue); header: \(header?.description ?? "nil"); parameters: \(String(describing: parameters)); parameterEncoding: \(String(describing: parameterEncoding))"
    }
}
