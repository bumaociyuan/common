//
//  UIView+cellsTableView.m
//  lottowinnersv2
//
//  Created by Mac Mini on 5/6/14.
//  Copyright (c) 2014 com.qaik. All rights reserved.
//

#import "UIView+cellsTableView.h"

@implementation UIView (cellsTableView)

- (UITableView *)zx_cellTableView
{
    UITableView *view = (UITableView *)[self superview];
    while (![view isKindOfClass:[UITableView class]])
    {
        view = (UITableView *)[view superview];
    }
    return view;
}

@end
