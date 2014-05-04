//
//  CommonUtilities.h
//  
//
//  Created by zx on 3/13/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonUtilities : NSObject
+ (UIViewController *)topViewController;
+ (NSArray *)imageUrlsInHtmlString:(NSString *)htmlString;
+ (NSString *)stringFromHtmlString:(NSString *)htmlString;

//比较版本号 1.5.1>1.2.2
+ (BOOL)versionString1:(NSString *)versionString1 isGreaterThanVersionString2:(NSString *)versionString2;

//应用内打开 app store 页面
- (void)openAppWithId:(NSString *)appId;
+ (NSDate *)ymdDateFromDate:(NSDate *)date;
@end
@interface NSUserDefaults (CommonUtilities)
- (void)zx_setObject:(id)obj forKey:(NSString *)key;
@end
