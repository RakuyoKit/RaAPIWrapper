//
//  AvailabilityTests.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/26.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import XCTest
@testable import APIWrapper

final class AvailabilityTests: XCTestCase {
    func testExample() throws {
//        print(TestAPI.$tupleParamAPI.createRequestInfo((id: 1, name: "String")))
        
        TestAPI.$tupleParamAPI.request(params: (id: 1, name: nil))
    }
}

struct TestAPI {
    @POST("/api/v1/tuple_param")
    static var tupleParamAPI: APIParameterBuilder<(id: Int, name: String?)>? = {
        ["id": $0.id, "name": $0.name]
    }
}

extension API {
    func request(params: Parameter) {
        let info = createRequestInfo(params)
        
        print(info.parameters?.value)
    }
}
