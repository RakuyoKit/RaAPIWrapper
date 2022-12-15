//
//  APIInfoProtocol.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

import Alamofire

/// Describe the data needed for an api.
public protocol BaseAPIInfoProtocol {
    /// The path to the requested api.
    var path: String { get }
    
    /// A special api base url.
    ///
    /// Should be a setting item independent of your global configuration.
    var specialBaseURL: URL? { get }
    
    /// Type representing HTTP methods.
    var method: APIHTTPMethod { get }
    
    /// Encoding of `Parameters`.
    var parameterEncoding: AnyAPIHashableParameterEncoding? { get }
}
