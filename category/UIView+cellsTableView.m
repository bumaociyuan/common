//
//  UIView+cellsTableView.m
//  lottowinnersv2
//
//  Created by Mac Mini on 5/6/14.
//  Copyright (c) 2014 com.qaik. All rights reserved.
//

#import "UIView+cellsTableView.h"

@implementation UIView (cellsTableView)
- (UITableView *)zx_cellTableView {
    if ([self.superview isKindOfClass:[UITableView class]]) {
        return (UITableView *)self.superview;
    }else {
        return self.superview.zx_cellTableView;
    }
}
@end
