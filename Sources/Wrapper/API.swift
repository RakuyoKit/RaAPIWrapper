//
//  API.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

open class BaseAPI<HeaderBuilder, ParameterBuilder>: APIInfoProtocol {
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
    
    /// Used to construct the api request parameter
    public let parameterBuilder: ParameterBuilder?
    
    /// Encoding of `Parameters`
    public let parameterEncoding: APIParameterEncoding?
    
    /// Default request method.
    ///
    /// API wrapped with this type will uniformly use this method for requests.
    ///
    /// You can configure the request method uniformly with this property in the `API` subclass.
    open class var defaultMethod: APIHTTPMethod? { nil }
    
    public init(
        _ path: String,
        specialBaseURL: URL? = nil,
        method: APIHTTPMethod? = nil,
        header: HeaderBuilder? = nil,
        parameter: ParameterBuilder? = nil,
        parameterEncoding: APIParameterEncoding? = nil
    ) {
        self.specialBaseURL = specialBaseURL
        self.path = path
        self.headerBuilder = header
        self.parameterBuilder = parameter
        self.parameterEncoding = parameterEncoding
        
        let _method = Self.defaultMethod ?? method
        
        assert(_method != nil,
               "No request method specified! Please set the request method via the `defaultMethod` property or the `init.method` parameter.")
        
        self.method = _method!
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API<A>: BaseAPI<(A) -> APIHeaders, (A) -> APIParameter> {
    public var projectedValue: API<A> { self }
    
    open var wrappedValue: (A) -> APIRequestInfo {
        return {
            .init(
                path: self.path,
                specialBaseURL: self.specialBaseURL,
                method: self.method,
                header: self.headerBuilder?($0),
                parameters: self.parameterBuilder?($0).toParameters,
                parameterEncoding: self.parameterEncoding
            )
        }
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API2<A, B>: BaseAPI<(A, B) -> APIHeaders, (A, B) -> APIParameter> {
    public var projectedValue: API2<A, B> { self }
    
    open var wrappedValue: (A, B) -> APIRequestInfo {
        return {
            .init(
                path: self.path,
                specialBaseURL: self.specialBaseURL,
                method: self.method,
                header: self.headerBuilder?($0, $1),
                parameters: self.parameterBuilder?($0, $1).toParameters,
                parameterEncoding: self.parameterEncoding
            )
        }
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API3<A, B, C>: BaseAPI<(A, B, C) -> APIHeaders, (A, B, C) -> APIParameter> {
    public var projectedValue: API3<A, B, C> { self }
    
    open var wrappedValue: (A, B, C) -> APIRequestInfo {
        return {
            .init(
                path: self.path,
                specialBaseURL: self.specialBaseURL,
                method: self.method,
                header: self.headerBuilder?($0, $1, $2),
                parameters: self.parameterBuilder?($0, $1, $2).toParameters,
                parameterEncoding: self.parameterEncoding
            )
        }
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API4<A, B, C, D>: BaseAPI<(A, B, C, D) -> APIHeaders, (A, B, C, D) -> APIParameter> {
    public var projectedValue: API4<A, B, C, D> { self }
    
    open var wrappedValue: (A, B, C, D) -> APIRequestInfo {
        return {
            .init(
                path: self.path,
                specialBaseURL: self.specialBaseURL,
                method: self.method,
                header: self.headerBuilder?($0, $1, $2, $3),
                parameters: self.parameterBuilder?($0, $1, $2, $3).toParameters,
                parameterEncoding: self.parameterEncoding
            )
        }
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API5<A, B, C, D, E>: BaseAPI<(A, B, C, D, E) -> APIHeaders, (A, B, C, D, E) -> APIParameter> {
    public var projectedValue: API5<A, B, C, D, E> { self }
    
    open var wrappedValue: (A, B, C, D, E) -> APIRequestInfo {
        return {
            .init(
                path: self.path,
                specialBaseURL: self.specialBaseURL,
                method: self.method,
                header: self.headerBuilder?($0, $1, $2, $3, $4),
                parameters: self.parameterBuilder?($0, $1, $2, $3, $4).toParameters,
                parameterEncoding: self.parameterEncoding
            )
        }
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API6<A, B, C, D, E, F>: BaseAPI<(A, B, C, D, E, F) -> APIHeaders, (A, B, C, D, E, F) -> APIParameter> {
    public var projectedValue: API6<A, B, C, D, E, F> { self }
    
    open var wrappedValue: (A, B, C, D, E, F) -> APIRequestInfo {
        return {
            .init(
                path: self.path,
                specialBaseURL: self.specialBaseURL,
                method: self.method,
                header: self.headerBuilder?($0, $1, $2, $3, $4, $5),
                parameters: self.parameterBuilder?($0, $1, $2, $3, $4, $5).toParameters,
                parameterEncoding: self.parameterEncoding
            )
        }
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API7<A, B, C, D, E, F, G>: BaseAPI<(A, B, C, D, E, F, G) -> APIHeaders, (A, B, C, D, E, F, G) -> APIParameter> {
    public var projectedValue: API7<A, B, C, D, E, F, G> { self }
    
    open var wrappedValue: (A, B, C, D, E, F, G) -> APIRequestInfo {
        return {
            .init(
                path: self.path,
                specialBaseURL: self.specialBaseURL,
                method: self.method,
                header: self.headerBuilder?($0, $1, $2, $3, $4, $5, $6),
                parameters: self.parameterBuilder?($0, $1, $2, $3, $4, $5, $6).toParameters,
                parameterEncoding: self.parameterEncoding
            )
        }
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API8<A, B, C, D, E, F, G, H>: BaseAPI<(A, B, C, D, E, F, G, H) -> APIHeaders, (A, B, C, D, E, F, G, H) -> APIParameter> {
    public var projectedValue: API8<A, B, C, D, E, F, G, H> { self }
    
    open var wrappedValue: (A, B, C, D, E, F, G, H) -> APIRequestInfo {
        return {
            .init(
                path: self.path,
                specialBaseURL: self.specialBaseURL,
                method: self.method,
                header: self.headerBuilder?($0, $1, $2, $3, $4, $5, $6, $7),
                parameters: self.parameterBuilder?($0, $1, $2, $3, $4, $5, $6, $7).toParameters,
                parameterEncoding: self.parameterEncoding
            )
        }
    }
}
