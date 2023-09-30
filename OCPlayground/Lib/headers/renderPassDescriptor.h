//
//  renderPassDescriptor.h
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#ifndef renderPassDescriptor_h
#define renderPassDescriptor_h

#include "metal_types.h"
#include "enums.h"

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
MtRenderPassDescriptor*
mtNewRenderPassDescriptor(void);

void
mtReleaseRenderPassDescriptor(MtRenderPassDescriptor* rpassc);

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetRenderPassDescTexture(MtRenderPassDescriptor *pass,
                           int               colorAttch,
                           MtTexture        *tex);

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetRenderPassDescLoadAction(MtRenderPassDescriptor *pass,
                              int               colorAttch,
                              MtLoadAction      action);

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
void
mtSetRenderPassDescStoreAction(MtRenderPassDescriptor *pass,
                               int               colorAttch,
                               MtStoreAction      action);

MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
MtClearColor
mtClearColorMake(double red, double green, double blue, double alpha);

void
mtSetClearColor(MtRenderPassDescriptor *pass,
                int                     colorAttch,
                MtClearColor*           color);

void
mtSetClearColorRGBA(MtRenderPassDescriptor *pass,
                    int                     colorAttch,
                    double red, double green, double blue, double alpha);


#endif /* renderPassDescriptor_h */
