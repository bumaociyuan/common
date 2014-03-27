//
//  UITableView+EliminateExtraSeparators.m
//  lenovoRelonline
//
//  Created by noteant-6 on 1/9/14.
//  Copyright (c) 2014 noteant-6. All rights reserved.
//

#import "UITableView+EliminateExtraSeparators.h"

@implementation UITableView (EliminateExtraSeparators)
- (void)eliminateExtraSeparators {
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    v.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:v];
}

@end
