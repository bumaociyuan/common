//
//  UIView+DescentViews.m
//  
//
//  Created by zx on 1/10/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "UIView+DescentViews.h"

@implementation UIView (DescentViews)
- (NSArray *)descentViews
{
    NSMutableArray *subviews = [[self subviews] mutableCopy];
    for (UIView *subview in [self subviews])
        [subviews addObjectsFromArray:[subview descentViews]]; //recursive
    return subviews;
}
@end
