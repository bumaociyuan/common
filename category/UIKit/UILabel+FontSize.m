//
//  UILabel+FontSize.m
//  
//
//  Created by zx on 1/7/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "UILabel+FontSize.h"

@implementation UILabel (FontSize)
- (void)setFontSize:(float)size {
    [self setFont:[UIFont systemFontOfSize:size]];
}
@end
