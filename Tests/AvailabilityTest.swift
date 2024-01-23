//
//  AvailabilityTest.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/26.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import XCTest
@testable import APIWrapper

final class AvailabilityTests: XCTestCase {
    func testTupleParamAPI() throws {
        let param: (id: Int, name: String?) = (1, nil)
        let info = TestAPI.$tupleParamAPI.createRequestInfo(param)
        
        // Verify that `nil` is filtered out in `info.parameters`
        XCTAssertEqual(info.parameters, packToParameters(["id": 1]))
        XCTAssertNotEqual(info.parameters, packToParameters(["id": 1, "name": Optional.none]))
        
        XCTAssertEqual(info.httpMethod, PostHTTPMethod.httpMethod)
        XCTAssertEqual(info.path, TestAPI.path)
        XCTAssertNil(info.specialBaseURL)
    }
    
    func testEnumParamAPI() throws {
        let info = TestAPI.$enumAPI.createRequestInfo(.one)
        
        XCTAssertEqual(info.parameters, packToParameters(["id": TestEnum.one.rawValue]))
    }
    
    private func packToParameters(_ value: [String: Int?]) -> AnyAPIParameter {
        return .init(value.mapValues { AnyAPIParameter($0) })
    }
}

fileprivate struct TestAPI {
    static let path = "/api/v1/tuple_param"
    
    @POST(Self.path)
    static var tupleParamAPI: APIParameterBuilder<(id: Int, name: String?)>? = .init {
        ["id": $0.id, "name": $0.name]
    }
    
    @POST(Self.path)
    static var test1API: APIParameterBuilder<(id: Int, name: String)>? = .init {
        ["id": $0.id, "name": $0.name]
    }
    
    @POST(Self.path)
    static var test2API: APIParameterBuilder<(id: String, name: String)>? = .init {
        ["id": $0.id, "name": $0.name]
    }
    
    @POST("/api/v1/enum_param")
    static var enumAPI: APIParameterBuilder<TestEnum>? = .init {
        ["id": $0]
    }
}
