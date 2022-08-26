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
public final class POST: API {
    public override var projectedValue: POST { self }
    
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var wrappedValue: ParameterBuilder {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
}

/// Encapsulates the data needed to request the `POST` api.
@propertyWrapper
public final class POST1<A>: API1<A> {
    public override var projectedValue: POST1<A> { self }
    
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var wrappedValue: ParameterBuilder {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
}

/// Encapsulates the data needed to request the `POST` api.
@propertyWrapper
public final class POST2<A, B>: API2<A, B> {
    public override var projectedValue: POST2<A, B> { self }
    
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var wrappedValue: ParameterBuilder {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
}

/// Encapsulates the data needed to request the `POST` api.
@propertyWrapper
public final class POST3<A, B, C>: API3<A, B, C> {
    public override var projectedValue: POST3<A, B, C> { self }
    
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var wrappedValue: ParameterBuilder {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
}

/// Encapsulates the data needed to request the `POST` api.
@propertyWrapper
public final class POST4<A, B, C, D>: API4<A, B, C, D> {
    public override var projectedValue: POST4<A, B, C, D> { self }
    
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var wrappedValue: ParameterBuilder {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
}

/// Encapsulates the data needed to request the `POST` api.
@propertyWrapper
public final class POST5<A, B, C, D, E>: API5<A, B, C, D, E> {
    public override var projectedValue: POST5<A, B, C, D, E> { self }
    
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var wrappedValue: ParameterBuilder {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
}

/// Encapsulates the data needed to request the `POST` api.
@propertyWrapper
public final class POST6<A, B, C, D, E, F>: API6<A, B, C, D, E, F> {
    public override var projectedValue: POST6<A, B, C, D, E, F> { self }
    
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var wrappedValue: ParameterBuilder {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
}
