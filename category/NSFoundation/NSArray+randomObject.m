//
//  NSArray+randomObject.m
//  lottowinnersv2
//
//  Created by Mac Mini on 5/22/14.
//  Copyright (c) 2014 com.qaik. All rights reserved.
//

#import "NSArray+randomObject.h"

@implementation NSArray (randomObject)
- (id)randomObject {
    id object = self.count == 0 ? nil : self[arc4random_uniform(self.count)];
    return object;
}
@end
