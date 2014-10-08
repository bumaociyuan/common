//
//  UIViewController+AwakeFromStoryBoard.h
//  
//
//  Created by zx on 1/21/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AwakeFromStoryBoard)
+ (instancetype)instanceFromStoryBoard;
+ (instancetype)instanceFromStoryBoard:(NSString *)storyBoardName identifier:(NSString *)identifier;
@end
