import XCTest
@testable import APIWrapper

struct TestAPI {
    @POST("/api/v1/no_param")
    static var noParamAPI: NoInputParameterBuilder? = nil
    
    @POST1("/api/v1/tuple_param")
    static var tupleParamAPI: APIParameterBuilder<(id: Int, name: String)>? = {
        ["id": $0.id, "name": $0.name]
    }
    
    @POST2("/api/v1/two_param")
    static var twoParamAPI: ((_ id: Int, _ name: String) -> APIParameter)? = {
        ["id": $0, "name": $1]
    }
    
    @POST1("/api/v1/array_param")
    static var arrayParamAPI: APIParameterBuilder<[String]>? = { $0 }
}

final class RaAPIWrapperTests: XCTestCase {
    func testExample() throws {
        print(TestAPI.$noParamAPI.createRequestInfo())
        
        print(TestAPI.$tupleParamAPI.createRequestInfo((id: 1, name: "String")))
        
        print(TestAPI.$twoParamAPI.createRequestInfo(0, "123"))
        
        print(TestAPI.$arrayParamAPI.createRequestInfo(["123"]))
    }
}
