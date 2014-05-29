//
//  UIImage+resizeImage.h
//  
//
//  Created by zx on 2/16/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (resizeImage)
- (UIImage *)resizeToSize:(CGSize)newSize;
- (UIImage *)resizeToScale:(CGFloat)newScale;
- (UIImage *)imageBlackAndWhite;@end
