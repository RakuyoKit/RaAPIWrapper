import PlaygroundSupport

import Foundation

import APIWrapper

/*:
 This example uses [Postman Echo](https://www.postman.com/postman/workspace/published-postman-templates/documentation/631643-f695cab7-6878-eb55-7943-ad88e1ccfd65?ctx=documentation) as the sample api.
 
 The return value of this api depends on the parameters and will return the parameters, headers and other data as is.
 */

//: To begin by showing some of the most basic uses, look at how the api is defined.

enum BasicAPI {
    /// This is an api for requests using the **GET** method.
    ///
    /// The full api address is: [](https://postman-echo.com/get?foo1=bar1&foo2=bar2) .
    /// The api does not require the caller to pass in any parameters.
    @GET("/get?foo1=bar1&foo2=bar2")
    static var get: APIParameterBuilder<()>? = nil
}

//: After defining the api, try to execute the request:

do {
    // Requests the api and parses the return value of the interface. Note the use of the `$` character.
    let response = try await BasicAPI.$get.request(to: PostManResponse<Arg>.self)
    
    // You can also ignore the return value and focus only on the act of requesting the api itself.
    try await BasicAPI.$get.request()
    
} catch {
    print("❌ get request failure: \(error)")
}

//: The api with parameters is a little more complicated to define:

extension BasicAPI {
    /// This is an api for requests using the **POST** method.
    ///
    /// The full api address is: [](https://postman-echo.com/post) .
    /// The api is entered as a **tuple** type and requires two parameters, where the second parameter can be `nil`.
    @POST("/post")
    static var postWithTuple: APIParameterBuilder<(foo1: String, foo2: Int?)>? = {
        [
            "foo1": $0.foo1,
            "foo2": $0.foo2,
        ]
        
        // Eliminate the warning by explicitly converting to `[String: Any?]`.
        // Also ensure that `nil` parameters can be filtered.
        as [String: Any?]
    }
    
    /// This is an api for requests using the **POST** method.
    ///
    /// The full api address is: [](https://postman-echo.com/post) .
    /// This api is referenced with the `Arg` type.
    @POST("/post")
    static var postWithModel: APIParameterBuilder<Arg>? = {
        // You can have your model follow the `APIParameterConvertible` protocol.
        // or use `AnyAPIHashableParameter` to wrap your model in an outer layer.
        AnyAPIHashableParameter($0)
    }
}

do {
    // Request the api and parse the return value.
    let tupleAPIResponse = try await BasicAPI.$postWithTuple.request(with: (foo1: "foo1", foo2: nil), to: PostManResponse<Arg>.self)
    
    /**
     *  If you look at the return value, you will see that `foo2` is not passed to the server.
     *  This is because `RaAPIWrapper` filters out all parameters with the value `nil`.
     */
    
    // Try using model as a parameter and you will get the same result.
    let modelAPIResponse = try await BasicAPI.$postWithModel.request(with: .init(foo2: "foo2"), to: PostManResponse<Arg>.self)
    
} catch {
    print("❌ post request failure: \(error)")
}

//: [Next](@next)
