//
//  NSString+replace.m
//  crmZztx
//
//  Created by niko on 14-7-31.
//  Copyright (c) 2014年 luo hao. All rights reserved.
//

#import "NSString+replace.h"

@implementation NSString (replace)

- (NSString *)replaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement {
    NSMutableString *copy = self.mutableCopy;
    [copy replaceOccurrencesOfString:target withString:replacement options:NSCaseInsensitiveSearch range:NSMakeRange(0, self.length)];
    return copy;
}

@end
