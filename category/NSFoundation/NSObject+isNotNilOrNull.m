//
//  NSObject+isNotNilOrNull.m
//  crmZztx
//
//  Created by niko on 14-7-24.
//  Copyright (c) 2014年 luo hao. All rights reserved.
//

#import "NSObject+isNotNilOrNull.h"

@implementation NSObject (isNotNilOrNull)
- (BOOL)isNotNilOrNull {
    return ![self isKindOfClass:[NSNull class]];
}

- (BOOL)isNotNilOrNullOrEmpty {
    BOOL notEmpty = YES;
    if ([self respondsToSelector:@selector(length)]) {
        notEmpty = [(NSString *)self length];
    }else if ([self respondsToSelector:@selector(count)]) {
        notEmpty = [(NSArray *)self count];
    }
    return [self isNotNilOrNull] && notEmpty;
}
@end
