//
//  HEAD.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

public enum HeadHTTPMethod: APIHTTPMethodWrapper {
    public static var httpMethod: APIHTTPMethod { "HEAD" }
}

/// Encapsulates the data needed to request the `HEAD` api.
public typealias HEAD<Parameter> = API<Parameter, HeadHTTPMethod>
