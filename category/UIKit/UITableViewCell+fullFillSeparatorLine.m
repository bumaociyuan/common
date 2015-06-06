//
//  UITableViewCell+fullFillSeparatorLine.m
//  crmZztx
//
//  Created by zx on 6/4/15.
//  Copyright (c) 2015 luo hao. All rights reserved.
//

#import "UITableViewCell+fullFillSeparatorLine.h"

@implementation UITableViewCell (fullFillSeparatorLine)
- (void)fullFillSeparatorLine {
    // Remove seperator inset
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([self respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [self setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
