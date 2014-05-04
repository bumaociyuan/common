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
    UIBarButtonItem * result = nil;
//    result = [[UIBarButtonItem alloc]initWithImage:image landscapeImagePhone:nil style:UIBarButtonItemStylePlain target:target action:action];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame= CGRectMake(0.0, 0.0, image.size.width, image.size.height);
    button.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    button.titleLabel.shadowOffset = CGSizeMake(0, -1);
    button.titleLabel.shadowColor = [UIColor colorWithWhite:0 alpha:0.5];

    
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, image.size.width, image.size.height) ];
    [view addSubview:button];
    
    result = [[UIBarButtonItem alloc] initWithCustomView:view];
    return result;
}



//-(void)setEnabled:(BOOL)enabled {
//    if (self.customView) {
//        if ([[self.customView.subviews objectAtIndex:0] isKindOfClass:[UIButton class]]) {
//            ((UIButton*)[self.customView.subviews objectAtIndex:0]).enabled = enabled;
//        }
//    }
//}
@end
