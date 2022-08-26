//
//  API.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

/// Indicates that the api does not require parameters
public typealias NoInputParameterBuilder = () -> APIParameter

/// Parameter constructor for the api. Supports passing one parameter.
public typealias APIParameterBuilder<ParamType> = (ParamType) -> APIParameter

open class BaseAPI<H, P>: APIInfoProtocol {
    public typealias HeaderBuilder = H
    public typealias ParameterBuilder = P
    
    /// Parameter constructor for the api.
    public var wrappedValue: ParameterBuilder?
    
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
    
    public init(
        wrappedValue: ParameterBuilder? = nil,
        _ path: String,
        specialBaseURL: URL? = nil,
        method: APIHTTPMethod? = nil,
        header: HeaderBuilder? = nil,
        parameterEncoding: APIParameterEncoding? = nil
    ) {
        self.wrappedValue = wrappedValue
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
open class API: BaseAPI<() -> APIHeaders, NoInputParameterBuilder> {
    public var projectedValue: API { self }
    
    public override var wrappedValue: ParameterBuilder? {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
    
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
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API1<A>: BaseAPI<(A) -> APIHeaders, APIParameterBuilder<A>> {
    public var projectedValue: API1<A> { self }
    
    public override var wrappedValue: ParameterBuilder? {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
    
    public func createRequestInfo(_ a: A) -> APIRequestInfo {
        return .init(
            path: self.path,
            specialBaseURL: self.specialBaseURL,
            method: self.method,
            header: self.headerBuilder?(a),
            parameters: self.wrappedValue?(a).toParameters,
            parameterEncoding: self.parameterEncoding
        )
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API2<A, B>: BaseAPI<(A, B) -> APIHeaders, (A, B) -> APIParameter> {
    public var projectedValue: API2<A, B> { self }

    public override var wrappedValue: ParameterBuilder? {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
    
    public func createRequestInfo(_ a: A, _ b: B) -> APIRequestInfo {
        return .init(
            path: self.path,
            specialBaseURL: self.specialBaseURL,
            method: self.method,
            header: self.headerBuilder?(a, b),
            parameters: self.wrappedValue?(a, b).toParameters,
            parameterEncoding: self.parameterEncoding
        )
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API3<A, B, C>: BaseAPI<(A, B, C) -> APIHeaders, (A, B, C) -> APIParameter> {
    public var projectedValue: API3<A, B, C> { self }

    public override var wrappedValue: ParameterBuilder? {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
    
    public func createRequestInfo(_ a: A, _ b: B, _ c: C) -> APIRequestInfo {
        return .init(
            path: self.path,
            specialBaseURL: self.specialBaseURL,
            method: self.method,
            header: self.headerBuilder?(a, b, c),
            parameters: self.wrappedValue?(a, b, c).toParameters,
            parameterEncoding: self.parameterEncoding
        )
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API4<A, B, C, D>: BaseAPI<(A, B, C, D) -> APIHeaders, (A, B, C, D) -> APIParameter> {
    public var projectedValue: API4<A, B, C, D> { self }

    public override var wrappedValue: ParameterBuilder? {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
    
    public func createRequestInfo(_ a: A, _ b: B, _ c: C, _ d: D) -> APIRequestInfo {
        return .init(
            path: self.path,
            specialBaseURL: self.specialBaseURL,
            method: self.method,
            header: self.headerBuilder?(a, b, c, d),
            parameters: self.wrappedValue?(a, b, c, d).toParameters,
            parameterEncoding: self.parameterEncoding
        )
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API5<A, B, C, D, E>: BaseAPI<(A, B, C, D, E) -> APIHeaders, (A, B, C, D, E) -> APIParameter> {
    public var projectedValue: API5<A, B, C, D, E> { self }

    public override var wrappedValue: ParameterBuilder? {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
    
    public func createRequestInfo(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E) -> APIRequestInfo {
        return .init(
            path: self.path,
            specialBaseURL: self.specialBaseURL,
            method: self.method,
            header: self.headerBuilder?(a, b, c, d, e),
            parameters: self.wrappedValue?(a, b, c, d, e).toParameters,
            parameterEncoding: self.parameterEncoding
        )
    }
}

/// API wrapper. Used to wrap the data needed to request an api.
@propertyWrapper
open class API6<A, B, C, D, E, F>: BaseAPI<(A, B, C, D, E, F) -> APIHeaders, (A, B, C, D, E, F) -> APIParameter> {
    public var projectedValue: API6<A, B, C, D, E, F> { self }

    public override var wrappedValue: ParameterBuilder? {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
    
    public func createRequestInfo(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F) -> APIRequestInfo {
        return .init(
            path: self.path,
            specialBaseURL: self.specialBaseURL,
            method: self.method,
            header: self.headerBuilder?(a, b, c, d, e, f),
            parameters: self.wrappedValue?(a, b, c, d, e, f).toParameters,
            parameterEncoding: self.parameterEncoding
        )
    }
}
