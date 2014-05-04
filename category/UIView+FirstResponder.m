//
//  UIView+FirstResponder.m
//  
//
//  Created by zx on 1/7/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "UIView+FirstResponder.h"

@implementation UIView (FirstResponder)
- (UIView *)findFirstResponder
{
    if ([self isFirstResponder])
        return self;
    
    for (UIView * subView in self.subviews)
    {
        UIView * fr = [subView findFirstResponder];
        if (fr != nil)
            return fr;
    }
    
    return nil;
}
@end
