import XCTest
@testable import APIWrapper

struct TestAPI {
    @POST("/api/v1/tuple_param")
    static var tupleParamAPI: APIParameterBuilder<(id: Int, name: String)>? = {
        ["id": $0.id, "name": $0.name]
    }
}

final class RaAPIWrapperTests: XCTestCase {
    func testExample() throws {
        print(TestAPI.$tupleParamAPI.createRequestInfo((id: 1, name: "String")))
        
        TestAPI.$tupleParamAPI.request(params: (id: 1, name: "String"))

    }
}

extension API {
    func request(params: Parameter) {
        let info = createRequestInfo(params)
        
        print(info)
    }
}
