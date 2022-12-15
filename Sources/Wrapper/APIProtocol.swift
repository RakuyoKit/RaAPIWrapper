//
//  APIProtocol.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

public protocol APIProtocol: BaseAPIInfoProtocol {
    associatedtype Parameter
    
    /// Parameter constructor for the api.
    var wrappedValue: APIParameterBuilder<Parameter>? { get }
    
    /// Used to construct the api request header
    var headerBuilder: ((Parameter) -> APIHeaders)? { get }
}
