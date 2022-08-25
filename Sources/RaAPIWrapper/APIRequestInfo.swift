//
//  APIRequestInfo.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

/// Information needed to request the api
public struct APIRequestInfo: APIRequestInfoProtocol {
    /// A special api base url.
    ///
    /// Should be a setting item independent of your global configuration.
    public let specialBaseURL: URL?
    
    /// The path to the requested api
    public let path: String
    
    /// Type representing HTTP methods
    public let method: HTTPMethod
    
    /// API header
    public let header: Header?
    
    /// Parameters of the requested api
    public let parameters: Parameters?
    
    /// Encoding of `parameters`
    public let parameterEncoding: ParameterEncoding?
}
