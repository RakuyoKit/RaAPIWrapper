//
//  API+AF.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/19.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

#if !COCOAPODS
import APIWrapper
#endif

let parameterEncodingKey = "af_parameter_encoding"

extension API {
    public convenience init(
        wrappedValue: ParameterBuilder?,
        _ path: String,
        specialBaseURL: URL? = nil,
        header: HeaderBuilder? = nil,
        parameterEncoding: AnyAPIParameterEncoding,
        userInfo: APIRequestUserInfo = [:]
    ) {
        var _userInfo = userInfo
        _userInfo[parameterEncodingKey] = parameterEncoding

        self.init(
            wrappedValue: wrappedValue,
            path,
            specialBaseURL: specialBaseURL,
            header: header,
            userInfo: _userInfo
        )
    }
}

extension API {
    /// Encoding of `Parameters`.
    public var parameterEncoding: AnyAPIParameterEncoding? {
        userInfo[parameterEncodingKey] as? AnyAPIParameterEncoding
    }
}
