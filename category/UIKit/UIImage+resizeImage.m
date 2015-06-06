//
//  UIImage+resizeImage.m
//  lenovoRelonline
//
//  Created by noteant-6 on 2/16/14.
//  Copyright (c) 2014 noteant-6. All rights reserved.
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

- (UIImage *)resizeToScale:(CGFloat)newScale {
    CGSize originSize = self.size;
    CGSize newSize;
    newSize.width = originSize.width * newScale;
    newSize.height = originSize.height * newScale;
    return [self resizeToSize:newSize];
}

- (UIImage *)resizeToWidth:(CGFloat)newWidth {
    float scale = newWidth/self.size.width;
    return [self resizeToScale:scale];
}

- (UIImage *)resizeToHeight:(CGFloat)newHeight {
    float scale = newHeight/self.size.height;
    return [self resizeToScale:scale];
}

- (UIImage *)imageBlackAndWhite
{
    UIImage *i = self;
    // Create a graphic context.
    UIGraphicsBeginImageContextWithOptions(i.size, YES, 1.0);
    CGRect imageRect = CGRectMake(0, 0, i.size.width, i.size.height);
    // Draw the image with the luminosity blend mode.
    [i drawInRect:imageRect blendMode:kCGBlendModeLuminosity alpha:1.0];
    // Get the resulting image.
    UIImage *filteredImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return filteredImage;
}
@end
