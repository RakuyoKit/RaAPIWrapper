import XCTest
@testable import RaAPIWrapper

struct TestAPI {
    @POST("", parameter: { ["id": $0.id, "name": $0.name] })
    static var hasParamAPI: ((id: Int, name: String)) -> APIRequestInfo
    
    @POST("", parameter: { $0 })
    static var arrayParamAPI: ([String]) -> APIRequestInfo
    
    @GET("", header: { _ in [:] })
    static var noParamAPI: (()) -> APIRequestInfo
}

final class RaAPIWrapperTests: XCTestCase {
    func testExample() throws {
        
        let info = TestAPI.arrayParamAPI(["123", "333"])
        
        print(info.parameters)
        
    }
}
