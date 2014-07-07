//
//  UIView+addShadow.m
//  lottowinnersv2
//
//  Created by Mac Mini on 5/23/14.
//  Copyright (c) 2014 com.qaik. All rights reserved.
//

#import "UIView+addShadow.h"

@implementation UIView (addShadow)
- (void)addShadow {
    self.layer.shadowColor = BlACK_COLOR.CGColor;
    self.layer.shadowRadius = 5;
    self.layer.shadowOffset = CGSizeZero;
    self.layer.shadowOpacity = .5;
//    CGRect bounds = self.frame;
//    bounds.size.height = 10;
//    self.clipsToBounds = NO; // Without this row it doesn't display any shadow, at least for a table view
//    view.layer.shadowColor = [UIColor blackColor].CGColor;
//    view.layer.shadowOpacity = 0.9f;
//    view.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
//    view.layer.shadowRadius = 5.0f;
//    view.layer.shadowPath = [UIBezierPath bezierPathWithRect:bounds].CGPath;
}
@end
