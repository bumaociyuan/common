//
//  SVPullToRefresh.h
//  SVPullToRefreshDemo
//
// Created by Sam Vermette on 23.04.12.
// Copyright (c) 2012 samvermette.com. All rights reserved.
//
// https://github.com/samvermette/SVPullToRefresh
//

// this header file is provided for backwards compatibility and will be removed in the future
// here's how you should import SVPullToRefresh now:

#import "UIScrollView+SVPullToRefresh.h"
#import "UIScrollView+SVInfiniteScrolling.h"
#import "ZX_Define.h"
#import <objc/runtime.h>


@interface UIScrollView (zx)
@property (nonatomic, strong) NSObject *isLoading;
@end

@implementation UIScrollView (zx)

ZX_CATEGORY_PROPERTY(isLoading, setIsLoading, NSObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC, {
})

@end