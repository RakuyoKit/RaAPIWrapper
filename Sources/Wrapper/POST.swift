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
public final class POST<Parameter>: API<Parameter> {
    public override var projectedValue: POST<Parameter> { self }
    
    public override class var defaultMethod: APIHTTPMethod? { _method }
    
    public override var wrappedValue: ParameterBuilder? {
        get { super.wrappedValue }
        set { super.wrappedValue = newValue }
    }
}
