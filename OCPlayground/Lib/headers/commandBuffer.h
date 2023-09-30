//
//  commandBuffer.h
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#ifndef commandBuffer_h
#define commandBuffer_h

#include "metal_types.h"

MtCommandBuffer*
mtNewCommandBuffer(MtCommandQueue *cmdq);

void mtReleaseCommandBuffer(MtCommandBuffer *cmdb);

MtCommandBuffer*
mtNewCommandBufferWithUnretainedReferences(MtCommandQueue *cmdq);

void
mtCommandBufferPresentDrawable(MtCommandBuffer *cmdb,
                               MtDrawable      *drawable);

void
mtCommandBufferCommit(MtCommandBuffer *cmdb);


#endif /* commandBuffer_h */
