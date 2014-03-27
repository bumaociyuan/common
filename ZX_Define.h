//
//  ZX_Define.h
//  UICollectionViewControllerDemo
//
//  Created by noteant-3 on 13-9-16.
//  Copyright (c) 2013年 zx. All rights reserved.
//

//applicationFrame
#define APP_DELEGATE (AppDelegate *)[[UIApplication sharedApplication]delegate]

#define WINDOW_HEIGHT ([[(AppDelegate *)[[UIApplication sharedApplication]delegate] window] height] + (IOS_7?0:-20))

//    #define WINDOW_HEIGHT [[UIScreen mainScreen] applicationFrame].size.height

/**
 *  common functions
 */


#define ZXLocalized(string) [TSLanguageManager localizedString:string]

#define NSLog(FORMAT, ...) fprintf(stderr, "%s:%d----->  \t%s\n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ## __VA_ARGS__] UTF8String]);




//#define IMAGE_WITH_NAME(name) [UIImage imageWithContentsOfFile :[[NSBundle mainBundle] pathForAuxiliaryExecutable:name]]


#define RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }

/**
 *  color define
 */
#define RANDOM_COLOR [UIColor colorWithRed:(float)random() / (float)RAND_MAX green:(float)random() / (float)RAND_MAX blue:(float)random() / (float)RAND_MAX alpha:1]

#define HEX_COLOR(hexValue) [UIColor colorWithRed : ((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green : ((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue : ((float)(hexValue & 0xFF)) / 255.0 alpha : 1.0]

#define CLEAR_COLOR [UIColor clearColor]

#define BlACK_COLOR [UIColor blackColor]

#define RED_COLOR [UIColor redColor]

#define BLUE_COLOR [UIColor blueColor]

#define WHITE_COLOR [UIColor whiteColor]

#define GREEN_COLOR [UIColor greenColor]

#define YELLOW_COLOR [UIColor yellowColor]

#define ORANGE_COLOR [UIColor orangeColor]

#define Light_GRAY_COLOR [UIColor lightGrayColor]

#define NINE_COLOR HEX_COLOR(0x999999)

#define SIX_COLOR HEX_COLOR(0x666666)

#define THREE_COLOR HEX_COLOR(0x333333)

/**
 *  device functions
 */
#define IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define IPHONE5 (([[UIScreen mainScreen] bounds].size.height - 568) ? NO : YES)

#define SIMULATOR (NSNotFound != [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location)

/**
 *  degrees/radian functions
 */
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian * 180.0) / (M_PI)

/**
 *  random number
 */
#define randomIntBetween(a, b) (MIN(a, b) + arc4random() % (ABS((b) - (a)) + 1))


#define randomFloatBetween(a, b) (((double)arc4random() / 0x100000000) * ABS((b) - (a)) + MIN(a, b))

//documents structure of application
//#define APP_DOCUMENT                [NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
//#define APP_LIBRARY                 [NSSearchPathForDirectoriesInDomains (NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]
//#define APP_CACHES_PATH             [NSSearchPathForDirectoriesInDomains (NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
//#define APP_USERINFO_PATH           userInfoPath()

#define UserDefaults [NSUserDefaults standardUserDefaults]
#define NotificationCenter [NSNotificationCenter defaultCenter]

// System Information

#define App_Version [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])


#define IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

