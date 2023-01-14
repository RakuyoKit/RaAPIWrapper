//: [Previous](@previous)

import PlaygroundSupport

import Foundation

import APIWrapper

/*:
 The `RaAPIWrapper` is extremely extensible.
 You can work with the `userInfo` property to customize the api parameters you need.
 
 The `RaAPIWrapper/AF` module then takes advantage of this feature and supports the `ParameterEncoding` field of `Alamofire`.
 
 The following code demonstrates how to add a custom parameter to `API`:
 */

// will be used later as a custom parameter of the api.
enum VerificationType: Hashable {
    case normal
    case special
}

extension API {
    /// You can extend the `API` structure to add your custom parameters to the property wrapper
    /// by adding custom initialization methods, while keeping the types as you wish.
    ///
    /// **Note**: The first parameter `wrappedValue` cannot be omitted!
    convenience init(
        wrappedValue: ParameterBuilder? = nil,
        _ path: String,
        verification: VerificationType? = nil
    ) {
        self.init(wrappedValue: wrappedValue, path, userInfo: ["verification": verification])
    }
}

enum AdvancedAPI {
    /// Finally, the new initialization method declared above is called on
    /// the property wrapper to complete the interface definition.
    @GET("/api", verification: .normal)
    static var testAPI: APIParameterBuilder<()>? = nil
}


//: [Next](@next)
