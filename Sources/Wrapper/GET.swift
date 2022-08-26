//
//  GET.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/26.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

fileprivate var _method: APIHTTPMethod = .get

/// Encapsulates the data needed to request the `GET` api.
@propertyWrapper
public final class GET<A>: API<A> {
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var projectedValue: GET<A> { self }
    
    public override var wrappedValue: (A) -> APIRequestInfo { super.wrappedValue }
}

/// Encapsulates the data needed to request the `GET` api.
@propertyWrapper
public final class GET2<A, B>: API2<A, B> {
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var projectedValue: GET2<A, B> { self }
    
    public override var wrappedValue: (A, B) -> APIRequestInfo { super.wrappedValue }
}

/// Encapsulates the data needed to request the `GET` api.
@propertyWrapper
public final class GET3<A, B, C>: API3<A, B, C> {
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var projectedValue: GET3<A, B, C> { self }
    
    public override var wrappedValue: (A, B, C) -> APIRequestInfo { super.wrappedValue }
}

/// Encapsulates the data needed to request the `GET` api.
@propertyWrapper
public final class GET4<A, B, C, D>: API4<A, B, C, D> {
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var projectedValue: GET4<A, B, C, D> { self }
    
    public override var wrappedValue: (A, B, C, D) -> APIRequestInfo { super.wrappedValue }
}

/// Encapsulates the data needed to request the `GET` api.
@propertyWrapper
public final class GET5<A, B, C, D, E>: API5<A, B, C, D, E> {
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var projectedValue: GET5<A, B, C, D, E> { self }
    
    public override var wrappedValue: (A, B, C, D, E) -> APIRequestInfo { super.wrappedValue }
}

/// Encapsulates the data needed to request the `GET` api.
@propertyWrapper
public final class GET6<A, B, C, D, E, F>: API6<A, B, C, D, E, F> {
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var projectedValue: GET6<A, B, C, D, E, F> { self }
    
    public override var wrappedValue: (A, B, C, D, E, F) -> APIRequestInfo { super.wrappedValue }
}

/// Encapsulates the data needed to request the `GET` api.
@propertyWrapper
public final class GET7<A, B, C, D, E, F, G>: API7<A, B, C, D, E, F, G> {
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var projectedValue: GET7<A, B, C, D, E, F, G> { self }
    
    public override var wrappedValue: (A, B, C, D, E, F, G) -> APIRequestInfo { super.wrappedValue }
}

/// Encapsulates the data needed to request the `GET` api.
@propertyWrapper
public final class GET8<A, B, C, D, E, F, G, H>: API8<A, B, C, D, E, F, G, H> {
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var projectedValue: GET8<A, B, C, D, E, F, G, H> { self }
    
    public override var wrappedValue: (A, B, C, D, E, F, G, H) -> APIRequestInfo { super.wrappedValue }
}
