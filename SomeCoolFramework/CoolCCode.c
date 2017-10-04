//
//  CoolCCode.c
//  SomeCoolFramework
//
//  Created by Derek Selander on LOLz
//  Copyright © 2017 razeware. All rights reserved.
//

#include "CoolCCode.h"

void ds_print_foo(void) {
    printf("foo C func from %s,%s\n", __FILE__, __FUNCTION__);
}

void ds_print_bar(void) {
    printf("bar C func from %s,%s\n", __FILE__, __FUNCTION__);
}
