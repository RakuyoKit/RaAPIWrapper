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
public final class GET: API {
    public override var projectedValue: GET { self }
    
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var wrappedValue: ParameterBuilder? {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
}

/// Encapsulates the data needed to request the `GET` api.
@propertyWrapper
public final class GET1<A>: API1<A> {
    public override var projectedValue: GET1<A> { self }
    
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var wrappedValue: ParameterBuilder? {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
}

/// Encapsulates the data needed to request the `GET` api.
@propertyWrapper
public final class GET2<A, B>: API2<A, B> {
    public override var projectedValue: GET2<A, B> { self }
    
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var wrappedValue: ParameterBuilder? {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
}

/// Encapsulates the data needed to request the `GET` api.
@propertyWrapper
public final class GET3<A, B, C>: API3<A, B, C> {
    public override var projectedValue: GET3<A, B, C> { self }
    
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var wrappedValue: ParameterBuilder? {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
}

/// Encapsulates the data needed to request the `GET` api.
@propertyWrapper
public final class GET4<A, B, C, D>: API4<A, B, C, D> {
    public override var projectedValue: GET4<A, B, C, D> { self }
    
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var wrappedValue: ParameterBuilder? {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
}

/// Encapsulates the data needed to request the `GET` api.
@propertyWrapper
public final class GET5<A, B, C, D, E>: API5<A, B, C, D, E> {
    public override var projectedValue: GET5<A, B, C, D, E> { self }
    
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var wrappedValue: ParameterBuilder? {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
}

/// Encapsulates the data needed to request the `GET` api.
@propertyWrapper
public final class GET6<A, B, C, D, E, F>: API6<A, B, C, D, E, F> {
    public override var projectedValue: GET6<A, B, C, D, E, F> { self }
    
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var wrappedValue: ParameterBuilder? {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
}
