//
//  PUT.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

// MARK: - PutHTTPMethod

public enum PutHTTPMethod: APIHTTPMethodWrapper {
    public static var httpMethod: APIHTTPMethod { "PUT" }
}

/// Encapsulates the data needed to request the `PUT` api.
public typealias PUT<Parameter> = API<Parameter, PutHTTPMethod>
