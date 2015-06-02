//
//  CommonUtilities.m
//  
//
//  Created by zx on 3/13/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "CommonUtilities.h"
#import <AudioToolbox/AudioToolbox.h>
#import <StoreKit/StoreKit.h>
#import "Reachability.h"

@import MapKit;
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

+ (NSString *)stringByStrippingHTMLString:(NSString *)htmlString {
    NSRange r;
    NSString *s = [htmlString copy];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

+ (BOOL)versionString1:(NSString *)versionString1 isGreaterThanVersionString2:(NSString *)versionString2 {
    BOOL result = NO;
    result = [versionString2 compare:versionString1 options:NSNumericSearch]  == NSOrderedAscending;
    return result;
}

+ (void)playVibration {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

#define systemSoundID    1003
+ (void)playSystemSound {
    //http://iphonedevwiki.net/index.php/AudioServices
    //    AudioServicesPlaySystemSound (systemSoundID);
    
    //https://github.com/TUNER88/iOSSystemSoundsLibrary
    SystemSoundID soundID;
    NSURL *fileURL = [NSURL URLWithString:@"/System/Library/Audio/UISounds/Modern/calendar_alert_chord.caf"];
    AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef)fileURL, &soundID);
    AudioServicesPlaySystemSound(soundID);
}

+ (NSDictionary *)distanceBetweenCoordinate1:(CLLocationCoordinate2D)coordinate1 coordinate2:(CLLocationCoordinate2D)coordinate2 {
    double longitude1 = coordinate1.longitude;
    double latitude1 = coordinate1.latitude;
    double distance = 0.00;
    double DEF_PI = M_PI; // PI
    double DEF_2PI = M_PI * 2; // 2*PI
    double DEF_PI180 = M_PI / 180; // PI/180.0
    double DEF_R = 6370693.5; // radius of earth
    
    double ew1, ns1, ew2, ns2;
    double dx, dy, dew;
    
    // 角度转换为弧度
    ew1 = longitude1 * DEF_PI180;
    ns1 = latitude1 * DEF_PI180;
    ew2 = coordinate2.longitude * DEF_PI180;
    ns2 = coordinate2.latitude * DEF_PI180;
    
    // 经度差
    dew = ew1 - ew2;
    
    // 若跨东经和西经180 度，进行调整
    if (dew > DEF_PI)
        dew = DEF_2PI - dew;
    else if (dew < -DEF_PI)
        dew = DEF_2PI + dew;
    
    dx = DEF_R * cos(ns1) * dew; // 东西方向长度(在纬度圈上的投影长度)
    dy = DEF_R * (ns1 - ns2); // 南北方向长度(在经度圈上的投影长度)
    
    // 勾股定理求斜边长
    distance = sqrt(dx * dx + dy * dy);
    
    CGFloat result = 0;
    NSString *unit = nil;
    if (distance > 1000) {
        unit = @"公里";
        result = distance / 1000;
    } else {
        unit = @"米";
        result = distance;
    }
    return @{@"distanceString":[NSString stringWithFormat:@"%.2f%@",result,unit],
             @"distance":@(distance)};
    
}

//+(NSArray *)checkMapApps {
//    NSArray *mapSchemeArr = @[@"comgooglemaps://",@"iosamap://navi",@"baidumap://map/"];
//
////    NSMutableArray *appListArr = [[NSMutableArray alloc] initWithObjects:ZXLocalized(@"iOSMap"), nil];
////    
////    for (int i = 0; i < [mapSchemeArr count]; i++) {
////        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[mapSchemeArr objectAtIndex:i]]]]) {
////            if (i == 0) {
////                [appListArr addObject:ZXLocalized(@"googleMap")];
////            }else if (i == 1){
////                [appListArr addObject:ZXLocalized(@"autoNaviMap")];
////            }else if (i == 2){
////                //不检测 百度
////            }
////        }
////    }
//    
//    
//    return appListArr;
//}

+ (SLComposeViewController *)composeViewControllerWithServiceType:(NSString *)serviceType initialText:(NSString *)initialText image:(UIImage *)image urlString:(NSString *)urlString {
    SLComposeViewController *result = nil;
    if ([SLComposeViewController isAvailableForServiceType:serviceType]) {
        NSLog(@"Available");
        
        SLComposeViewController *socialVC = [SLComposeViewController composeViewControllerForServiceType:serviceType];
        
//        // 写一个bolck，用于completionHandler的初始化
//        SLComposeViewControllerCompletionHandler myBlock = ^(SLComposeViewControllerResult result) {
//            if (result == SLComposeViewControllerResultCancelled) {
//                NSLog(@"cancelled");
//            } else
//            {
//                NSLog(@"done");
//            }
//            [socialVC dismissViewControllerAnimated:YES completion:Nil];
//        };
//        // 初始化completionHandler，当post结束之后（无论是done还是cancell）该blog都会被调用
//        socialVC.completionHandler = myBlock;
        
        // 给view controller初始化默认的图片，url，文字信息
        NSURL *url = [NSURL URLWithString:urlString];
        
        [socialVC setInitialText:initialText];
        [socialVC addImage:image];
        [socialVC addURL:url];
        
        result = socialVC;
    } else {
        NSLog(@"UnAvailable");
    }
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

+ (NSDate *)ymdDateFromDate:(NSDate *)date {
    NSCalendar *calendar   = NSCalendar.currentCalendar;
    NSDateComponents *components = [calendar components:NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit
                                               fromDate:date];
    NSDate *result = [calendar dateFromComponents:components];
    return result;
}

+ (BOOL)networkEnabled {
    return [self isEnable3G]&&[self isEnableWIFI];
}
// 是否wifi
+ (BOOL)isEnableWIFI {
    return ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable);
}

// 是否3G
+ (BOOL)isEnable3G {
    return ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable);
}


+ (void)zoomToFitMapAnnotations:(MKMapView*)mapView
{
    if([mapView.annotations count] == 0)
        return;
    
    CLLocationCoordinate2D topLeftCoord;
    topLeftCoord.latitude = -90;
    topLeftCoord.longitude = 180;
    
    CLLocationCoordinate2D bottomRightCoord;
    bottomRightCoord.latitude = 90;
    bottomRightCoord.longitude = -180;
    
    for(id<MKAnnotation> annotation in mapView.annotations)
    {
        topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
        topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);
        
        bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
        bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
    }
    
    MKCoordinateRegion region;
    region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5;
    region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
    region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 1.1; // Add a little extra space on the sides
    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 1.1; // Add a little extra space on the sides
    
    region = [mapView regionThatFits:region];
    [mapView setRegion:region];
}

+ (void)pasteString:(NSString *)string {
    [UIPasteboard generalPasteboard].string = string;
}

+ (void)pasteImage:(UIImage *)image {
    [UIPasteboard generalPasteboard].image = image;
}

+ (void)saveImageToAlbum:(UIImage *)image {
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}
@end


