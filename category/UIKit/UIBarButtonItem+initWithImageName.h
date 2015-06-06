//
//  UIBarButtonItem+initWithImageName.h
//  lottowinnersv2
//
//  Created by Mac Mini on 4/17/14.
//  Copyright (c) 2014 com.qaik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (initWithImageName)
+ (instancetype)barbuttonItemWithImage:(UIImage *)image target:(id)target action:(SEL)action;
+ (instancetype)barbuttonItemWithImage:(UIImage *)image title:(NSString *)title target:(id)target action:(SEL)action;

+ (instancetype)barbuttonItemWithImage:(UIImage *)image disableImage:(UIImage *)disableImage title:(NSString *)title target:(id)target action:(SEL)action;
@end
