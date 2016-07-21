//
//  UIView+Anchorable.m
//  YQlayout
//
//  Created by gengyongqiang on 16/7/20.
//  Copyright © 2016年 speedoflight. All rights reserved.
//

#import "UIView+Anchorable.h"
#import "UIView+Frameable.h"
#import "UIView+YQConstants.h"

@implementation UIView (Anchorable)

#pragma mark - 填充
- (void)fillSuperview {

    self.frame = CGRectMake(0, 0, self.superFrame.size.width, self.superFrame.size.height);

}

- (void)fillSuperviewByleft:(CGFloat)left right:(CGFloat)right top:(CGFloat)top bottom:(CGFloat)bottom {

    CGFloat width = self.superFrame.size.width - (left + right);
    CGFloat height = self.superFrame.size.height - (top + bottom);
    self.frame = CGRectMake(left, top, width, height);
}

#pragma mark - 在父试图居中
- (void)anchorInCenterBywidth:(CGFloat)width height:(CGFloat)height{

    CGFloat xOrigin = (self.superFrame.size.width / 2.0) - (width / 2.0);
    CGFloat yOrigin = (self.superFrame.size.height / 2.0) - (height / 2.0);
    self.frame = CGRectMake(xOrigin, yOrigin, width, height);
    if (height == AutoHeight) {
        [self setDimensionAutomatically];
        [self anchorInCenterBywidth:width height:self.height];
    }
    if (width == AutoWidth) {
        [self setDimensionAutomatically];
        [self anchorInCenterBywidth:self.width height:height];
    }
}

#pragma mark - 在父试图角落
- (void)anchorInCorner:(Corner)corner xPad:(CGFloat)xPad yPad:(CGFloat)yPad width:(CGFloat)width height:(CGFloat)height{


    CGFloat xOrigin = 0.0;
    CGFloat yOrigin = 0.0;

    switch (corner) {
        case TopLeft:
            xOrigin = xPad;
            yOrigin = yPad;

            break;
        case BottomLeft:
            xOrigin = xPad;
            yOrigin = self.superFrame.size.height - height - yPad;

            break;
        case TopRight:
            xOrigin = self.superFrame.size.height - height - xPad;
            yOrigin = yPad;

            break;
        case BottomRight:
            xOrigin = self.superFrame.size.width - width - xPad;
            yOrigin = self.superFrame.size.height - height - yPad;

            break;

        default:
            break;
    }
        self.frame =  CGRectMake(xOrigin, yOrigin, width, height);

        if (height == AutoHeight) {
            [self setDimensionAutomatically];
            [self anchorInCorner:corner xPad:xPad yPad:yPad width:width height:self.height];
        }
        if (width == AutoWidth) {
            [self setDimensionAutomatically];
            [self anchorInCorner:corner xPad:xPad yPad:yPad width:self.width height:height];
        }

}

#pragma mark - 父视图距边缘
- (void)anchorToEdge:(Edge)edge padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height{

    CGFloat xOrigin  = 0.0;
    CGFloat yOrigin  = 0.0;
    switch (edge) {
       
        case Top:
            xOrigin = (self.superFrame.size.width / 2.0) - (width / 2.0);
            yOrigin = padding;

            break;
        case Left:
            xOrigin = padding;
            yOrigin = (self.superFrame.size.height / 2.0) - (height / 2.0);

            break;
        case Bottom:
            xOrigin = (self.superFrame.size.width / 2.0) - (width / 2.0);
            yOrigin = self.superFrame.size.height - height - padding;

            break;
        case Right:
            xOrigin = self.superFrame.size.width - width - padding;
            yOrigin = (self.superFrame.size.height / 2.0) - (height / 2.0);

            break;

        default:
            break;
    }

    self.frame = CGRectMake(xOrigin, yOrigin, width, height);

    if (height == AutoHeight) {
        [self setDimensionAutomatically];
        [self anchorToEdge:edge padding:padding width:width height:self.height];

    }
    if (width == AutoWidth) {
        [self setDimensionAutomatically];
        [self anchorToEdge:edge padding:padding width:self.width height:height];
    }

}

#pragma mark - 父视图距边缘 宽或高填充
- (void)anchorAndFillEdge:(Edge)edge xPad:(CGFloat)xPad yPad:(CGFloat)yPad otherSize:(CGFloat)otherSize{

    CGFloat xOrigin = 0.0;
    CGFloat yOrigin = 0.0;
    CGFloat width = 0.0;
    CGFloat height = 0.0;
    BOOL autoSize = false;

    switch (edge) {
        case Top:
            xOrigin = xPad;
            yOrigin = yPad;
            width = self.superFrame.size.width - (2 * xPad);
            height = otherSize;
            autoSize = true;

            break;
        case Left:
            xOrigin = xPad;
            yOrigin = yPad;
            width = otherSize;
            height = self.superFrame.size.height - (2 * yPad);

            break;
        case Bottom:
            xOrigin = xPad;
            yOrigin = self.superFrame.size.height - otherSize - yPad;
            width = self.superFrame.size.width - (2 * xPad);
            height = otherSize;
            autoSize = true;

            break;
        case Right:
            xOrigin = self.superFrame.size.width - otherSize - xPad;
            yOrigin = yPad;
            width = otherSize;
            height = self.superFrame.size.height - (2 * yPad);

            break;

        default:
            break;
    }
    if (width < 0.0) {
        width = 0.0;
    }

    self.frame = CGRectMake(xOrigin, yOrigin, width, height);
    if (height == AutoHeight && autoSize) {
        [self setDimensionAutomatically];
        [self anchorAndFillEdge:edge xPad:xPad yPad:yPad otherSize:otherSize];
    }

}

@end
