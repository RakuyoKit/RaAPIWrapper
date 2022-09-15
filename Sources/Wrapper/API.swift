//
//  API.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

/// Parameter constructor for the api. Supports passing one parameter.
public typealias APIParameterBuilder<ParamType> = (ParamType) -> APIParameter

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API<Parameter>: APIInfoProtocol {
    public typealias HeaderBuilder = (Parameter) -> APIHeaders
    
    public typealias ParameterBuilder = APIParameterBuilder<Parameter>
    
    /// Parameter constructor for the api.
    open var wrappedValue: ParameterBuilder?
    
    /// A special api base url.
    ///
    /// Should be a setting item independent of your global configuration.
    public let specialBaseURL: URL?
    
    /// The path to the requested api
    public let path: String
    
    /// Type representing HTTP methods
    public let method: APIHTTPMethod
    
    /// Used to construct the api request header
    public let headerBuilder: HeaderBuilder?
    
    /// Encoding of `Parameters`
    public let parameterEncoding: APIParameterEncoding?
    
    public init(
        wrappedValue: ParameterBuilder? = nil,
        _ path: String,
        specialBaseURL: URL? = nil,
        method: APIHTTPMethod? = nil,
        header: HeaderBuilder? = nil,
        parameterEncoding: APIParameterEncoding? = nil
    ) {
        self.wrappedValue = wrappedValue
        self.path = path
        self.specialBaseURL = specialBaseURL
        self.headerBuilder = header
        self.parameterEncoding = parameterEncoding
        
        let _method = Self.defaultMethod ?? method
        assert(_method != nil,
               "No request method specified! Please set the request method via the `defaultMethod` property or the `init.method` parameter.")
        
        self.method = _method!
    }
    
    /// Default request method.
    ///
    /// API wrapped with this type will uniformly use this method for requests.
    ///
    /// You can configure the request method uniformly with this property in the `API` subclass.
    open class var defaultMethod: APIHTTPMethod? { nil }
    
    ///
    open var projectedValue: API<Parameter> { self }
    
    ///
    open func createRequestInfo(_ parameter: Parameter) -> APIRequestInfo {
        return .init(
            path: self.path,
            specialBaseURL: self.specialBaseURL,
            method: self.method,
            header: self.headerBuilder?(parameter),
            parameters: self.wrappedValue?(parameter).toParameters,
            parameterEncoding: self.parameterEncoding
        )
    }
}

// MARK: - Hashable

extension API: Hashable {
    public static func == (lhs: API<Parameter>, rhs: API<Parameter>) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
