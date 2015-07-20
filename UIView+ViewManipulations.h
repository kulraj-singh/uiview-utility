//
//  UIView+ViewManipulations.h
//  Hawker
//
//  Created by Kulraj Singh on 26/12/14.
//  Copyright (c) 2014 Kulraj Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ViewManipulations)

//rounded corners with border
- (void)roundCornersWithRadius:(int)radius borderColor:(UIColor*)color borderWidth:(int)borderWidth;

//shadow on image
- (void)addShadowAndRasterize:(BOOL)shouldRasterize;
- (void)addShadowAndRasterize:(BOOL)shouldRasterize offset:(CGSize)offset;

//add border
- (void)drawBorderWithColor:(UIColor*)color borderWidth:(int)width;

//gesture capture methods
- (void)addTapRecognizerWithTarget:(NSObject*)target selector:(SEL)selector;

- (void)addHorizontalSwipeRecognizersWithTarget:(NSObject*)target leftSwipeSelector:(SEL)leftSwipeSelector rightSwipeSelector:(SEL)rightSwipeSelector;

//animation methods
- (void)translateWithOffset:(CGPoint)offsetPoint duration:(float)duration;

- (void)animateToFrame:(CGRect)frame duration:(float)duration;

//adding single edge border to any view
- (void)addTopShadeWithWidth:(float)width color:(UIColor*)color;

- (void)addBottomShadeWithWidth:(float)width color:(UIColor*)color cornerRadius:(float)cornerRadius;

- (void)addRightBorderWithWidth:(float)width color:(UIColor*)color;

@end
