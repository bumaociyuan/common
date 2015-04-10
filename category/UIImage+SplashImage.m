//
//  UIImage+SplashImage.m
//  crmZztx
//
//  Created by zx on 4/10/15.
//  Copyright (c) 2015 luo hao. All rights reserved.
//

#import "UIImage+SplashImage.h"

@implementation UIImage (SplashImage)
+ (NSString *)splashImageNameForOrientation:(UIDeviceOrientation)orientation {
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    
    NSString *viewOrientation = @"Portrait";
    
    if (UIDeviceOrientationIsLandscape(orientation)) {
        viewSize = CGSizeMake(viewSize.height, viewSize.width);
        viewOrientation = @"Landscape";
    }
    [self appIcomImage];
 
    NSArray *imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    
    for (NSDictionary *dict in imagesDict) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) return dict[@"UILaunchImageName"];
    }
    return nil;
}

+ (UIImage *)splashImageForOrientation:(UIDeviceOrientation)orientation {
    NSString *imageName = [self splashImageNameForOrientation:orientation];
    UIImage *image = [UIImage imageNamed:imageName];
    
    return image;
}

+ (NSString *)appIcomImageName {
    
    NSDictionary *CFBundleIcons = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleIcons"];
    
    NSDictionary *CFBundleIconFiles = CFBundleIcons[@"CFBundlePrimaryIcon"];
    
    NSArray *icons = CFBundleIconFiles[@"CFBundleIconFiles"];
    
    
    return [icons lastObject];
}

+ (UIImage *)appIcomImage {
    NSString *iconName = [self appIcomImageName];
    UIImage *result = [UIImage imageNamed:iconName];
    return result;
}

@end
