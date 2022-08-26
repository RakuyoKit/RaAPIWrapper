//
//  API.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

open class BaseAPI<H>: APIInfoProtocol {
    public typealias HeaderBuilder = H
    
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
    
    /// Default request method.
    ///
    /// API wrapped with this type will uniformly use this method for requests.
    ///
    /// You can configure the request method uniformly with this property in the `API` subclass.
    open class var defaultMethod: APIHTTPMethod? { nil }
    
    fileprivate init(
        path: String,
        specialBaseURL: URL? = nil,
        method: APIHTTPMethod? = nil,
        header: HeaderBuilder? = nil,
        parameterEncoding: APIParameterEncoding? = nil
    ) {
        self.specialBaseURL = specialBaseURL
        self.path = path
        self.headerBuilder = header
        self.parameterEncoding = parameterEncoding
        
        let _method = Self.defaultMethod ?? method
        
        assert(_method != nil,
               "No request method specified! Please set the request method via the `defaultMethod` property or the `init.method` parameter.")
        
        self.method = _method!
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API: BaseAPI<() -> APIHeaders> {
    public typealias ParameterBuilder = () -> Void
    
    public var projectedValue: API { self }
    
    public var wrappedValue: ParameterBuilder
    
    public func createRequestInfo() -> APIRequestInfo {
        return .init(
            path: self.path,
            specialBaseURL: self.specialBaseURL,
            method: self.method,
            header: self.headerBuilder?(),
            parameters: nil,
            parameterEncoding: self.parameterEncoding
        )
    }
    
    public init(
        wrappedValue: @escaping ParameterBuilder,
        _ path: String,
        specialBaseURL: URL? = nil,
        method: APIHTTPMethod? = nil,
        header: HeaderBuilder? = nil,
        parameterEncoding: APIParameterEncoding? = nil
    ) {
        self.wrappedValue = wrappedValue
        super.init(path: path, specialBaseURL: specialBaseURL, method: method, header: header, parameterEncoding: parameterEncoding)
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API1<A>: BaseAPI<(A) -> APIHeaders> {
    public typealias ParameterBuilder = (A) -> APIParameter
    
    public var projectedValue: API1<A> { self }
    
    public var wrappedValue: ParameterBuilder
    
    public func createRequestInfo(_ a: A) -> APIRequestInfo {
        return .init(
            path: self.path,
            specialBaseURL: self.specialBaseURL,
            method: self.method,
            header: self.headerBuilder?(a),
            parameters: self.wrappedValue(a).toParameters,
            parameterEncoding: self.parameterEncoding
        )
    }
    
    public init(
        wrappedValue: @escaping ParameterBuilder,
        _ path: String,
        specialBaseURL: URL? = nil,
        method: APIHTTPMethod? = nil,
        header: HeaderBuilder? = nil,
        parameterEncoding: APIParameterEncoding? = nil
    ) {
        self.wrappedValue = wrappedValue
        super.init(path: path, specialBaseURL: specialBaseURL, method: method, header: header, parameterEncoding: parameterEncoding)
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API2<A, B>: BaseAPI<(A, B) -> APIHeaders> {
    public typealias ParameterBuilder = (A, B) -> APIParameter
    
    public var projectedValue: API2<A, B> { self }

    public var wrappedValue: ParameterBuilder
    
    public func createRequestInfo(_ a: A, _ b: B) -> APIRequestInfo {
        return .init(
            path: self.path,
            specialBaseURL: self.specialBaseURL,
            method: self.method,
            header: self.headerBuilder?(a, b),
            parameters: self.wrappedValue(a, b).toParameters,
            parameterEncoding: self.parameterEncoding
        )
    }
    
    public init(
        wrappedValue: @escaping ParameterBuilder,
        _ path: String,
        specialBaseURL: URL? = nil,
        method: APIHTTPMethod? = nil,
        header: HeaderBuilder? = nil,
        parameterEncoding: APIParameterEncoding? = nil
    ) {
        self.wrappedValue = wrappedValue
        super.init(path: path, specialBaseURL: specialBaseURL, method: method, header: header, parameterEncoding: parameterEncoding)
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API3<A, B, C>: BaseAPI<(A, B, C) -> APIHeaders> {
    public typealias ParameterBuilder = (A, B, C) -> APIParameter
    
    public var projectedValue: API3<A, B, C> { self }

    public var wrappedValue: ParameterBuilder
    
    public func createRequestInfo(_ a: A, _ b: B, _ c: C) -> APIRequestInfo {
        return .init(
            path: self.path,
            specialBaseURL: self.specialBaseURL,
            method: self.method,
            header: self.headerBuilder?(a, b, c),
            parameters: self.wrappedValue(a, b, c).toParameters,
            parameterEncoding: self.parameterEncoding
        )
    }
    
    public init(
        wrappedValue: @escaping ParameterBuilder,
        _ path: String,
        specialBaseURL: URL? = nil,
        method: APIHTTPMethod? = nil,
        header: HeaderBuilder? = nil,
        parameterEncoding: APIParameterEncoding? = nil
    ) {
        self.wrappedValue = wrappedValue
        super.init(path: path, specialBaseURL: specialBaseURL, method: method, header: header, parameterEncoding: parameterEncoding)
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API4<A, B, C, D>: BaseAPI<(A, B, C, D) -> APIHeaders> {
    public typealias ParameterBuilder = (A, B, C, D) -> APIParameter
    
    public var projectedValue: API4<A, B, C, D> { self }

    public var wrappedValue: ParameterBuilder
    
    public func createRequestInfo(_ a: A, _ b: B, _ c: C, _ d: D) -> APIRequestInfo {
        return .init(
            path: self.path,
            specialBaseURL: self.specialBaseURL,
            method: self.method,
            header: self.headerBuilder?(a, b, c, d),
            parameters: self.wrappedValue(a, b, c, d).toParameters,
            parameterEncoding: self.parameterEncoding
        )
    }
    
    public init(
        wrappedValue: @escaping ParameterBuilder,
        _ path: String,
        specialBaseURL: URL? = nil,
        method: APIHTTPMethod? = nil,
        header: HeaderBuilder? = nil,
        parameterEncoding: APIParameterEncoding? = nil
    ) {
        self.wrappedValue = wrappedValue
        super.init(path: path, specialBaseURL: specialBaseURL, method: method, header: header, parameterEncoding: parameterEncoding)
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API5<A, B, C, D, E>: BaseAPI<(A, B, C, D, E) -> APIHeaders> {
    public typealias ParameterBuilder = (A, B, C, D, E) -> APIParameter
    
    public var projectedValue: API5<A, B, C, D, E> { self }

    public var wrappedValue: ParameterBuilder
    
    public func createRequestInfo(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E) -> APIRequestInfo {
        return .init(
            path: self.path,
            specialBaseURL: self.specialBaseURL,
            method: self.method,
            header: self.headerBuilder?(a, b, c, d, e),
            parameters: self.wrappedValue(a, b, c, d, e).toParameters,
            parameterEncoding: self.parameterEncoding
        )
    }
    
    public init(
        wrappedValue: @escaping ParameterBuilder,
        _ path: String,
        specialBaseURL: URL? = nil,
        method: APIHTTPMethod? = nil,
        header: HeaderBuilder? = nil,
        parameterEncoding: APIParameterEncoding? = nil
    ) {
        self.wrappedValue = wrappedValue
        super.init(path: path, specialBaseURL: specialBaseURL, method: method, header: header, parameterEncoding: parameterEncoding)
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API6<A, B, C, D, E, F>: BaseAPI<(A, B, C, D, E, F) -> APIHeaders> {
    public typealias ParameterBuilder = (A, B, C, D, E, F) -> APIParameter
    
    public var projectedValue: API6<A, B, C, D, E, F> { self }

    public var wrappedValue: ParameterBuilder
    
    public func createRequestInfo(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F) -> APIRequestInfo {
        return .init(
            path: self.path,
            specialBaseURL: self.specialBaseURL,
            method: self.method,
            header: self.headerBuilder?(a, b, c, d, e, f),
            parameters: self.wrappedValue(a, b, c, d, e, f).toParameters,
            parameterEncoding: self.parameterEncoding
        )
    }
    
    public init(
        wrappedValue: @escaping ParameterBuilder,
        _ path: String,
        specialBaseURL: URL? = nil,
        method: APIHTTPMethod? = nil,
        header: HeaderBuilder? = nil,
        parameterEncoding: APIParameterEncoding? = nil
    ) {
        self.wrappedValue = wrappedValue
        super.init(path: path, specialBaseURL: specialBaseURL, method: method, header: header, parameterEncoding: parameterEncoding)
    }
}
