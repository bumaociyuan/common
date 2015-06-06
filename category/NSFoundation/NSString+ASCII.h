//
//  NSString+ASCII.h
//  crmZztx
//
//  Created by niko on 10/31/14.
//  Copyright (c) 2014 luo hao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ASCII)

- (NSInteger)ASCIICode;

+ (NSString *)stringWithASCIICode:(NSInteger)asciiCode;

@end
