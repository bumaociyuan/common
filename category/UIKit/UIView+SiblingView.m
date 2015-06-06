//
//  UIView+SiblingView.m
//  relonline
//
//  Created by noteant-3 on 13-11-7.
//  Copyright (c) 2013年 noteant-3. All rights reserved.
//

#import "UIView+SiblingView.h"

@implementation UIView (SiblingView)
- (UIView *)siblingViewWithTag:(NSInteger)tag {
   return [self.superview viewWithTag:tag];
}
@end
