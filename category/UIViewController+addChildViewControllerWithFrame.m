//
//  UIViewController+addChildViewControllerWithFrame.m
//  crmZztx
//
//  Created by niko on 11/20/14.
//  Copyright (c) 2014 luo hao. All rights reserved.
//

#import "UIViewController+addChildViewControllerWithFrame.h"

@implementation UIViewController (addChildViewControllerWithFrame)

- (void)addChildViewController:(UIViewController *)childController frame:(CGRect)frame {
    [self addChildViewController:childController];
    [childController willMoveToParentViewController:self];
    [self.view addSubview:childController.view];
    childController.view.frame = frame;
    [childController didMoveToParentViewController:self];
}

- (void)addChildViewController:(UIViewController *)childController operation:(void(^)(UIViewController *,UIViewController *))operation {
    [self addChildViewController:childController];
    [childController willMoveToParentViewController:self];
    [self.view addSubview:childController.view];
    if (operation) {
        operation(self,childController);
    }
    [childController didMoveToParentViewController:self];
}

@end
