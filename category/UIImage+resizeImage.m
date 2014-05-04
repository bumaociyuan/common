//
//  UIImage+resizeImage.m
//  
//
//  Created by zx on 2/16/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "UIImage+resizeImage.h"

@implementation UIImage (resizeImage)

- (UIImage *)resizeToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
