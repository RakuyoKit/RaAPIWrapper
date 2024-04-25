import Foundation

public typealias DemoResponse = Codable & Hashable

// MARK: - PostManResponse

public struct PostManResponse<T: DemoResponse>: DemoResponse {
    public let args: T?
    
    public let data: T?
    
    public let url: String
    
    public let headers: [String: String]
}

// MARK: - Arg

public struct Arg: DemoResponse {
    private enum CodingKeys: String, CodingKey {
        case foo1
        case foo2
    }
    
    let foo1: String?
    
    let foo2: String?
    
    public init(foo1: String? = nil, foo2: String? = nil) {
        self.foo1 = foo1
        self.foo2 = foo2
    }
    
    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        
        foo1 = try c.decodeIfPresent(String.self, forKey: .foo1)
        foo2 = try c.decodeIfPresent(String.self, forKey: .foo2)
    }
}
