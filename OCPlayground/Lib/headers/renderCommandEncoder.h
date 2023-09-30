//
//  renderCommandEncoder.h
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#ifndef renderCommandEncoder_h
#define renderCommandEncoder_h

#include "metal_types.h"
#include "enums.h"

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
MtRenderCommandEncoder*
mtNewRenderCommandEncoder(MtCommandBuffer *cmdb, MtRenderPassDescriptor *pass);

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetFrontFacingWinding(MtRenderCommandEncoder *rce, MtWinding winding);

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetCullMode(MtRenderCommandEncoder *rce, MtCullMode mode);

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetViewport(MtRenderCommandEncoder *rce, MtViewport *viewport);

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetRenderPipelineState(MtRenderCommandEncoder *rce, MtRenderPipelineState *pipline);

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetDepthStencil(MtRenderCommandEncoder *rce, MtDepthStencilState *ds);

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetVertexBytes(MtRenderCommandEncoder *rce,
                 void                   *bytes,
                 size_t                  legth,
                 uint32_t                atIndex);

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetVertexBuffer(MtRenderCommandEncoder *rce,
                  MtBuffer                *buf,
                  size_t                  offset,
                  uint32_t                index);

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetFragmentBuffer(MtRenderCommandEncoder *rce,
                    MtBuffer                *buf,
                    size_t                  offset,
                    uint32_t                index);

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetFragmentTexture(MtRenderCommandEncoder *rce,
                     MtTexture                *texture,
                     uint32_t                  index);

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtDrawPrimitives(MtRenderCommandEncoder *rce,
                 MtPrimitiveType         type,
                 size_t                  start,
                 size_t                  count);

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtDrawIndexedPrimitives(MtRenderCommandEncoder *rce,
                        MtPrimitiveType         type,
                        uint32_t                indexCount,
                        MtIndexType             indexType,
                        MtBuffer               *indexBuffer,
                        uint32_t                indexBufferOffset);

void
mtEndEncoding(MtRenderCommandEncoder *rce);

#endif /* renderCommandEncoder_h */
