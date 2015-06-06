//
//  UIImage+SplashImage.h
//  crmZztx
//
//  Created by zx on 4/10/15.
//  Copyright (c) 2015 luo hao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SplashImage)

/**
 * Return the name of the splash image for a given orientation.
 * @param orientation The interface orientation.
 * @return The name of the splash image.
 **/
+ (NSString *)splashImageNameForOrientation:(UIDeviceOrientation)orientation;

/**
 * Returns the splash image for a given orientation.
 * @param orientation The interface orientation.
 * @return The splash image.
 **/
+ (UIImage*)splashImageForOrientation:(UIDeviceOrientation)orientation;

+ (UIImage *)appIcomImage;

@end
