//
//  POST.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/26.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

fileprivate var _method: APIHTTPMethod = .post

/// Encapsulates the data needed to request the `POST` api.
@propertyWrapper
public final class POST<A>: API<A> {
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var projectedValue: POST<A> { self }
    
    public override var wrappedValue: (A) -> APIRequestInfo { super.wrappedValue }
}

/// Encapsulates the data needed to request the `POST` api.
@propertyWrapper
public final class POST2<A, B>: API2<A, B> {
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var projectedValue: POST2<A, B> { self }
    
    public override var wrappedValue: (A, B) -> APIRequestInfo { super.wrappedValue }
}

/// Encapsulates the data needed to request the `POST` api.
@propertyWrapper
public final class POST3<A, B, C>: API3<A, B, C> {
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var projectedValue: POST3<A, B, C> { self }
    
    public override var wrappedValue: (A, B, C) -> APIRequestInfo { super.wrappedValue }
}

/// Encapsulates the data needed to request the `POST` api.
@propertyWrapper
public final class POST4<A, B, C, D>: API4<A, B, C, D> {
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var projectedValue: POST4<A, B, C, D> { self }
    
    public override var wrappedValue: (A, B, C, D) -> APIRequestInfo { super.wrappedValue }
}

/// Encapsulates the data needed to request the `POST` api.
@propertyWrapper
public final class POST5<A, B, C, D, E>: API5<A, B, C, D, E> {
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var projectedValue: POST5<A, B, C, D, E> { self }
    
    public override var wrappedValue: (A, B, C, D, E) -> APIRequestInfo { super.wrappedValue }
}

/// Encapsulates the data needed to request the `POST` api.
@propertyWrapper
public final class POST6<A, B, C, D, E, F>: API6<A, B, C, D, E, F> {
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var projectedValue: POST6<A, B, C, D, E, F> { self }
    
    public override var wrappedValue: (A, B, C, D, E, F) -> APIRequestInfo { super.wrappedValue }
}

/// Encapsulates the data needed to request the `POST` api.
@propertyWrapper
public final class POST7<A, B, C, D, E, F, G>: API7<A, B, C, D, E, F, G> {
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var projectedValue: POST7<A, B, C, D, E, F, G> { self }
    
    public override var wrappedValue: (A, B, C, D, E, F, G) -> APIRequestInfo { super.wrappedValue }
}

/// Encapsulates the data needed to request the `POST` api.
@propertyWrapper
public final class POST8<A, B, C, D, E, F, G, H>: API8<A, B, C, D, E, F, G, H> {
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var projectedValue: POST8<A, B, C, D, E, F, G, H> { self }
    
    public override var wrappedValue: (A, B, C, D, E, F, G, H) -> APIRequestInfo { super.wrappedValue }
}
