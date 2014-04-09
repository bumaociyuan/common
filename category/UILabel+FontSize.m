//
//  UILabel+FontSize.m
//  lenovoRelonline
//
//  Created by noteant-6 on 1/7/14.
//  Copyright (c) 2014 noteant-6. All rights reserved.
//

#import "UILabel+FontSize.h"

@implementation UILabel (FontSize)
- (void)setFontSize:(float)size {
    [self setFont:[UIFont systemFontOfSize:size]];
}
@end
