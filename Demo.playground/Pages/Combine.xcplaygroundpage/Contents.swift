//: [Previous](@previous)

import PlaygroundSupport

import Combine
import Foundation
import ObjectiveC

import APIWrapper

// MARK: - CombineAPI

/// :
/// The design goal of `RaAPIWrapper` is to better encapsulate requests and simplify the request process rather than execute them.
///
/// So we don't provide any methods for request api.
/// You can define your own request methods by referring to the code in the `Demo/Sources/API+Request.swift` file.
///
/// Here are 2 request wrappers for `Combine`, which are roughly written for reference only:

/// For subsequent examples
enum CombineAPI {
    @POST("/post")
    static var post: APIParameterBuilder<String>? = { $0 }
}

// MARK: - AnyPublisher

//: The first way: deliver an `AnyPublisher<T, Error>` object externally and subscribe to it to trigger requests.

extension API {
    func requestPublisher(with params: Parameter) -> AnyPublisher<Data, URLError> {
        let info = createRequestInfo(params)

        // To simplify the demo process, here is a forced unpacking
        guard let url = URL(string: "https://postman-echo.com" + info.path) else {
            fatalError("url(\(info.path) nil!")
        }

        var request = URLRequest(url: url)
        request.httpMethod = info.httpMethod.rawValue

        if let parameters = info.parameters {
            do {
                request.httpBody = try JSONEncoder().encode(parameters)
            } catch {
                fatalError("Encoder failure: \(error)")
            }

            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        return URLSession.shared
            .dataTaskPublisher(for: request)
            .map { data, _ in data }
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
}

var cancellable = Set<AnyCancellable>()
let publisher = CombineAPI.$post.requestPublisher(with: "123")
publisher
    .sink(
        receiveCompletion: { Log.log($0) },
        receiveValue: { Log.log(String(data: $0, encoding: .utf8) as Any) }
    )
    .store(in: &cancellable)

// MARK: - PassthroughSubject

/// :
/// The second one is to provide a `PassthroughSubject` object to the outside world,
/// send parameters when requesting the api, subscribe to the object at other places,
/// accept the parameters and send the request.

private var kParamSubjectKey = "kParamSubjectKey"

extension API {
    @available(iOS 13.0, *)
    public var paramSubject: PassthroughSubject<Parameter, URLError>? {
        get {
            if let value = objc_getAssociatedObject(self, &kParamSubjectKey) as? PassthroughSubject<Parameter, URLError> {
                return value
            }
            let paramSubject = PassthroughSubject<Parameter, URLError>()
            objc_setAssociatedObject(self, &kParamSubjectKey, paramSubject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return paramSubject
        }
        set { objc_setAssociatedObject(self, &kParamSubjectKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    @available(iOS 13.0, *)
    public func requestPublisher() -> AnyPublisher<Data, URLError>? {
        paramSubject?.flatMap { self.requestPublisher(with: $0) }.eraseToAnyPublisher()
    }
}

let api = CombineAPI.$post

api.requestPublisher()?
    .sink(
        receiveCompletion: { Log.log($0) },
        receiveValue: { Log.log(String(data: $0, encoding: .utf8) as Any) }
    )
    .store(in: &cancellable)

api.paramSubject?.send("233")
api.paramSubject?.send("433")
api.paramSubject?.send(completion: .finished)

//: [Next](@next)
