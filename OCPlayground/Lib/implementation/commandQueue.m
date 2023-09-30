//
//  commandQueue.m
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#import "../common.h"
#import "../headers/commandQueue.h"

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
CF_RETURNS_RETAINED
MtCommandQueue*
mtNewCommandQueue(MtDevice *device) {
    // return [(id<MTLDevice>)device newCommandQueue];
    // return [(__bridge id<MTLDevice>)device newCommandQueue];
    @autoreleasepool {
        return (__bridge_retained MtCommandQueue *)((id<MTLCommandQueue>)[(__bridge id<MTLDevice>)device newCommandQueue]);
    }
    
}

