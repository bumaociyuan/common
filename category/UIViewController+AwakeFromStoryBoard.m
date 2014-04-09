//
//  UIViewController+AwakeFromStoryBoard.m
//  lenovoRelonline
//
//  Created by noteant-6 on 1/21/14.
//  Copyright (c) 2014 noteant-6. All rights reserved.
//

#import "UIViewController+AwakeFromStoryBoard.h"
@implementation UIViewController (AwakeFromStoryBoard)
+ (instancetype)instanceFromStoryBoard {
    id vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
    return vc;
}


@end
