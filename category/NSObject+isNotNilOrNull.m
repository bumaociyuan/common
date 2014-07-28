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
    return self && ![self isKindOfClass:[NSNull class]];
}
@end
