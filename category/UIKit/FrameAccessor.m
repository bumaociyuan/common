//
//  FrameAccessor.m
//  FrameAccessor
//
//  Created by Alex Denisov on 18.03.12.
//  Copyright (c) 2013 okolodev.org. All rights reserved.
//

#import "FrameAccessor.h"
#define SPACE 5
@implementation View (FrameAccessor)

- (CGPoint)origin {
	return self.frame.origin;
}

- (void)setOrigin:(CGPoint)newOrigin {
	CGRect newFrame = self.frame;
	newFrame.origin = newOrigin;
	self.frame = newFrame;
}

- (CGSize)size {
	return self.frame.size;
}

- (void)setSize:(CGSize)newSize {
	CGRect newFrame = self.frame;
	newFrame.size = newSize;
	self.frame = newFrame;
}

- (CGFloat)x {
	return self.frame.origin.x;
}

- (void)setX:(CGFloat)newX {
	CGRect newFrame = self.frame;
	newFrame.origin.x = newX;
	self.frame = newFrame;
}

- (CGFloat)y {
	return self.frame.origin.y;
}

- (void)setY:(CGFloat)newY {
	CGRect newFrame = self.frame;
	newFrame.origin.y = newY;
	self.frame = newFrame;
}

- (CGFloat)height {
	return self.frame.size.height;
}

- (void)setHeight:(CGFloat)newHeight {
	CGRect newFrame = self.frame;
	newFrame.size.height = newHeight;
	self.frame = newFrame;
}

- (CGFloat)width {
	return self.frame.size.width;
}

- (void)setWidth:(CGFloat)newWidth {
	CGRect newFrame = self.frame;
	newFrame.size.width = newWidth;
	self.frame = newFrame;
}

#pragma mark - zx


- (CGFloat)maxX {
	return CGRectGetMaxX(self.frame);
}

- (void)setMaxX:(CGFloat)newMaxX {
	CGRect newFrame = self.frame;
	newFrame.origin.x = newMaxX - self.width;
	self.frame = newFrame;
}

- (CGFloat)midX {
    return self.center.x;
}
- (void)setMidX:(CGFloat)newMidX {
    CGRect newFrame = self.frame;
    newFrame.origin.x = newMidX - self.width/2;
    [self setFrame:newFrame];
}


- (CGFloat)maxY {
	return CGRectGetMaxY(self.frame);
}

- (void)setMaxY:(CGFloat)newMaxY {
	CGRect newFrame = self.frame;
	newFrame.origin.y = newMaxY - self.height;
	self.frame = newFrame;
}

- (CGFloat)midY {
    return self.center.y;
}
- (void)setMidY:(CGFloat)newMidY {
    CGRect newFrame = self.frame;
    newFrame.origin.y = newMidY - self.height/2;
    [self setFrame:newFrame];
}

- (CGPoint)rightTop {
	return CGPointMake(self.maxX, self.y);
}

- (void)setRightTop:(CGPoint)point {
	CGRect newFrame = self.frame;
	newFrame.origin.x = point.x - self.width;
	newFrame.origin.y = point.y;
	self.frame = newFrame;
}

- (CGPoint)rightBottom {
	return CGPointMake(self.maxX, self.maxY);
}

- (void)setRightBottom:(CGPoint)point {
	CGRect newFrame = self.frame;
	newFrame.origin.x = point.x - self.width;
	newFrame.origin.y = point.y - self.height;
	self.frame = newFrame;
}

- (CGPoint)leftBottom {
	return CGPointMake(self.x, self.maxY);
}

- (void)setLeftBottom:(CGPoint)point {
	CGRect newFrame = self.frame;
	newFrame.origin.x = point.x;
	newFrame.origin.y = point.y - self.height;
	self.frame = newFrame;
}

- (void)appendTopOfView:(UIView *)aView {
	[self setLeftBottom:aView.origin];
	self.y -= SPACE;
}

- (void)appendRightOfView:(UIView *)aView {
	[self setOrigin:aView.rightTop];
	self.x += SPACE;
}

- (void)appendBottomOfView:(UIView *)aView {
	[self setOrigin:aView.leftBottom];
	self.y += SPACE;
}

- (void)appendLeftOfView:(UIView *)aView {
	[self setRightTop:aView.origin];
	self.x -= SPACE;
}


- (void)appendTopOfView:(UIView *)aView space:(CGFloat)space {
    [self setLeftBottom:aView.origin];
	self.y -= space;
}
- (void)appendRightOfView:(UIView *)aView space:(CGFloat)space {
    [self setOrigin:aView.rightTop];
	self.x += space;
}
- (void)appendBottomOfView:(UIView *)aView space:(CGFloat)space{
    [self setOrigin:aView.leftBottom];
	self.y += space;
}
- (void)appendLeftOfView:(UIView *)aView space:(CGFloat)space{
    [self setRightTop:aView.origin];
	self.x -= space;
}

@end
