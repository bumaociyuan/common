//
//  UIImage+RoundedCorner.h
//  pino
//
//  Created by noteant-3 on 13-10-9.
//  Copyright (c) 2013年 noteant-3. All rights reserved.
//

#import <UIKit/UIKit.h>

// UIImage+RoundedCorner.h
// Created by Trevor Harmon on 9/20/09.
// Free for personal or commercial use, with or without modification.
// No warranty is expressed or implied.

// Extends the UIImage class to support making rounded corners
@interface UIImage (RoundedCorner)
- (UIImage *)roundedCornerImage:(NSInteger)cornerSize borderSize:(NSInteger)borderSize;
@end
