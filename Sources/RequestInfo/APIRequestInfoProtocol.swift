//
//  APIRequestInfoProtocol.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

public protocol APIRequestInfoProtocol: BaseAPIInfoProtocol, Hashable {
    /// API header
    var header: APIHeaders? { get }
    
    /// Parameters of the requested api
    var parameters: AnyAPIHashableParameter? { get }
}
