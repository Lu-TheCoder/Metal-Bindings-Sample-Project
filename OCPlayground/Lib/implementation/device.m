//
//  device.m
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#import "../common.h"

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
CF_RETURNS_RETAINED
MtDevice* mtCreateSystemDefaultDevice(void){
    return (__bridge MtDevice *)(MTLCreateSystemDefaultDevice());
}

const char* mtDeviceName(MtDevice* device){
    return [[(__bridge id<MTLDevice>)device name] cStringUsingEncoding:NSUTF8StringEncoding];
}
