//
//  UIBarButtonItem+initWithImageName.m
//  lottowinnersv2
//
//  Created by Mac Mini on 4/17/14.
//  Copyright (c) 2014 com.qaik. All rights reserved.
//

#import "UIBarButtonItem+initWithImageName.h"

@implementation UIBarButtonItem (initWithImageName)
+ (instancetype)barbuttonItemWithImage:(UIImage *)image target:(id)target action:(SEL)action {
    return [self barbuttonItemWithImage:image title:nil target:target action:action];
}
+ (instancetype)barbuttonItemWithImage:(UIImage *)image title:(NSString *)title target:(id)target action:(SEL)action{
    return [self barbuttonItemWithImage:image disableImage:nil title:title target:target action:action];
}

+ (instancetype)barbuttonItemWithImage:(UIImage *)image disableImage:(UIImage *)disableImage title:(NSString *)title target:(id)target action:(SEL)action {
    UIBarButtonItem * result = nil;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame= CGRectMake(0.0, 0.0, image.size.width, image.size.height);
    button.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    button.titleLabel.shadowOffset = CGSizeMake(0, -1);
    button.titleLabel.shadowColor = [UIColor colorWithWhite:0 alpha:0.5];
    
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    if (disableImage) {
        [button setBackgroundImage:disableImage forState:UIControlStateDisabled];
    }
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, image.size.width, image.size.height) ];
    [view addSubview:button];
    
    result = [[UIBarButtonItem alloc] initWithCustomView:view];
    return result;
}


@end
