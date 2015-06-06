//
//  NSObject+isEqual.m
//  crmZztx
//
//  Created by niko on 10/9/14.
//  Copyright (c) 2014 luo hao. All rights reserved.
//

#import "NSObject+isEqual.h"

@implementation NSObject (isEqual)
- (BOOL)zx_isEqual:(id)object {
    __block BOOL result = NO;

    if (([self isKindOfClass:[NSNumber class]] && [object isKindOfClass:[NSNumber class]]) ||  ([self isKindOfClass:[NSString class]] && [object isKindOfClass:[NSNumber class]]) || ([object isKindOfClass:[NSString class]] && [self isKindOfClass:[NSNumber class]])) {
       
        result = [(NSString *)self integerValue]== [object integerValue];
        
    }else if ([self isKindOfClass:[NSString class]]) {
        
        result = [(NSString *)self isEqualToString:object];
        
    }else if ([self isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dic = (NSDictionary *)self;
        result = YES;
        //TODO: self.allKeys.count == dic.allKeys.count
        [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            id  value = object[key];
            
            if (![obj zx_isEqual:value]) {
                result = NO;
                *stop = YES;
            }
        }];
    }else if ([self isKindOfClass:[NSArray class]]) {
        NSArray *arr = (NSArray *)self;
        result = YES;
        [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if (![arr zx_isEqual:object[idx]]) {
                result = NO;
                *stop = YES;
            }
        }];
    }else if ([self isKindOfClass:[NSNull class]]) {
        
        result = [object isKindOfClass:[NSNull class]];
    }else {
        NSAssert(1, @"未实现此类的比较方法");
    }
    
    return result;
}
@end
