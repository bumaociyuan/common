//
//  NSDate+DateFormatter.m
//  crmZztx
//
//  Created by zx on 1/22/15.
//  Copyright (c) 2015 luo hao. All rights reserved.
//

#import "NSDate+DateFormatter.h"

@implementation NSDate (DateFormatter)

- (NSString *)stringWithDateFormat:(NSString *)dateFormat {
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc]init];
    }
    dateFormatter.dateFormat = dateFormat;
    
    NSString *result = nil;
    result = [dateFormatter stringFromDate:self];
    return result;
}

@end
