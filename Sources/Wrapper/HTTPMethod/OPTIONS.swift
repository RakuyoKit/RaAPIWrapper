//
//  OPTIONS.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

public enum OptionsHTTPMethod: APIHTTPMethodWrapper {
    public static var httpMethod: APIHTTPMethod { "OPTIONS" }
}

/// Encapsulates the data needed to request the `OPTIONS` api.
public typealias OPTIONS<Parameter> = API<Parameter, OptionsHTTPMethod>
