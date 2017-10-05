//
//  ViewController.swift
//  GoDaddyDebugging
//
//  Created by Derek Selander on LOLz
//  Copyright © 2017 ¯\_(ツ)_/¯. All rights reserved.
//

import UIKit
import SomeCoolFramework

class ViewController: UIViewController {
    
    @IBAction func printFooTapped(_ sender: Any) {
        CoolClass.shared.printFoo()
    }

    @IBAction func printBarTapped(_ sender: Any) {
        CoolClass.shared.printBar()
    }
}

