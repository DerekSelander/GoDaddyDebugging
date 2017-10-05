//
//  CoolStruct.swift
//  SomeCoolFramework
//
//  Created by Derek Selander on LOLz
//  Copyright © 2017 ¯\_(ツ)_/¯. All rights reserved.
//

import Foundation


public struct SecretStruct {
    let secretnum = 5
    
    public init() { }
    
    internal func secretFunc() {
        print("secret func \(self) with internal variable a=\(secretnum)")
    }
}
