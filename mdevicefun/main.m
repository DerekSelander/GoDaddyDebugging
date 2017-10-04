//
//  main.m
//  mdevicefun
//
//  Created by Derek Selander on LOLz
//  Copyright © 2017 razeware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <dlfcn.h>

typedef struct AMDevice {
//    uintptr_t buffer[4];
    void *unknown0;
    int flags;
    int reserved;
    void *unknown1;
    void *unknown2;
    void *UDIDString;
//    void* dref;
//    int flags[2];
//    void *dunno;
//    void* dict;
    // Internal struct... use LLDB to reverse engineer to determine contents
} AMDevice;

/*
     We may not know size of AMDevice struct, but a pointer in a 64 bit process
     will ALWAYS be 8 bytes. Doesn't matter if it's a pointer to a char or a
     pointer to the biggest class ever. Always 8 bytes.
 */
typedef struct AMDevice *AMDeviceRef;



//mach_error_t (*AMDeviceNotificationSubscribe)(void (*)(AMDeviceRef, int), int, int, int, void *);
//mach_error_t (*AMDeviceConnect)(AMDeviceRef);
//mach_error_t (*AMDeviceIsPaired)(AMDeviceRef *);
//mach_error_t (*AMDeviceValidatePairing)(AMDeviceRef);
//mach_error_t (*AMDeviceStartSession)(AMDeviceRef);
//mach_error_t (*AMDeviceNotificationUnsubscribe)(AMDeviceRef);


extern mach_error_t AMDeviceNotificationSubscribe(void (*)(AMDeviceRef*, int), int, int, int, void *);
extern mach_error_t AMDeviceConnect(AMDeviceRef);
extern mach_error_t AMDeviceIsPaired(AMDeviceRef *);
extern mach_error_t AMDeviceValidatePairing(AMDeviceRef);
extern mach_error_t AMDeviceStartSession(AMDeviceRef);
extern mach_error_t AMDeviceNotificationUnsubscribe(AMDeviceRef);
extern id AMDeviceCopyValue(AMDeviceRef, void *, NSString *, unsigned long int /* device id */);


void device_callback(AMDeviceRef *devices, int number) {

    AMDeviceRef d = *devices;
    
    // Connect
    AMDeviceConnect(d);
    
    // Is Paired
    assert((AMDeviceIsPaired(devices) == ERR_SUCCESS));
    
    // Validate Pairing
    assert(!AMDeviceValidatePairing(d));
    
    // Start Session
    assert(!AMDeviceStartSession(d));
    
    
    NSString *name = AMDeviceCopyValue(d, NULL, @"DeviceName", NULL);
    
    NSLog(@"%@", name);
//    NSString *deviceName = AMDeviceCopyValue(d, nil, @"DeviceName", 0);
//    if (deviceName) {
//        ideviceName = deviceName;
//        dsprintf(stdout, "%sConnected to: \"%s\" (%s)%s\n", dcolor("cyan"), [deviceName UTF8String], [AMDeviceGetName(d) UTF8String], colorEnd());
//    }
    
    
//    *device->dref;
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        // Path to MobileDevice is...
        // /System/Library/PrivateFrameworks/MobileDevice.framework/Versions/A/MobileDevice
        
        void *handle = NULL;
        handle = dlopen("/System/Library/PrivateFrameworks/MobileDevice.framework/Versions/A/MobileDevice", RTLD_NOW);
        
//        AMDeviceConnect = dlsym(handle, "AMDeviceConnect");
//        AMDeviceNotificationSubscribe = dlsym(handle, "AMDeviceNotificationSubscribe");
//        AMDeviceIsPaired = dlsym(handle, "AMDeviceIsPaired");
//        AMDeviceValidatePairing = dlsym(handle, "AMDeviceValidatePairing");
//        AMDeviceStartSession = dlsym(handle, "AMDeviceStartSession");
//        AMDeviceNotificationUnsubscribe = dlsym(handle, "AMDeviceNotificationUnsubscribe");
        
        assert(AMDeviceConnect);
        
        void *n;
        AMDeviceNotificationSubscribe(device_callback, 0, 0, 0, &n);
        
        CFRunLoopRun();
    }
    return 0;
}
