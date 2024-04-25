//
//  TRACE.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

// MARK: - TraceHTTPMethod

public enum TraceHTTPMethod: APIHTTPMethodWrapper {
    public static var httpMethod: APIHTTPMethod { "TRACE" }
}

/// Encapsulates the data needed to request the `TRACE` api.
public typealias TRACE<Parameter> = API<Parameter, TraceHTTPMethod>
