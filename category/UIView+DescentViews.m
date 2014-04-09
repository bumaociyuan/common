//
//  UIView+DescentViews.m
//  lenovoRelonline
//
//  Created by noteant-6 on 1/10/14.
//  Copyright (c) 2014 noteant-6. All rights reserved.
//

#import "UIView+DescentViews.h"

@implementation UIView (DescentViews)
- (NSArray *)getDescentViews
{
    NSMutableArray *subviews = [[self subviews] mutableCopy];
    for (UIView *subview in [self subviews])
        [subviews addObjectsFromArray:[subview getDescentViews]]; //recursive
    return subviews;
}
@end
