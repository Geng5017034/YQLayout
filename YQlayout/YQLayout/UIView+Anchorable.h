//
//  UIView+Anchorable.h
//  YQlayout
//
//  Created by gengyongqiang on 16/7/20.
//  Copyright © 2016年 speedoflight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YQConstants.h"
@interface UIView (Anchorable)

//fill in superview
- (void)fillSuperview;

- (void)fillSuperviewByleft:(CGFloat)left right:(CGFloat)right top:(CGFloat)top bottom:(CGFloat)bottom;

//center in superview
- (void)anchorInCenterBywidth:(CGFloat)width height:(CGFloat)height;

//cornor in superview
- (void)anchorInCorner:(Corner)corner xPad:(CGFloat)xPad yPad:(CGFloat)yPad width:(CGFloat)width height:(CGFloat)height;

//edge in superview
- (void)anchorToEdge:(Edge)edge padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height;

//edge and file superview
- (void)anchorAndFillEdge:(Edge)edge xPad:(CGFloat)xPad yPad:(CGFloat)yPad otherSize:(CGFloat)otherSize;
@end
