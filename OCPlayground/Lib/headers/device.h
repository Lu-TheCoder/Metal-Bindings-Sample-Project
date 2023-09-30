//
//  device.h
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#ifndef device_h
#define device_h

#include "metal_types.h"

MtDevice* mtCreateSystemDefaultDevice(void);
const char* mtDeviceName(MtDevice* device);


#endif /* device_h */
