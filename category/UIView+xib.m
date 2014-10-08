//
//  UIView+xib.m
//  crmZztx
//
//  Created by niko on 14-7-23.
//  Copyright (c) 2014年 luo hao. All rights reserved.
//

#import "UIView+xib.h"

@implementation UIView (xib)

+ (instancetype)instanceFromXib {
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil];
    UIView *result = [nib objectAtIndex:0];
    return result;
}

@end
