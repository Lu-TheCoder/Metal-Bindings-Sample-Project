//
//  platform.h
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#ifndef platform_h
#define platform_h

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>

@class ApplicationDelegate;
@class WindowDelegate;

typedef struct GWindow GWindow;

typedef struct GWindow {
    NSWindow* window;
    CAMetalLayer* layer;
    ApplicationDelegate* app_delegate;
    WindowDelegate* window_delegate;
    bool should_close;
    bool isResized;
}GWindow;

GWindow* GWindow_create(int width, int height, const char* title, int flags);
void GWindow_destroy(GWindow* window);
void GWindow_poll_events(void);
bool GWindow_should_close(GWindow* window);
void GWindow_setLayer_device(GWindow* window, void* device);

#endif /* platform_h */
