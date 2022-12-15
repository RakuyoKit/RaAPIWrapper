//
//  AnyAPIHashable.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/12/15.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

public protocol AnyAPIHashable: Hashable, CustomStringConvertible, CustomDebugStringConvertible {
    associatedtype Value
    
    ///
    var value: Value { get }
    
    ///
    var equals: (Value) -> Bool { get }
    
    ///
    var hash: (_ hasher: inout Hasher) -> Void { get }
}

// MARK: - Hashable

extension AnyAPIHashable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs.value)
    }
    
    public func hash(into hasher: inout Hasher) {
        self.hash(&hasher)
    }
}

// MARK: - CustomStringConvertible

extension AnyAPIHashable {
    public var description: String {
        return .init(describing: value)
    }
}

// MARK: - CustomDebugStringConvertible

extension AnyAPIHashable {
    public var debugDescription: String {
        return .init(describing: self)
    }
}
