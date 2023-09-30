//
//  platform_macos.m
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>
#import "ApplicationDelegate.h"
#import "WindowDelegate.h"
#import "platform.h"

@class ApplicationDelegate;
@class WindowDelegate;

GWindow* GWindow_create(int width, int height, const char* title, int flags){
    GWindow* window = (GWindow*)malloc(sizeof(GWindow));
    // memset(window, 0, sizeof(GWindow));
    
    @autoreleasepool {
        
        [NSApplication sharedApplication];
        [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
        [NSApp activateIgnoringOtherApps:YES];
        
        window->app_delegate = [[ApplicationDelegate alloc] init];
        [NSApp setDelegate: window->app_delegate];
        
        window->window_delegate = [[WindowDelegate alloc] initWithHandle:window];
        
        NSRect screenRect = [NSScreen mainScreen].frame;
        NSRect initialFrame = NSMakeRect((screenRect.size.width - width) * 0.5f,
                                         (screenRect.size.height - height) * 0.5f,
                                         width, height);
        
        NSWindowStyleMask windowStyleMask = (NSWindowStyleMaskTitled |
                                             NSWindowStyleMaskClosable |
                                             NSWindowStyleMaskMiniaturizable |
                                             NSWindowStyleMaskResizable);
        
        
        window->window = [[NSWindow alloc] initWithContentRect:initialFrame
                                                     styleMask:windowStyleMask
                                                       backing:NSBackingStoreBuffered
                                                         defer:NO];
        
        [window->window setLevel:NSNormalWindowLevel];
        // [window->window setBackgroundColor: NSColor.redColor];
        [window->window setTitle: @(title)];
        [window->window setDelegate:window->window_delegate];
        [window->window.contentView setWantsLayer: YES];
        [window->window setAcceptsMouseMovedEvents: YES];
        [window->window setRestorable:NO];
        [window->window makeKeyAndOrderFront: nil];
        
        window->layer = [CAMetalLayer layer];
        
        window->layer.frame = window->window.contentView.frame;
        window->layer.bounds = window->window.contentView.bounds;
        window->layer.drawableSize = [window->window.contentView convertSizeToBacking:window->window.contentView.bounds.size];
        window->layer.contentsScale = window->window.contentView.window.backingScaleFactor;
        
        [window->window.contentView setLayer: window->layer];
        
        [window->layer setOpaque: YES];
        
        [NSApp finishLaunching];
        
    } //autorelease
    
    return window;
}

void GWindow_setLayer_device(GWindow* window, void* device){
    window->layer.device = (__bridge id<MTLDevice> _Nullable)(device);
}

void GWindow_poll_events(void){
    @autoreleasepool {
        
        for(;;)
        {
            NSEvent* event = [NSApp nextEventMatchingMask:NSEventMaskAny
                                                untilDate:[NSDate distantPast]
                                                   inMode:NSDefaultRunLoopMode
                                                  dequeue:YES];
            if (event == nil)
            {
                break;
            }
            
            [NSApp sendEvent:event];
        }
        
    }    //autoreleasepool
}

void GWindow_destroy(GWindow* window){
    
}

bool GWindow_should_close(GWindow* window){
    return window->should_close;
}

void GWindow_CreateMetal_Surface(GWindow* window, void* device){
    window->layer =[CAMetalLayer new];
    window->layer.frame = window->window.contentView.frame;
    window->layer.pixelFormat = MTLPixelFormatBGRA8Unorm;
    window->layer.bounds = window->window.contentView.bounds;
    window->layer.drawableSize = [window->window.contentView convertSizeToBacking:window->window.contentView.bounds.size];
    window->layer.contentsScale = window->window.contentView.window.backingScaleFactor;
    [window->window.contentView.layer addSublayer:window->layer];
    // window->layer.device = device;
    window->layer.device = (__bridge id<MTLDevice> _Nullable)(device);
    
    //  id<CAMetalDrawable> drawable = [window->layer nextDrawable];
    
    //  if(drawable){
    //     printf("Drawabele %f", drawable.layer.drawableSize.width);
    //  }else{
    //     printf("Nooo Drawabele");
    //  }
}

//CF_RETURNS_RETAINED
//MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
//MtDrawable* GWindow_getNextDrawable(GWindow* window){
//    id<CAMetalDrawable> drawable = [window->layer nextDrawable];
//    
//    if(drawable){
//        printf("Drawabele %f\n", drawable.layer.drawableSize.width);
//    }else{
//        printf("Nooo Drawabele\n");
//    }
//    
//    //  return drawable;
//    return (__bridge MtDrawable *)(drawable);
//    // return [window->layer nextDrawable];
//}

