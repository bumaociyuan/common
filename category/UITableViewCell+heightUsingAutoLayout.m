//
//  UITableViewCell+heightUsingAutoLayout.m
//  lenovoRelonline
//
//  Created by noteant-6 on 2/19/14.
//  Copyright (c) 2014 noteant-6. All rights reserved.
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
