//
//  renderCommandEncoder.m
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#include "../common.h"
#include "../headers/metal_types.h"
#include "../headers/renderCommandEncoder.h"

CF_RETURNS_RETAINED
MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
MtRenderCommandEncoder*
mtNewRenderCommandEncoder(MtCommandBuffer *cmdb, MtRenderPassDescriptor *pass) {
    @autoreleasepool {
        return (__bridge_retained MtRenderCommandEncoder *)([(__bridge id<MTLCommandBuffer>)cmdb renderCommandEncoderWithDescriptor: (__bridge MTLRenderPassDescriptor*)pass]);
    }
}

void mtReleaseRenderCommandEncoder(MtRenderCommandEncoder* rcEncoder) {
    @autoreleasepool {
        if (rcEncoder){
            id<MTLRenderCommandEncoder> encoder = (__bridge id<MTLRenderCommandEncoder>)(rcEncoder);
//            CFRelease((__bridge_retained CFTypeRef)(encoder));
            CFRelease(CFBridgingRetain(encoder));
        }
    }
}

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetFrontFacingWinding(MtRenderCommandEncoder *rce, MtWinding winding) {
    [(__bridge id<MTLRenderCommandEncoder>)rce setFrontFacingWinding:(MTLWinding)winding];
}

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetCullMode(MtRenderCommandEncoder *rce, MtCullMode mode) {
    [(__bridge id<MTLRenderCommandEncoder>)rce setCullMode:(MTLCullMode)mode];
}

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetViewport(MtRenderCommandEncoder *rce, MtViewport *viewport) {
    @autoreleasepool {
        [(__bridge id<MTLRenderCommandEncoder>)rce setViewport: *(MTLViewport *)viewport];
    }
}

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetRenderPipelineState(MtRenderCommandEncoder *rce, MtRenderPipelineState *pipline) {
    [(__bridge id<MTLRenderCommandEncoder>)rce setRenderPipelineState: (__bridge id<MTLRenderPipelineState> _Nonnull)(pipline)];
}

void
mtSetDepthStencil(MtRenderCommandEncoder *rce, MtDepthStencilState *ds) {
    [(__bridge id<MTLRenderCommandEncoder>)rce setDepthStencilState: (__bridge id<MTLDepthStencilState> _Nullable)(ds)];
}

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetVertexBytes(MtRenderCommandEncoder *enc,
                 void                   *bytes,
                 size_t                  legth,
                 uint32_t                atIndex) {
    [(__bridge id<MTLRenderCommandEncoder>)enc setVertexBytes: bytes
                                              length: legth
                                             atIndex: atIndex];
}

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetVertexBuffer(MtRenderCommandEncoder *rce,
                  MtBuffer               *buf,
                  size_t                  offset,
                  uint32_t                index) {
    [(__bridge id<MTLRenderCommandEncoder>)rce setVertexBuffer: (__bridge id<MTLBuffer> _Nullable)(buf)
                                               offset: offset
                                              atIndex: index];
}

void
mtSetFragmentBuffer(MtRenderCommandEncoder *rce,
                    MtBuffer                *buf,
                    size_t                  offset,
                    uint32_t                index){
    
    [(__bridge id<MTLRenderCommandEncoder>)rce setFragmentBuffer: (__bridge id<MTLBuffer> _Nullable)(buf)
                                                 offset: offset
                                                atIndex: index];
}

void
mtSetFragmentTexture(MtRenderCommandEncoder *rce,
                     MtTexture                *texture,
                     uint32_t                 index){
    
    [(__bridge id<MTLRenderCommandEncoder>)rce setFragmentTexture: (__bridge id<MTLTexture> _Nullable)(texture)
                                                 atIndex: index];
}

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtDrawPrimitives(MtRenderCommandEncoder *rce,
                 MtPrimitiveType         type,
                 size_t                  start,
                 size_t                  count) {
    @autoreleasepool {
        [(__bridge id<MTLRenderCommandEncoder>)rce drawPrimitives: (MTLPrimitiveType)type
                                                      vertexStart: start
                                                      vertexCount: count];
    }
   
}

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtDrawIndexedPrimitives(MtRenderCommandEncoder *rce,
                        MtPrimitiveType         type,
                        uint32_t                indexCount,
                        MtIndexType             indexType,
                        MtBuffer               *indexBuffer,
                        uint32_t                indexBufferOffset) {
    @autoreleasepool {
        [(__bridge id<MTLRenderCommandEncoder>)rce
         drawIndexedPrimitives: (MTLPrimitiveType)type
         indexCount: indexCount
         indexType: (MTLIndexType)indexType
         indexBuffer: (__bridge id<MTLBuffer> _Nonnull)(indexBuffer)
         indexBufferOffset: indexBufferOffset];
    }
}

void
mtEndEncoding(MtRenderCommandEncoder *rce){
    @autoreleasepool {
        [(__bridge id<MTLRenderCommandEncoder>)rce endEncoding];
    }
}
