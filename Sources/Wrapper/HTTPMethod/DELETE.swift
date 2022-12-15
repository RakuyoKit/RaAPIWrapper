//
//  DELETE.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

public enum DeleteHTTPMethod: APIHTTPMethodWrapper {
    public static var httpMethod: APIHTTPMethod { "DELETE" }
}

/// Encapsulates the data needed to request the `DELETE` api.
public typealias DELETE<Parameter> = API<Parameter, DeleteHTTPMethod>
