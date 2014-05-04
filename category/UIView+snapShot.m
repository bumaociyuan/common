//
//  UIView+snapShot.m
//  lottowinnersv2
//
//  Created by Mac Mini on 4/23/14.
//  Copyright (c) 2014 com.qaik. All rights reserved.
//

#import "UIView+snapShot.h"

@implementation UIView (snapShot)
- (UIImage *)snapShot {
    CGRect rect = self.frame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
