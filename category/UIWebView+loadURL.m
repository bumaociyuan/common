//
//  UIWebView+loadURL.m
//  crmZztx
//
//  Created by niko on 9/30/14.
//  Copyright (c) 2014 luo hao. All rights reserved.
//

#import "UIWebView+loadURL.h"

@implementation UIWebView (loadURL)

- (void)loadURL:(NSString *)url {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self loadRequest:request];
}

@end
