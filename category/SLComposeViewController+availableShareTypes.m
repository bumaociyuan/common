//
//  SLComposeViewController+availableShareTypes.m
//  lottowinnersv2
//
//  Created by Mac Mini on 5/29/14.
//  Copyright (c) 2014 com.qaik. All rights reserved.
//

#import "SLComposeViewController+availableShareTypes.h"

@implementation SLComposeViewController (availableShareTypes)
+ (NSArray *)availableShareTypes {
    NSMutableArray *result = [NSMutableArray new];
    NSArray *allTypes = @[SLServiceTypeTwitter,
                          SLServiceTypeFacebook,
                          SLServiceTypeSinaWeibo,
                          SLServiceTypeTencentWeibo,
                          ];
    [allTypes enumerateObjectsUsingBlock:^(NSString *type, NSUInteger idx, BOOL *stop) {
        if ([SLComposeViewController isAvailableForServiceType:type]) {
            [result addObject:type];
        }
    }];
    return result;
}
@end
