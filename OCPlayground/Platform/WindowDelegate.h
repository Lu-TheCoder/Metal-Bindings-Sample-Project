//
//  WindowDelegate.h
//  OCPlayground
//
//  Created by Lungile M on 9/30/23.
//

#ifndef WindowDelegate_h
#define WindowDelegate_h

#import "platform.h"

@interface WindowDelegate : NSWindow <NSWindowDelegate>
{
    GWindow* handle;
}
-(instancetype)initWithHandle:(GWindow*)windowHandle;

@end //interface WindowDelegate


#endif /* WindowDelegate_h */
