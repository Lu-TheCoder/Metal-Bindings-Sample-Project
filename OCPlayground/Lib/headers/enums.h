//
//  enums.h
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#ifndef enums_h
#define enums_h

typedef enum MtPrimitiveType {
    MtPrimitiveTypePoint         = 0,
    MtPrimitiveTypeLine          = 1,
    MtPrimitiveTypeLineStrip     = 2,
    MtPrimitiveTypeTriangle      = 3,
    MtPrimitiveTypeTriangleStrip = 4
} MtPrimitiveType;

typedef enum MtIndexType {
    MtIndexTypeUInt16 = 0,
    MtIndexTypeUInt32 = 1,
} MtIndexType;

typedef enum MtCullMode {
    MtCullModeNone  = 0,
    MtCullModeFront = 1,
    MtCullModeBack  = 2
} MtCullMode;

typedef enum MtWinding {
    MtWindingClockwise        = 0,
    MtWindingCounterClockwise = 1
} MtWinding;

typedef enum MtDepthClipMode {
    MtDepthClipModeClip  = 0,
    MtDepthClipModeClamp = 1
} MtDepthClipMode;

typedef enum MtTriangleFillMode {
    MtTriangleFillModeFill  = 0,
    MtTriangleFillModeLines = 1
} MtTriangleFillMode;

typedef struct MtDrawPrimitivesIndirectArguments {
    uint32_t vertexCount;
    uint32_t instanceCount;
    uint32_t vertexStart;
    uint32_t baseInstance;
} MtDrawPrimitivesIndirectArguments;

typedef struct MtDrawIndexedPrimitivesIndirectArguments {
    uint32_t indexCount;
    uint32_t instanceCount;
    uint32_t indexStart;
    int32_t  baseVertex;
    uint32_t baseInstance;
} MtDrawIndexedPrimitivesIndirectArguments;

typedef struct MtViewport {
    double originX, originY, width, height, znear, zfar;
} MtViewport;

typedef struct MtClearColor
{
    double red;
    double green;
    double blue;
    double alpha;
} MtClearColor;

typedef enum MtLoadAction {
    MtLoadActionDontCare = 0,
    MtLoadActionLoad     = 1,
    MtLoadActionClear    = 2,
} MtLoadAction;

typedef enum MtStoreAction {
    MtStoreActionDontCare                   = 0,
    MtStoreActionStore                      = 1,
    MtStoreActionMultisampleResolve         = 2,
    MtStoreActionStoreAndMultisampleResolve = 3,
    MtStoreActionUnknown                    = 4,
    MtStoreActionCustomSampleDepthStore     = 5,
} MtStoreAction;

#endif /* enums_h */
