//
//  UIView+ViewManipulations.m
//  Hawker
//
//  Created by Kulraj Singh on 26/12/14.
//  Copyright (c) 2014 Kulraj Singh. All rights reserved.

#import "UIView+ViewManipulations.h"

@implementation UIView (ViewManipulations)

#pragma mark - design

- (void)drawBorderWithColor:(UIColor *)color borderWidth:(int)width
{
  [self roundCornersWithRadius:0 borderColor:color borderWidth:width];
}

- (void)roundCornersWithRadius:(int)radius borderColor:(UIColor *)color borderWidth:(int)borderWidth
{
  self.layer.masksToBounds = YES;
  self.layer.cornerRadius = radius;
  self.layer.borderWidth = borderWidth;
  self.layer.borderColor = color.CGColor;
}

- (void)addShadowAndRasterize:(BOOL)shouldRasterize offset:(CGSize)offset
{
  CALayer* layer = self.layer;
  layer.masksToBounds = NO;
  layer.shadowOffset = offset;
  layer.shadowRadius = 2;
  layer.shadowOpacity = 0.3;
  layer.shouldRasterize = shouldRasterize;
}

- (void)addShadowAndRasterize:(BOOL)shouldRasterize
{
  [self addShadowAndRasterize:shouldRasterize offset:CGSizeMake(2, 2)];
}

#pragma mark - animation

- (void)translateWithOffset:(CGPoint)offsetPoint duration:(float)duration
{
  CGRect frame = self.frame;
  frame.origin.x += offsetPoint.x;
  frame.origin.y += offsetPoint.y;
  [self animateToFrame:frame duration:duration];
}

- (void)animateToFrame:(CGRect)frame duration:(float)duration
{
  [UIView animateWithDuration:duration animations:^(void) {
    self.frame = frame;
  }];
}

#pragma mark - gesture

- (void)addTapRecognizerWithTarget:(NSObject *)target selector:(SEL)selector
{
  UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:target action:selector];
  self.userInteractionEnabled = YES;
  [self addGestureRecognizer:tapRecognizer];
}

- (void)addHorizontalSwipeRecognizersWithTarget:(NSObject *)target leftSwipeSelector:(SEL)leftSwipeSelector rightSwipeSelector:(SEL)rightSwipeSelector
{
  //right swipe
  self.userInteractionEnabled = YES;
  UISwipeGestureRecognizer *rightSwipeRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:target action:rightSwipeSelector];
  rightSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
  [self addGestureRecognizer:rightSwipeRecognizer];
  
  //left swipe
  UISwipeGestureRecognizer *leftSwipeRecogizer = [[UISwipeGestureRecognizer alloc]initWithTarget:target action:leftSwipeSelector];
  leftSwipeRecogizer.direction = UISwipeGestureRecognizerDirectionRight;
  [self addGestureRecognizer:leftSwipeRecogizer];
}

#pragma mark - borders

- (void)addTopShadeWithWidth:(float)width color:(UIColor *)color
{
  CGRect frame = self.frame;
  UIView *viewShade = [[UIView alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y - width, frame.size.width, width)];
  viewShade.backgroundColor = color;
  [self.superview addSubview:viewShade];
}

- (void)addBottomShadeWithWidth:(float)width color:(UIColor *)color cornerRadius:(float)cornerRadius
{
  CGRect frame = self.frame;
  int frameHeight = frame.size.height;
  UIView *viewShade = [[UIView alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y + frameHeight/2, frame.size.width, width + frameHeight/2)];
  viewShade.backgroundColor = color;
  [viewShade roundCornersWithRadius:cornerRadius borderColor:[UIColor clearColor] borderWidth:1];
  viewShade.tag = self.tag;
  [self.superview insertSubview:viewShade belowSubview:self];
}

- (void)addRightBorderWithWidth:(float)width color:(UIColor *)color
{
  CGRect frame = self.frame;
  UIView *viewBorder = [[UIView alloc]initWithFrame:CGRectMake(frame.origin.x + frame.size.width, frame.origin.y, width, frame.size.height)];
  viewBorder.backgroundColor = color;
  [self.superview addSubview:viewBorder];
}

@end
