//
//  NSIndexPath+UITableViewAddition.h
//  
//
//  Created by zx on 1/9/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (UITableViewAddition)
+ (NSMutableArray *)indexPathsFromZeroToSomeRowWithRowsCount:(int)rowCount;//return an array of NSIndexPath count of maxRow + 1 ,section is 0
@end
