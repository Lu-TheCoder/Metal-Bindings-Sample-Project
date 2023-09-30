//
//  commandQueue.h
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#ifndef commandQueue_h
#define commandQueue_h

#ifdef __cplusplus
extern "C" {
#endif

#include "../common.h"
#include "metal_types.h"
#include "enums.h"


MtCommandQueue*
mtNewCommandQueue(MtDevice *device);

MtCommandQueue*
mtNewCommandQueueWithMaxCommandBufferCount(MtDevice *device, NsUInteger count);

#ifdef __cplusplus
}
#endif

#endif /* commandQueue_h */
