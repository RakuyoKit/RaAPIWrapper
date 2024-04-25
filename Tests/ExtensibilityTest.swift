//
//  ExtensibilityTest.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2024 RakuyoKit. All rights reserved.
//

import XCTest
@testable import APIWrapper

// MARK: - ExtensibilityTests

final class ExtensibilityTests: XCTestCase {
    func testExample() throws {
        let info = TestAPI.$testAPI.createRequestInfo(())

        XCTAssertEqual(info.userInfo, ["mockType": MockType.someType])
        XCTAssertNotEqual(info.userInfo, [:])
    }
}

// MARK: - TestAPI

private enum TestAPI {
    @GET("/api/v1/tuple_param", mockType: .someType)
    static var testAPI: APIParameterBuilder<()>? = nil
}

// MARK: - MockType

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
