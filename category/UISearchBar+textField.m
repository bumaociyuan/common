//
//  UISearchBar+textField.m
//  lottowinnersv2
//
//  Created by Mac Mini on 5/28/14.
//  Copyright (c) 2014 com.qaik. All rights reserved.
//

#import "UISearchBar+textField.h"

@implementation UISearchBar (textField)
- (UITextField *)textField {
    UITextField *result = nil;
    for (UIView *subView in self.subviews)
    {
        for (UIView *secondLevelSubview in subView.subviews){
            if ([secondLevelSubview isKindOfClass:[UITextField class]])
            {
                UITextField *searchBarTextField = (UITextField *)secondLevelSubview;
                result = searchBarTextField;
                break;
            }
        }
    }
    return result;
}
@end
