//
//  NSDictionary+hasKey.m
//  crmZztx
//
//  Created by zx on 2/11/15.
//  Copyright (c) 2015 luo hao. All rights reserved.
//

#import "NSDictionary+hasKey.h"

@implementation NSDictionary (hasKey)

- (BOOL)hasKey:(NSString *)key {
    return self[key];
}

@end
