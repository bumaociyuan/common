//
//  CommonUtilities.m
//  lenovoRelonline
//
//  Created by noteant-6 on 3/13/14.
//  Copyright (c) 2014 noteant-6. All rights reserved.
//

#import "CommonUtilities.h"
#import <StoreKit/StoreKit.h>
@implementation CommonUtilities

+ (UIViewController *)topViewController {
    return [self topViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController *)topViewController:(UIViewController *)rootViewController
{
    if (rootViewController.presentedViewController == nil) {
        return rootViewController;
    }
    
    if ([rootViewController.presentedViewController isMemberOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return [self topViewController:lastViewController];
    }
    
    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    return [self topViewController:presentedViewController];
}

+ (NSArray *)imageUrlsInHtmlString:(NSString *)htmlString {
    NSMutableArray *result = [NSMutableArray new];
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(<img\\s[\\s\\S]*?src\\s*?=\\s*?['\"](.*?)['\"][\\s\\S]*?>)+?"
                                                                           options:NSRegularExpressionCaseInsensitive

                                                                             error:&error];
    
    NSArray *array = nil;
    array = [regex matchesInString:htmlString options:0 range:NSMakeRange(0, [htmlString length])];
    NSString *str1 = nil;
    for (NSTextCheckingResult* b in array)
    {
//        str1 是每个和表达式匹配好的字符串。
        str1 = [htmlString substringWithRange:b.range];
        NSLog(@" str 1 is %@",str1);
        NSArray *seperatedByQuotes = [str1 componentsSeparatedByString:@"\""];
        [seperatedByQuotes enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
            if ([obj hasPrefix:@"http"]) {
                [result addObject:obj];
            }
        }];
        str1 = nil;
    }
    
    
//    获得匹配的字符串的个数
//    NSUInteger numberOfMatches = [regex numberOfMatchesInString:htmlString options:0 range:NSMakeRange(0, [htmlString length])];
    
//    替换匹配的字符串  $0很重要 $0不行的话 $1依此类推 打印了看结果
//    NSString *modifiedString = [regex stringByReplacingMatchesInString:htmlString
//                                                               options:0
//                                                                 range:NSMakeRange(0, [htmlString length])
//                                                          withTemplate:@"$0"];
//    NSLog(@"######## the modified string is %@",modifiedString);
    
    return result;
}


+ (NSString *)stringFromHtmlString:(NSString *)htmlString {
    
    NSScanner *myScanner;
    NSString *text = nil;
    myScanner = [NSScanner scannerWithString:htmlString];
    
    while ([myScanner isAtEnd] == NO) {
        
        [myScanner scanUpToString:@"<" intoString:NULL] ;
        
        [myScanner scanUpToString:@">" intoString:&text] ;
        
        htmlString = [htmlString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] withString:@""];
    }
    //
    htmlString = [htmlString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return htmlString;
}

+ (BOOL)versionString1:(NSString *)versionString1 isGreaterThanVersionString2:(NSString *)versionString2 {
    BOOL result = NO;
    result = [versionString2 compare:versionString1 options:NSNumericSearch]  == NSOrderedAscending;
    return result;
}

- (void)openAppWithId:(NSString *)_appId {
    Class storeVC = NSClassFromString(@"SKStoreProductViewController");
    if (storeVC != nil) {
        SKStoreProductViewController *_SKSVC = [[SKStoreProductViewController alloc] init];
//        _SKSVC.delegate = self;
        [_SKSVC loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier: _appId}
                          completionBlock:^(BOOL result, NSError *error) {
                              if (result) {
//                                  [self presentViewController:_SKSVC
//                                                     animated:YES
//                                                   completion:nil];
                              }
                              else{
                                  NSLog(@"%@",error);
                              }
                          }];
    }
    else{
        //低于iOS6没有这个类
        NSString *_idStr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/us/app/id%@?mt=8",_appId];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_idStr]];
    }
}
@end
