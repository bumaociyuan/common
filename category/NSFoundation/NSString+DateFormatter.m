//
//  NSString+DateFormatter.m
//  crmZztx
//
//  Created by zx on 1/22/15.
//  Copyright (c) 2015 luo hao. All rights reserved.
//

#import "NSString+DateFormatter.h"

@implementation NSString (DateFormatter)

- (NSDate *)dateWithDateFormat:(NSString *)dateFormat {
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc]init];
    }
    dateFormatter.dateFormat = dateFormat;
    
    NSDate *result = nil;
    result = [dateFormatter dateFromString:self];
    return result;
}

@end
