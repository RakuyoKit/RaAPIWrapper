//
//  Define.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

import Alamofire

/// Type representing HTTP methods.
public typealias APIHTTPMethod = Alamofire.HTTPMethod

/// API header.
public typealias APIHeaders = [String: String]

/// API parameters.
public typealias APIParameters = AnyAPIHashableParameter.Input

/// Encoding of `Parameters`.
public typealias APIParameterEncoding = Alamofire.ParameterEncoding
