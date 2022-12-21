//
//  PATCH.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

public enum PatchHTTPMethod: APIHTTPMethodWrapper {
    public static var httpMethod: APIHTTPMethod { "PATCH" }
}

/// Encapsulates the data needed to request the `PATCH` api.
public typealias PATCH<Parameter> = API<Parameter, PatchHTTPMethod>
