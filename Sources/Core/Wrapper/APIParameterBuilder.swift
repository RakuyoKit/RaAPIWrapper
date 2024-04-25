//
//  APIParameterBuilder.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2023/01/13.
//  Copyright © 2024 RakuyoKit. All rights reserved.
//

import Foundation

// MARK: - APIParameterBuilder

public struct APIParameterBuilder<Input> {
    public typealias Output = any APIParameter

    public typealias ParameterBuilder = (Input) -> Output

    private let parameterBuild: ParameterBuilder

    public init(_ build: @escaping ParameterBuilder) {
        parameterBuild = build
    }
}

extension APIParameterBuilder {
    public init(_ build: @escaping (Input) -> [Any?]) {
        parameterBuild = { build($0).toParameters }
    }

    public init(_ build: @escaping (Input) -> [String: Any?]) {
        parameterBuild = { build($0).toParameters }
    }
}

extension APIParameterBuilder {
    func callAsFunction(_ input: Input) -> Output {
        parameterBuild(input)
    }
}
