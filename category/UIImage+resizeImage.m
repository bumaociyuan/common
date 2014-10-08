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
    CIImage *beginImage = [CIImage imageWithCGImage:self.CGImage];
    
    CIImage *blackAndWhite = [CIFilter filterWithName:@"CIColorControls" keysAndValues:kCIInputImageKey, beginImage, @"inputBrightness", [NSNumber numberWithFloat:0.0], @"inputContrast", [NSNumber numberWithFloat:1.1], @"inputSaturation", [NSNumber numberWithFloat:0.0], nil].outputImage;
    CIImage *output = [CIFilter filterWithName:@"CIExposureAdjust" keysAndValues:kCIInputImageKey, blackAndWhite, @"inputEV", [NSNumber numberWithFloat:0.7], nil].outputImage;
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgiimage = [context createCGImage:output fromRect:output.extent];
    UIImage *newImage = [UIImage imageWithCGImage:cgiimage];
    
    CGImageRelease(cgiimage);
    
    return newImage;
}
@end
