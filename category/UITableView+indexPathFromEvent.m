//
//  UITableView+indexPathFromEvent.m
//  lenovoRelonline
//
//  Created by noteant-6 on 2/17/14.
//  Copyright (c) 2014 noteant-6. All rights reserved.
//

#import "UITableView+indexPathFromEvent.h"

@implementation UITableView (indexPathFromEvent)
- (NSIndexPath *)indexPathFromEvent:(UIEvent *)event {
    NSSet *touches =[event allTouches];
    UITouch *touch =[touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self];
    NSIndexPath *indexPath= [self indexPathForRowAtPoint:currentTouchPosition];
    return indexPath;
}
@end
