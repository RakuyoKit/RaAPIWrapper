//
//  CONNECT.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

public enum ConnectHTTPMethod: APIHTTPMethodWrapper {
    public static var httpMethod: APIHTTPMethod { "CONNECT" }
}

/// Encapsulates the data needed to request the `CONNECT` api.
public typealias CONNECT<Parameter> = API<Parameter, ConnectHTTPMethod>
