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
public final class GET<Parameter>: API<Parameter> {
    public override var projectedValue: GET<Parameter> { self }
    
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var wrappedValue: ParameterBuilder? {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
}
