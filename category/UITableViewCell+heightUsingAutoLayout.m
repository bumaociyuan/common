//
//  UITableViewCell+heightUsingAutoLayout.m
//
//
//  Created by zx on 2/19/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "UITableViewCell+heightUsingAutoLayout.h"

@implementation UITableViewCell (heightUsingAutoLayout)
- (float)heightUsingAutoLayout {
    float height = 0;
    [self setNeedsLayout];
    [self layoutIfNeeded];
    height = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height;
}

@end
