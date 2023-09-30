//
//  common.h
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#ifndef common_h
#define common_h

#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

#import <Foundation/Foundation.h>
#import <Metal/Metal.h>

#import "headers/metal_types.h"

/*
 MT_API_AVAILABLE usage:
 MT_API_AVAILABLE(minimum_macos_version, minimum_ios_version)
 */

#ifdef __APPLE__
#  include <os/availability.h>
#  define mt_macCatalyst macCatalyst
#  define mt_ios         ios
#  define mt_macos       macos
//#  define MT_API_AVAILABLE(M, I) API_AVAILABLE(macos(M), ios(I))
#  define MT_API_AVAILABLE(...) API_AVAILABLE(__VA_ARGS__)
#  define MT_API_UNAVAILABLE(X)  API_UNAVAILABLE(X)
#else
#  define mt_macCatalyst
#  define mt_ios
#  define mt_macos
#  define MT_API_AVAILABLE(...)
#  define MT_API_UNAVAILABLE(x)
#  define API_UNAVAILABLE(...)
#endif


#endif /* common_h */
