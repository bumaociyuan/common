//
//  UIViewController+AwakeFromStoryBoard.m
//  
//
//  Created by zx on 1/21/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "UIViewController+AwakeFromStoryBoard.h"
@implementation UIViewController (AwakeFromStoryBoard)
+ (instancetype)instanceFromStoryBoard {
    id vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
    return vc;
}


@end
