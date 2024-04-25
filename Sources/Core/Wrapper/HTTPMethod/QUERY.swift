//
//  QUERY.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

// MARK: - QueryHTTPMethod

public enum QueryHTTPMethod: APIHTTPMethodWrapper {
    public static var httpMethod: APIHTTPMethod { "QUERY" }
}

/// Encapsulates the data needed to request the `QUERY` api.
public typealias QUERY<Parameter> = API<Parameter, QueryHTTPMethod>
