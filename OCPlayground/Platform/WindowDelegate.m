//
//  WindowDelegate.m
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>

#import "WindowDelegate.h"

@implementation WindowDelegate


- (instancetype)initWithHandle:(GWindow *)windowHandle{
    
    self = [super init];
    
    if(self != nil){
        handle = windowHandle;
        handle->should_close = false;
    }
    
    return self;
}

- (BOOL)windowShouldClose:(NSWindow *)sender {
    handle->should_close = true;
    return YES;
}

- (void)windowDidResize:(NSNotification *)notification
{
    NSWindow* window = handle->window;
    CAMetalLayer* layer = handle->layer;
    
    CGSize viewSize = window.contentView.bounds.size;
    NSSize newDrawableSize = [window.contentView convertSizeToBacking:viewSize];
    
    layer.drawableSize = newDrawableSize;
    layer.contentsScale = window.contentView.window.backingScaleFactor;
    
    //TODO: dont know if it belongs here..
    [window.contentView setLayer: layer];
    
    // NSLog(@"View Size: %f", viewSize.width);
    // NSLog(@"Drawable Size: %f", newDrawableSize.width);
    handle->isResized = true;
    // NSLog(@"Did Resize");
}

- (void)windowDidMiniaturize:(NSNotification *)notification
{
    
}

- (void)windowDidDeminiaturize:(NSNotification *)notification
{
    
}

@end
