//
//  UISegmentedControl+helper.m
//  crmZztx
//
//  Created by zx on 6/4/15.
//  Copyright (c) 2015 luo hao. All rights reserved.
//

#import "UISegmentedControl+helper.h"

@implementation UISegmentedControl (helper)

- (void)setItems:(NSArray *)items {
    [self removeAllSegments];
    
    for (id segment in items) {
        if ([segment isKindOfClass:[NSString class]]) {
            [self insertSegmentWithTitle:segment atIndex:self.numberOfSegments animated:NO];
        } else if ([segment isKindOfClass:[UIImage class]]) {
            [self insertSegmentWithImage:segment atIndex:self.numberOfSegments animated:NO];
        }
    }
}

- (NSArray *)items {
    NSAssert(0, @"dont call this");
    return nil;
}

@end
