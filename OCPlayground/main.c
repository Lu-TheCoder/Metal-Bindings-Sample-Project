//
//  main.c
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#include <stdio.h>
#include "Lib/headers/CMetal.h"
#include "Platform/platform.h"
#include <stdlib.h>


int main(int argc, const char * argv[]) {
    
    @autoreleasepool{
        
        GWindow* window = GWindow_create(600, 400, "Lu's Graphics Engine (Metal)", 0);
        
        MtDevice* device = mtCreateSystemDefaultDevice();
        printf("Name: %s\n", mtDeviceName(device));
        
        GWindow_setLayer_device(window, device);
        
        MtCommandQueue* commandQueue = mtNewCommandQueue(device);
        
        if(commandQueue){
            printf("Created QUE successfully\n");
        }else{
            printf("Failed to create QUE!!\n");
        }
        
        //Note: Temporary placement
        //Not sure if moving it outside the draw loop is a good idea but oh well.. its here for now
        MtViewport* viewport = malloc(sizeof(MtViewport));
        viewport->originX = 0;
        viewport->originY = 0;
        viewport->width = window->layer.drawableSize.width;
        viewport->height = window->layer.drawableSize.height;
        viewport->znear = 0;
        viewport->zfar = 1;
        
        bool isviewportSet = false;
        
        while(!GWindow_should_close(window)){
            
            @autoreleasepool {
                MtDrawable* drawable = (__bridge MtDrawable *)((window->layer.nextDrawable));
                
//                id<CAMetalDrawable> drawable = window->layer.nextDrawable;
                
                if (drawable){
                    MtCommandBuffer* commandBuffer = mtNewCommandBuffer(commandQueue);
                    
                    MtRenderPassDescriptor* passDescriptor = mtNewRenderPassDescriptor();
                    mtSetRenderPassDescTexture(passDescriptor, 0, (__bridge MtTexture *)(window->layer.nextDrawable.texture));
                    mtSetRenderPassDescLoadAction(passDescriptor, 0, MtLoadActionClear);
                    mtSetRenderPassDescStoreAction(passDescriptor, 0, MtStoreActionStore);
                    mtSetClearColorRGBA(passDescriptor, 0, 0.1, 0.1, 0.1, 1.0);
                    
                    MtRenderCommandEncoder* commandEncoder = mtNewRenderCommandEncoder(commandBuffer, passDescriptor);
                    mtReleaseRenderPassDescriptor(passDescriptor);
        
                    //NOTE: Temporary
                    //actually needs to be set only on initial app start and updated only on 'window-size-changed' events
                    if (!isviewportSet){
                        mtSetViewport(commandEncoder, viewport);
                        isviewportSet = true;
                    }
                    
                    mtEndEncoding(commandEncoder);
                    
                    mtCommandBufferPresentDrawable(commandBuffer, drawable);
                    mtCommandBufferCommit(commandBuffer);
                    
                    mtReleaseRenderCommandEncoder(commandEncoder);
                    mtReleaseCommandBuffer(commandBuffer);
                    
                    
                }else{
                    printf("NO DRAWABLE!\n");
                }
                
            }
            GWindow_poll_events();

        }
        
        GWindow_destroy(window);
        
    }
    
    
    // insert code here...
    printf("Hello, World!\n");
    return 0;
}
