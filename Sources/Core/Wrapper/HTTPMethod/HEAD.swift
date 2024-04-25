//
//  HEAD.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2024 RakuyoKit. All rights reserved.
//

import Foundation

// MARK: - HeadHTTPMethod

public enum HeadHTTPMethod: APIHTTPMethodWrapper {
    public static var httpMethod: APIHTTPMethod { "HEAD" }
}

/// Encapsulates the data needed to request the `HEAD` api.
public typealias HEAD<Parameter> = API<Parameter, HeadHTTPMethod>
