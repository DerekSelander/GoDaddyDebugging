//
//  CoolClass.swift
//  SomeCoolFramework
//
//  Created by Derek Selander on LOLz
//  Copyright © 2017 ¯\_(ツ)_/¯. All rights reserved.
//

import Foundation


public class CoolClass {
    
    public static var shared: CoolClass = CoolClass()
    
    public func printFoo() {
        print("FOO!! printed from \((#file as NSString).lastPathComponent), \(#function)")
    }
    
    public func printBar() {
        print("BAR!! printed from \((#file as NSString).lastPathComponent), \(#function)")
    }
}
