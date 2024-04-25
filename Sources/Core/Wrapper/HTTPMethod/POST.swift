//
//  POST.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/26.
//  Copyright © 2024 RakuyoKit. All rights reserved.
//

import Foundation

// MARK: - PostHTTPMethod

public enum PostHTTPMethod: APIHTTPMethodWrapper {
    public static var httpMethod: APIHTTPMethod { "POST" }
}

/// Encapsulates the data needed to request the `POST` api.
public typealias POST<Parameter> = API<Parameter, PostHTTPMethod>
