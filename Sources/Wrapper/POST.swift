//
//  POST.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/26.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

public enum PostHTTPMethod: APIHTTPMethodWrapper {
    public static var httpMethod: APIHTTPMethod { "GET" }
}

/// Encapsulates the data needed to request the `POST` api.
public typealias POST<Parameter> = API<Parameter, PostHTTPMethod>
