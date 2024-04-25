//
//  AnyAPIHashable.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2024 RakuyoKit. All rights reserved.
//

import Foundation

// MARK: - AnyAPIHashable

/// You can make any property or protocol follow the `Hashable` protocol through this protocol.
///
/// Define a type, then make it follow the `AnyAPIHashable` protocol,
/// then specify the type of Value as the type you want to make it follow the Hashable.
/// That's all you need to do to get the job done.
///
/// See `AnyAPIHashableParameter` or `AnyAPIHashableParameterEncoding` for details on how to use it.
/// the former makes the `Encodable` protocol follow `Hashable`,
/// the latter makes `Alamofire.ParameterEncoding` do the same thing.
public protocol AnyAPIHashable: Hashable, CustomStringConvertible, CustomDebugStringConvertible {
    /// The type itself that you want to make follow the Hashable protocol.
    /// For example: `typealias Value = Encodable`
    associatedtype Value

    /// Storing the original object.
    var value: Value { get }

    /// Used to implement `Equatable`.
    ///
    /// When using this type, you do not need to care about the specifics of the value.
    var equals: (Value) -> Bool { get }

    /// Used to implement `Hashable`.
    ///
    /// When using this type, you do not need to care about the specifics of the value.
    var hash: (_ hasher: inout Hasher) -> Void { get }
}

// MARK: - Hashable

extension AnyAPIHashable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.equals(rhs.value)
    }

    public func hash(into hasher: inout Hasher) {
        hash(&hasher)
    }
}

// MARK: - CustomStringConvertible

extension AnyAPIHashable {
    public var description: String {
        // When printing the logs, only the objects that need attention are kept by themselves.
        .init(describing: value)
    }
}

// MARK: - CustomDebugStringConvertible

extension AnyAPIHashable {
    public var debugDescription: String {
        // In debug mode, focus on the full content
        .init(describing: self)
    }
}
