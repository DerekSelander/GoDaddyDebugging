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

- (IBAction)printLotsOfArgs:(id)sender {
    [self functionWithLotsOfArguments:@"one" arg2:@"two" arg3:@"three" arg4:@"four" arg5:@"five" arg6:@"six"];
}

- (void)functionWithLotsOfArguments:(id)arg1 arg2:(id)arg2 arg3:(id)arg3
                               arg4:(id)arg4
                               arg5:(id)arg5
                               arg6:(id)arg6 {
    NSLog(@"arg1 is: %@\narg2 is: %@\narg3 is:%@\narg4 is: %@\narg5 is: %@\narg6 is: %@",
                                                                      arg1,
                                                                      arg2,
                                                                      arg3,
                                                                      arg4,
                                                                      arg5,
                                                                      arg6);
}

@end
