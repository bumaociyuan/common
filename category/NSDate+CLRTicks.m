//
//  NSDate+CLRTicks.m
//  crmZztx
//
//  Created by niko on 6/18/14.
//  Copyright (c) 2014 luo hao. All rights reserved.
//

#import "NSDate+CLRTicks.h"

@implementation NSDate (CLRTicks)
//+ (NSDate *)dateWithCLRTicks:(int64_t)ticks {
//    return [NSDate dateWithCLRTicks:ticks withTimeIntervalAddition:0.0];
//}

+ (NSDate *)dateWithCLRTicks:(int64_t)ticks withTimeIntervalAddition:(NSTimeInterval)timeIntervalAddition {
    const double GMTOffset = [[NSTimeZone defaultTimeZone] secondsFromGMT];
    const int64_t CLROffset = 621355968000000000;
    double timeStamp = ((double)(ticks - CLROffset) / 10000000.0) - GMTOffset + timeIntervalAddition;
    
    return [NSDate dateWithTimeIntervalSince1970:timeStamp];
}

+ (NSDate *)dateWithCLRTicks:(long long)ticks
{
//    long long sss = [_birthDay longLongValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(ticks/1000)+8*3600];
    return date;

}

+ (long long)ticksWithDate:(NSDate *)date {
    long long result = [date timeIntervalSinceDate:[NSDate dateWithTimeIntervalSince1970:0]];
//    result = result - 8*3600;
    result = result * 1000;
    return result;
}
@end
