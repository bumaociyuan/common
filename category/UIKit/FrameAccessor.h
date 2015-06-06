//
//  FrameAccessor.h
//  FrameAccessor
//
//  Created by Alex Denisov on 18.03.12.
//  Copyright (c) 2013 okolodev.org. All rights reserved.
//

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
    #import <UIKit/UIKit.h>
    #define View UIView
#else
    #import <Foundation/Foundation.h>
    #define View NSView
#endif

@interface View (FrameAccessor)

- (CGPoint)origin;
- (void)setOrigin:(CGPoint)newOrigin;

- (CGSize)size;
- (void)setSize:(CGSize)newSize;


- (CGFloat)x;
- (void)setX:(CGFloat)newX;




- (CGFloat)y;
- (void)setY:(CGFloat)newY;

- (CGFloat)height;
- (void)setHeight:(CGFloat)newHeight;

- (CGFloat)width;
- (void)setWidth:(CGFloat)newWidth;
#pragma mark - zx
- (CGFloat)maxX;
- (void)setMaxX:(CGFloat)newMaxX;

- (CGFloat)midX;
- (void)setMidX:(CGFloat)newMidX;

- (CGFloat)maxY;
- (void)setMaxY:(CGFloat)newMaxY;

- (CGFloat)midY;
- (void)setMidY:(CGFloat)newMidY;

- (CGPoint)rightTop;
- (void)setRightTop:(CGPoint)point;

- (CGPoint)rightBottom;
- (void)setRightBottom:(CGPoint)point;

- (CGPoint)leftBottom;
- (void)setLeftBottom:(CGPoint)point;



- (void)appendTopOfView:(UIView *)aView;
- (void)appendRightOfView:(UIView *)aView;
- (void)appendBottomOfView:(UIView *)aView;
- (void)appendLeftOfView:(UIView *)aView;

- (void)appendTopOfView:(UIView *)aView space:(CGFloat)space;
- (void)appendRightOfView:(UIView *)aView space:(CGFloat)space;
- (void)appendBottomOfView:(UIView *)aView space:(CGFloat)space;
- (void)appendLeftOfView:(UIView *)aView space:(CGFloat)space;

@end
