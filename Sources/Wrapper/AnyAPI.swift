//
//  AnyAPI.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/28.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

/// Generic Erasure for `API`.
///
/// You can use this type as a parameter or return value of a function
/// to say "I just need an api and don't care what it is".
///
/// For example.
///
/// ```swift
/// // In the parent class.
/// func listAPI() -> AnyAPI? { nil }
///
/// // In subclass: View jobs for a particular situation
/// override func listAPI() -> AnyAPI? { ListAPI.$jobs }
///
/// // In subclass: View jobs for a all situation
/// override func listAPI() -> AnyAPI? { ListAPI.$allJobs }
/// ```
//public final class AnyAPI: API<Any> {
//    public init<P, M>(_ api: API<P, M>) {
//        super.init(
//            wrappedValue: {
//                guard let builder = api.wrappedValue else { return nil }
//                return { builder($0 as! P) }
//            }(),
//            api.path,
//            specialBaseURL: api.specialBaseURL,
//            header: {
//                guard let builder = api.headerBuilder else { return nil }
//                return { builder($0 as! P) }
//            }(),
//            parameterEncoding: api.parameterEncoding)
//    }
//}
