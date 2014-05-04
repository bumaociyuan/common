//
//  UITableView+EliminateExtraSeparators.m
//  
//
//  Created by zx on 1/9/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "UITableView+EliminateExtraSeparators.h"

@implementation UITableView (EliminateExtraSeparators)
- (void)eliminateExtraSeparators {
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    v.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:v];
}

@end
