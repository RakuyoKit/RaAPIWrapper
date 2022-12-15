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
public struct API<Parameter, HTTPMethod: APIHTTPMethodWrapper> {
    public typealias HeaderBuilder = (Parameter) -> APIHeaders
    
    public typealias ParameterBuilder = APIParameterBuilder<Parameter>
    
    ///
    public var projectedValue: API<Parameter, HTTPMethod> { self }
    
    /// Parameter constructor for the api.
    public var wrappedValue: ParameterBuilder?
    
    /// A special api base url.
    ///
    /// Should be a setting item independent of your global configuration.
    public let specialBaseURL: URL?
    
    /// The path to the requested api
    public let path: String
    
    /// Used to construct the api request header
    public let headerBuilder: HeaderBuilder?
    
    /// Encoding of `Parameters`
    public let parameterEncoding: AnyAPIHashableParameterEncoding?
    
    ///
    public let userInfo: APIRequestUserInfo
    
    public init(
        wrappedValue: ParameterBuilder? = nil,
        _ path: String,
        specialBaseURL: URL? = nil,
        header: HeaderBuilder? = nil,
        parameterEncoding: AnyAPIHashableParameterEncoding? = nil,
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
    /// Type representing HTTP methods
    static var httpMethod: HTTPMethod.Type { HTTPMethod.self }
    
    ///
    func createRequestInfo(_ parameter: Parameter) -> APIRequestInfo {
        return .init(
            path: self.path,
            specialBaseURL: self.specialBaseURL,
            httpMethod: Self.httpMethod.httpMethod,
            header: self.headerBuilder?(parameter),
            parameters: self.wrappedValue?(parameter).toParameters,
            parameterEncoding: parameterEncoding,
            userInfo: userInfo
        )
    }
}
