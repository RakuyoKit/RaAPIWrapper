//
//  APIRequestInfo.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

/// Information needed to request the api
public struct APIRequestInfo: APIInfoProtocol {
    /// The path to the requested api
    public let path: String
    
    /// Mapping model of the data returned by the api.
    public let decodeType: Decodable?
    
    /// A special api base url.
    ///
    /// Should be a setting item independent of your global configuration.
    public let specialBaseURL: URL?
    
    /// Type representing HTTP methods
    public let method: APIHTTPMethod
    
    /// API header
    public let header: APIHeaders?
    
    /// Parameters of the requested api
    public let parameters: APIParameters?
    
    /// Encoding of `parameters`
    public let parameterEncoding: APIParameterEncoding?
    
    public init(
        path: String,
        decodeType: Decodable? = nil,
        specialBaseURL: URL? = nil,
        method: APIHTTPMethod,
        header: APIHeaders? = nil,
        parameters: APIParameters? = nil,
        parameterEncoding: APIParameterEncoding? = nil
    ) {
        self.path = path
        self.decodeType = decodeType
        self.specialBaseURL = specialBaseURL
        self.method = method
        self.header = header
        self.parameters = parameters
        self.parameterEncoding = parameterEncoding
    }
}
