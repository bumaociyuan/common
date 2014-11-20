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
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    if (self.tableFooterView) {
        
    }
    self.tableFooterView = view;
}

@end
