//
//  CoolClass.swift
//  SomeCoolFramework
//
//  Created by Derek Selander on LOLz
//  Copyright © 2017 razeware. All rights reserved.
//

import Foundation


public class CoolClass {
    
    public static var shared: CoolClass = CoolClass()
    
    public func printFoo() {
        print("FOO!! printed from \(String(describing: #file.components(separatedBy: "/").last!)), \(#function)")
    }
    
    public func printBar() {
        print("BAR!! printed from \(String(describing: #file.components(separatedBy: "/").last!)), \(#function)")
    }
}
