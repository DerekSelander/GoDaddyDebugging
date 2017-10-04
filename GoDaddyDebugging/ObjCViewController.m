//
//  ObjCViewController.m
//  GoDaddyDebugging
//
//  Created by Derek Selander on LOLz
//  Copyright © 2017 razeware. All rights reserved.
//

#import "ObjCViewController.h"

@import SomeCoolFramework;

@implementation ObjCViewController

- (IBAction)printFoo:(id)sender {
    ds_print_foo();
}
- (IBAction)printBar:(id)sender {
    ds_print_bar();
}

@end
