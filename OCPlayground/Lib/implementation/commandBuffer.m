//
//  commandBuffer.m
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#include "../common.h"
#include "../headers/metal_types.h"
#include "../headers/commandBuffer.h"

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
CF_RETURNS_RETAINED
MtCommandBuffer*
mtNewCommandBuffer(MtCommandQueue *cmdq){
    @autoreleasepool {
        return (__bridge_retained MtCommandBuffer *)([(__bridge id<MTLCommandQueue>)cmdq commandBuffer]);
    }
}

void mtReleaseCommandBuffer(MtCommandBuffer *cmdb){
    @autoreleasepool {
        if(cmdb){
            id<MTLCommandBuffer> buffer = (__bridge id<MTLCommandBuffer>)cmdb;
//            CFRelease((__bridge CFTypeRef)(buffer));
            CFRelease(CFBridgingRetain(buffer));
        }
    }
}

/*
 Returns a command buffer from the command queue that maintains strong references to resources.
 TODO: this description is misleading given the title of the function/ thus fix soon
 */
CF_RETURNS_RETAINED
MtCommandBuffer*
mtNewCommandBufferWithUnretainedReferences(MtCommandQueue *cmdq){
    return (__bridge_retained MtCommandBuffer *)([(__bridge id<MTLCommandQueue>)cmdq commandBufferWithUnretainedReferences]);
}

void
mtCommandBufferPresentDrawable(MtCommandBuffer *cmdb,
                               MtDrawable      *drawable){
    @autoreleasepool {
        [(__bridge id<MTLCommandBuffer>)cmdb presentDrawable: (__bridge id<MTLDrawable> _Nonnull)(drawable)];
    }
}

void
mtCommandBufferCommit(MtCommandBuffer *cmdb) {
    @autoreleasepool {
        [(__bridge id<MTLCommandBuffer>)cmdb commit];
    }
}
