//
//  UIImage+imageWithColor.m
//  crmZztx
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 luo hao. All rights reserved.
//

#import "UIImage+imageWithColor.h"

@implementation UIImage (imageWithColor)
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 100.0f, 100.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
