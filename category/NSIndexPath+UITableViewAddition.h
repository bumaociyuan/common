//
//  NSIndexPath+UITableViewAddition.h
//  lenovoRelonline
//
//  Created by noteant-6 on 1/9/14.
//  Copyright (c) 2014 noteant-6. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (UITableViewAddition)
+ (NSMutableArray *)indexPathsFromZeroToSomeRowWithRowsCount:(int)rowCount;//return an array of NSIndexPath count of maxRow + 1 ,section is 0
@end
