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
        let param: (id: Int, name: String?) = (1, nil)
        let info = TestAPI.$tupleParamAPI.createRequestInfo(param)
        
        XCTAssertEqual(info.parameters, packToParameters(["id": 1]))
        XCTAssertNotEqual(info.parameters, packToParameters(["id": 1, "name": Optional.none]))
        
        XCTAssertEqual(info.httpMethod, PostHTTPMethod.httpMethod)
        XCTAssertEqual(info.path, TestAPI.path)
        XCTAssertNil(info.specialBaseURL)
        XCTAssertNil(info.parameterEncoding)
    }
    
    private func packToParameters(_ value: [String: Optional<Int>]) -> AnyAPIParameter {
        return .init(value.mapValues { AnyAPIParameter($0) })
    }
}

fileprivate struct TestAPI {
    static let path = "/api/v1/tuple_param"
    
    @POST(Self.path)
    static var tupleParamAPI: APIParameterBuilder<(id: Int, name: String?)>? = {
        ["id": $0.id, "name": $0.name] as [String: Any?]
    }
}
