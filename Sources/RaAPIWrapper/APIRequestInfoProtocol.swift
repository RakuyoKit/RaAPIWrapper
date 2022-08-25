//
//  APIRequestInfoProtocol.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

import Alamofire

/// Describe the data needed for an api
public protocol APIRequestInfoProtocol {
    /// Type representing HTTP methods
    typealias HTTPMethod = Alamofire.HTTPMethod
    
    /// API header
    typealias Header = [String: String]
    
    /// API parameters
    typealias Parameters = Encodable
    
    /// Encoding of `Parameters`
    typealias ParameterEncoding = Alamofire.ParameterEncoding
    
    /// The path to the requested api
    var path: String { get }
    
    /// A special api base url.
    ///
    /// Should be a setting item independent of your global configuration.
    var specialBaseURL: URL? { get }
    
    /// Type representing HTTP methods
    var method: HTTPMethod { get }
    
    /// Encoding of `Parameters`
    var parameterEncoding: ParameterEncoding? { get }
}
