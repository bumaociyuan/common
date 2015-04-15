//
//  CommonUtilities.h
//  
//
//  Created by zx on 3/13/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Social/Social.h>

@class MKMapView;

@interface CommonUtilities : NSObject

+ (UIViewController *)topViewController;
+ (NSArray *)imageUrlsInHtmlString:(NSString *)htmlString;
+ (NSString *)stringFromHtmlString:(NSString *)htmlString;//hhahh

+ (NSString *)stringByStrippingHTMLString:(NSString *)htmlString;//hahah

//比较版本号 1.5.1>1.2.2
+ (BOOL)versionString1:(NSString *)versionString1 isGreaterThanVersionString2:(NSString *)versionString2;

+ (void)playVibration;

+ (void)playSystemSound;

//检测地图app
//@"comgooglemaps://"
//@"iosamap://navi"
//@"baidumap://map/"
//+(NSArray *)checkMapApps;
+ (SLComposeViewController *)composeViewControllerWithServiceType:(NSString *)serviceType initialText:(NSString *)initialText image:(UIImage *)image urlString:(NSString *)urlString;

//应用内打开 app store 页面
- (void)openAppWithId:(NSString *)appId;

+ (NSDate *)ymdDateFromDate:(NSDate *)date;

+ (BOOL)networkEnabled;

+ (void)zoomToFitMapAnnotations:(MKMapView *)mapView;

+ (void)pasteString:(NSString *)string;

+ (void)pasteImage:(UIImage *)image;


/*!
 *  no call back TODO:add call back
 *
 *  @param image image to save
 */
+ (void)saveImageToAlbum:(UIImage *)image;

@end

//void Swizzle(Class c, SEL orig, SEL new)
//{
//    Method origMethod = class_getInstanceMethod(c, orig);
//    Method newMethod = class_getInstanceMethod(c, new);
//    if(class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
//        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
//    else
//        method_exchangeImplementations(origMethod, newMethod);
//}