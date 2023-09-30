//
//  renderPassDescriptor.m
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#include "../common.h"
#include "../headers/metal_types.h"
#include "../headers/renderPassDescriptor.h"

CF_RETURNS_RETAINED
MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
MtRenderPassDescriptor*
mtNewRenderPassDescriptor(void) {
    return (__bridge MtRenderPassDescriptor *)([MTLRenderPassDescriptor new]);
}

void
mtReleaseRenderPassDescriptor(MtRenderPassDescriptor* rpassc) {
    @autoreleasepool {
//        [(__bridge MTLRenderPassDescriptor*)rpassc release];
    }
//    return (__bridge MtRenderPassDescriptor *)([MTLRenderPassDescriptor new]);
}

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetRenderPassDescTexture(MtRenderPassDescriptor *pass,
                           int               colorAttch,
                           MtTexture        *tex) {
    
    @autoreleasepool {
        MTLRenderPassDescriptor *mpass;
        
        mpass = (__bridge MTLRenderPassDescriptor *)(pass);
        
        mpass.colorAttachments[colorAttch].texture = (__bridge id<MTLTexture> _Nullable)(tex);
    }
   
}

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetRenderPassDescLoadAction(MtRenderPassDescriptor *pass,
                              int               colorAttch,
                              MtLoadAction      action) {
    
    @autoreleasepool {
        MTLRenderPassDescriptor *mpass;
        
        mpass = (__bridge MTLRenderPassDescriptor *)(pass);
        
        mpass.colorAttachments[colorAttch].loadAction = (MTLLoadAction)action;
    }
    
}

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetRenderPassDescStoreAction(MtRenderPassDescriptor *pass,
                               int               colorAttch,
                               MtStoreAction      action) {
    @autoreleasepool {
        MTLRenderPassDescriptor *mpass;
        
        mpass = (__bridge MTLRenderPassDescriptor *)(pass);
        
        mpass.colorAttachments[colorAttch].storeAction = (MTLStoreAction)action;
    }
}

MtClearColor
mtClearColorMake(double red, double green, double blue, double alpha){
    MtClearColor result;
    result.red = red;
    result.green = green;
    result.blue = blue;
    result.alpha = alpha;
    return result;
}

void
mtSetClearColor(MtRenderPassDescriptor *pass, int colorAttch, MtClearColor* color){
    @autoreleasepool {
        MTLRenderPassDescriptor *mpass;
        
        mpass = (__bridge MTLRenderPassDescriptor *)(pass);
        
        mpass.colorAttachments[colorAttch].clearColor = *(MTLClearColor*)color;
    }
}

void
mtSetClearColorRGBA(MtRenderPassDescriptor *pass, int colorAttch, double red, double green, double blue, double alpha){
    @autoreleasepool {
        MTLRenderPassDescriptor *mpass;
        
        mpass = (__bridge MTLRenderPassDescriptor *)(pass);
        
        mpass.colorAttachments[colorAttch].clearColor = MTLClearColorMake(red, green, blue, alpha);
    }
}
