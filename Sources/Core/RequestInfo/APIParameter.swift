//
//  APIParameter.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2023/01/13.
//  Copyright © 2024 RakuyoKit. All rights reserved.
//

import Foundation

/// Used to constrain what types can be used as api parameters.
public typealias APIParameter = AnyAPIHashableParameter.Input

/// Represents an arbitrary api parameter.
public typealias AnyAPIParameter = AnyAPIHashableParameter
