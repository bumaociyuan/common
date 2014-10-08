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
    return [self instanceFromStoryBoard:@"UI" identifier:NSStringFromClass([self class])];
}
+ (instancetype)instanceFromStoryBoard:(NSString *)storyBoardName identifier:(NSString *)identifier {
    id vc = [[UIStoryboard storyboardWithName:storyBoardName bundle:nil] instantiateViewControllerWithIdentifier:identifier];
    return vc;
}

@end
