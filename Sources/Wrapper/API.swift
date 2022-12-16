//
//  API.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

/// Parameter constructor for the api. Supports passing one parameter.
public typealias APIParameterBuilder<ParamType> = (ParamType) -> APIParameterConvertible

/// Used to encapsulate the `APIHTTPMethod` object provided to the `API`.
public protocol APIHTTPMethodWrapper {
    static var httpMethod: APIHTTPMethod { get }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
public struct API<Parameter, HTTPMethod: APIHTTPMethodWrapper> {
    public typealias HeaderBuilder = (Parameter) -> APIHeaders
    
    public typealias ParameterBuilder = APIParameterBuilder<Parameter>
    
    /// Enables you to access `@propertyWrapper` objects via the `$` symbol.
    public var projectedValue: API<Parameter, HTTPMethod> { self }
    
    /// Parameter constructor for the api.
    public var wrappedValue: ParameterBuilder?
    
    /// A special api base url.
    ///
    /// Should be a setting item independent of your global configuration.
    public let specialBaseURL: URL?
    
    /// The path to the requested api.
    public let path: String
    
    /// Used to construct the api request header.
    public let headerBuilder: HeaderBuilder?
    
    /// Encoding of `Parameters`.
    public let parameterEncoding: AnyAPIParameterEncoding?
    
    /// An additional storage space.
    /// You can use this property to store some custom data.
    public let userInfo: APIRequestUserInfo
    
    public init(
        wrappedValue: ParameterBuilder?,
        _ path: String,
        specialBaseURL: URL? = nil,
        header: HeaderBuilder? = nil,
        parameterEncoding: AnyAPIParameterEncoding? = nil,
        userInfo: APIRequestUserInfo = [:]
    ) {
        self.wrappedValue = wrappedValue
        self.path = path
        self.specialBaseURL = specialBaseURL
        self.headerBuilder = header
        self.parameterEncoding = parameterEncoding
        self.userInfo = userInfo
    }
}

public extension API {
    /// The HTTP method to use when requesting the api.
    ///
    /// Open this property so that you can access the request method
    /// directly through the `@propertyWrapper` object.
    static var httpMethod: HTTPMethod.Type { HTTPMethod.self }
    
    /// Creates an `APIRequestInfo` object.
    ///
    /// Used to generate the final, minimal api data.
    func createRequestInfo(_ parameter: Parameter) -> APIRequestInfo {
        return .init(
            path: path,
            specialBaseURL: specialBaseURL,
            httpMethod: Self.httpMethod.httpMethod,
            header: headerBuilder?(parameter),
            parameters: wrappedValue?(parameter).toParameters,
            parameterEncoding: parameterEncoding,
            userInfo: userInfo
        )
    }
}
