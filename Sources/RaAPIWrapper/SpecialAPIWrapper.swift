//
//  SpecialAPIWrapper.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

/// Encapsulates the data needed to request the `POST` api.
@propertyWrapper
public final class POST<Parameter>: APIWrapper<Parameter> {
    public init(
        _ path: String,
        specialBaseURL: URL? = nil,
        header: HeaderBuilder? = nil,
        parameter: ParameterBuilder? = nil,
        parameterEncoding: ParameterEncoding? = nil
    ) {
        super.init(
            path: path,
            specialBaseURL: specialBaseURL,
            method: .post,
            header: header,
            parameter: parameter,
            parameterEncoding: parameterEncoding
        )
    }
    
    public override var wrappedValue: (Parameter) -> APIRequestInfo {
        super.wrappedValue
    }
}

/// Encapsulates the data needed to request the `GET` api.
@propertyWrapper
public final class GET<Parameter>: APIWrapper<Parameter> {
    public init(
        _ path: String,
        specialBaseURL: URL? = nil,
        header: HeaderBuilder? = nil,
        parameter: ParameterBuilder? = nil,
        parameterEncoding: ParameterEncoding? = nil
    ) {
        super.init(
            path: path,
            specialBaseURL: specialBaseURL,
            method: .get,
            header: header,
            parameter: parameter,
            parameterEncoding: parameterEncoding
        )
    }
    
    public override var wrappedValue: (Parameter) -> APIRequestInfo {
        super.wrappedValue
    }
}
