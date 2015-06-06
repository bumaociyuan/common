//
//  NSString+replace.h
//  crmZztx
//
//  Created by niko on 14-7-31.
//  Copyright (c) 2014年 luo hao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (replace)
//replace all string in self
- (NSString *)replaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement;

@end
