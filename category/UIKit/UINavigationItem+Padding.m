//
//  UINavigationItem+Padding.m
//
//
//  Created by zx on 1/2/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "UINavigationItem+Padding.h"
#import <objc/runtime.h>
@implementation UINavigationItem (Padding)

- (BOOL)isIOS7
{
    return ([[[UIDevice currentDevice] systemVersion] compare:@"7" options:NSNumericSearch] != NSOrderedAscending);
}

- (UIBarButtonItem *)spacerWidth:(float)width
{
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //    space.width = -11;
    space.width = width;
    return space;
}

- (void)mk_setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem
{
    if ([self isIOS7] && leftBarButtonItem) {
        [self mk_setLeftBarButtonItem:nil];
        if (leftBarButtonItem.customView) {
            [self mk_setLeftBarButtonItems:@[[self spacerWidth:-11], leftBarButtonItem]];
        }else {
            [self mk_setLeftBarButtonItem:leftBarButtonItem];
        }
    } else {
        [self mk_setLeftBarButtonItem:leftBarButtonItem];
    }
}

- (void)mk_setLeftBarButtonItems:(NSArray *)leftBarButtonItems
{
    if ([self isIOS7] && leftBarButtonItems && leftBarButtonItems.count > 0) {
        
        NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:leftBarButtonItems.count + 1];
        [items addObject:[self spacerWidth:0]];
        [items addObjectsFromArray:leftBarButtonItems];
        
        [self mk_setLeftBarButtonItems:items];
    } else {
        [self mk_setLeftBarButtonItems:leftBarButtonItems];
    }
}

- (void)mk_setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem
{
    if ([self isIOS7]) {
        [self mk_setRightBarButtonItem:nil];
        if (rightBarButtonItem.customView) {
            [self mk_setRightBarButtonItems:@[[self spacerWidth:-11],rightBarButtonItem]];
        }else if (rightBarButtonItem.width == 44){
            [self mk_setRightBarButtonItems:@[[self spacerWidth:-11],rightBarButtonItem]];

        }else{
            [self mk_setRightBarButtonItem:rightBarButtonItem];
        }
    } else {
        [self mk_setRightBarButtonItem:rightBarButtonItem];
    }
}

- (void)mk_setRightBarButtonItems:(NSArray *)rightBarButtonItems
{
    if ([self isIOS7] && rightBarButtonItems && rightBarButtonItems.count > 0) {
        
        NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:rightBarButtonItems.count + 1];
        
        [items addObjectsFromArray:rightBarButtonItems];
        [items addObject:[self spacerWidth:0]];
        
        [self mk_setRightBarButtonItems:items];
    } else {
        [self mk_setRightBarButtonItems:rightBarButtonItems];
    }
}

+ (void)mk_swizzle:(SEL)aSelector
{
    SEL bSelector = NSSelectorFromString([NSString stringWithFormat:@"mk_%@", NSStringFromSelector(aSelector)]);
    
    Method m1 = class_getInstanceMethod(self, aSelector);
    Method m2 = class_getInstanceMethod(self, bSelector);
    
    method_exchangeImplementations(m1, m2);
}

+ (void)load
{
    [self mk_swizzle:@selector(setLeftBarButtonItem:)];
    [self mk_swizzle:@selector(setLeftBarButtonItems:)];
    [self mk_swizzle:@selector(setRightBarButtonItem:)];
    [self mk_swizzle:@selector(setRightBarButtonItems:)];
}

@end
