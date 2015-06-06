//
//  UIScrollView+scrollToBottom.m
//  crmZztx
//
//  Created by niko on 7/1/14.
//  Copyright (c) 2014 luo hao. All rights reserved.
//

#import "UIScrollView+scrollToBottom.h"

@implementation UIScrollView (scrollToBottom)
- (void)scrollToBottom:(BOOL)animated {
    
//    float y = MAX(self.contentSize.height - self.frame.size.height + self.contentInset.top + self.contentInset.bottom, 0);
//    
//    [self setContentOffset:CGPointMake(0, y) animated:animated];
//    CGPoint bottomOffset = CGPointMake(0, self.contentSize.height - self.bounds.size.height);
//    [self setContentOffset:bottomOffset animated:YES];
    
    [self scrollPointToBottom:CGPointMake(0, self.contentSize.height) animated:animated];
}

- (void)scrollPointToBottom:(CGPoint)point animated:(BOOL)animated{
    
    float y = MAX(point.y - self.frame.size.height + self.contentInset.top + self.contentInset.bottom, 0);
    
    [self setContentOffset:CGPointMake(0, y) animated:animated];
}
@end
