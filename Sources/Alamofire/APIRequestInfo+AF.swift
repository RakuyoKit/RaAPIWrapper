//
//  APIRequestInfo+AF
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/19.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

#if !COCOAPODS
import APIWrapper
#endif

extension APIRequestInfo {
    /// Encoding of `Parameters`.
    public var parameterEncoding: AnyAPIParameterEncoding? {
        userInfo[parameterEncodingKey] as? AnyAPIParameterEncoding
    }
}
