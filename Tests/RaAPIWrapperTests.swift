import XCTest
@testable import APIWrapper

struct TestAPI {
    
    @POST("/api/v1/api", parameter: {
        ["id": $0]
    })
    static var api: (_ id: Int) -> APIRequestInfo
    
    @POST2("/api/v1/two_param", parameter: {
        ["id": $0, "name": $1]
    })
    static var twoParamAPI: (_ id: Int, _ name: String) -> APIRequestInfo
    
    @POST("/api/v1/tuple_param", parameter: {
        ["id": $0.id, "name": $0.name]
    })
    static var tupleParamAPI: ((id: Int, name: String)) -> APIRequestInfo
    
    @POST("/api/v1/array_param", parameter: {
        $0
    })
    static var arrayParamAPI: (_ array: [String]) -> APIRequestInfo
    
    @GET("/api/v1/no_param")
    static var noParamAPI: (()) -> APIRequestInfo
}

final class RaAPIWrapperTests: XCTestCase {
    func testExample() throws {
        
        
        print(type(of: TestAPI.$arrayParamAPI).defaultMethod)
        
//        let info = TestAPI.arrayParamAPI(["123", "333"])
//
//        print(info.parameters)
        
//        TestAPI.hasParamAPI(0, "123")
        
        
//        TestAPI.$arrayParamAPI.
        
        func foo(a: String, b: String) -> String {
            return ""
        }
        
        
        
        
    }
}
