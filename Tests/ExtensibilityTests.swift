//
//  ExtensibilityTests.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import XCTest
@testable import APIWrapper

final class ExtensibilityTests: XCTestCase {
    func testExample() throws {
        let info = TestAPI.$testAPI.createRequestInfo(())
        
        XCTAssertEqual(info.userInfo, ["mockType": MockType.someType])
        XCTAssertNotEqual(info.userInfo, [:])
    }
}

fileprivate struct TestAPI {
    @GET("/api/v1/tuple_param", mockType: .someType)
    static var testAPI: APIParameterBuilder<()>? = nil
}

enum MockType: Hashable {
    case someType
}

extension API {
    convenience init(
        wrappedValue: ParameterBuilder? = nil,
        _ path: String,
        mockType: MockType
    ) {
        self.init(wrappedValue: wrappedValue, path, userInfo: ["mockType": mockType])
    }
}
