//
//  APIParameterBuilder.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2023/01/13.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

public struct APIParameterBuilder<Input> {
    public typealias Output = any APIParameter
    
    public typealias ParameterBuilder = (Input) -> Output
    
    private let parameterBuild: ParameterBuilder
    
    public init(_ build: @escaping ParameterBuilder) {
        self.parameterBuild = build
    }
}

public extension APIParameterBuilder {
    init(_ build: @escaping (Input) -> [Any?]) {
        self.parameterBuild = { build($0).toParameters }
    }
    
    init(_ build: @escaping (Input) -> [String: Any?]) {
        self.parameterBuild = { build($0).toParameters }
    }
}

extension APIParameterBuilder {
    func callAsFunction(_ input: Input) -> Output {
        return parameterBuild(input)
    }
}
