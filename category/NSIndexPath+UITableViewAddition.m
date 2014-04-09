//
//  NSIndexPath+UITableViewAddition.m
//  lenovoRelonline
//
//  Created by noteant-6 on 1/9/14.
//  Copyright (c) 2014 noteant-6. All rights reserved.
//

#import "NSIndexPath+UITableViewAddition.h"

@implementation NSIndexPath (UITableViewAddition)
+ (NSMutableArray *)indexPathsFromZeroToSomeRowWithRowsCount:(int)rowCount {
    NSMutableArray *result = [NSMutableArray new];
    for (int i = 0; i < rowCount; i++) {
        [result addObject:[NSIndexPath indexPathForRow:i inSection:0]];
    }
    return result;
}
@end
