//
//  UIView+Groupable.m
//  YQlayout
//
//  Created by gengyongqiang on 16/7/21.
//  Copyright © 2016年 speedoflight. All rights reserved.
//

#import "UIView+Groupable.h"
#import "UIView+Frameable.h"
#import "UIView+YQConstants.h"

@implementation UIView (Groupable)

#pragma mark - 多个view 居中于父视图
- (void)groupInCenter:(Group)group views:(NSArray <UIView *>*)views padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height {

    if (views.count == 0) {
        NSLog(@"[NEON] Warning: No subviews provided to groupInCenter().");
        return;
    }

    CGFloat xOrigin = 0.0;
    CGFloat yOrigin = 0.0;
    CGFloat xAdjust = 0.0;
    CGFloat yAdjust = 0.0;

    switch (group) {
    case Horizontal:
            xOrigin = (self.width - (views.count * width) - ((views.count - 1) * padding)) / 2.0;
            yOrigin = (self.height / 2.0) - (height / 2.0);
            xAdjust = width + padding;
        break;
    case Vertical:
            xOrigin = (self.width / 2.0) - (width / 2.0);
            yOrigin = (self.height - ((views.count) * height) - ((views.count - 1) * padding)) / 2.0;
            yAdjust = height + padding;
        break;
    default:

        break;
    }

    for (UIView *view in views) {
        view.frame = CGRectMake(xOrigin, yOrigin, width, height);
        xOrigin += xAdjust;
        yOrigin += yAdjust;
    }

}

#pragma mark - 多个view 在角落
- (void)groupInCorner:(Group)group views:(NSArray <UIView *>*)views inCorner:(Corner)corner padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height {

    switch (group) {
    case Horizontal:
            [self groupInCornerHorizontal:views inCorner:corner padding:padding width:width height:height];

        break;

    case Vertical:
            [self groupInCornerVertical:views inCorner:corner padding:padding width:width height:height];
        break;

    default:
        break;
    }


}


#pragma mark - 多个view 在父视图角落
- (void)groupAgainstEdge:(Group)group views:(NSArray <UIView *>*)views againstEdge:(Edge)edge padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height {

    if (views.count == 0) {
        NSLog(@"[NEON] Warning: No subviews provided to groupAgainstEdge().");
        return;
    }

    CGFloat xOrigin = 0.0;
    CGFloat yOrigin = 0.0;
    CGFloat xAdjust = 0.0;
    CGFloat yAdjust = 0.0;

    switch (edge) {
    case Top:
        if (group == Horizontal) {
            xOrigin = (self.width - ((views.count) * width) - ((views.count - 1) * padding)) / 2.0;
            xAdjust = width + padding;
        } else {
            xOrigin = (self.width / 2.0) - (width / 2.0);
            yAdjust = height + padding;
        }

            yOrigin = padding;

        break;
    case Left:
        if (group == Horizontal) {
            yOrigin = (self.height / 2.0) - (height / 2.0);
            xAdjust = width + padding;
        } else {
            yOrigin = (self.height - ((views.count) * height) - ((views.count - 1) * padding)) / 2.0;
            yAdjust = height + padding;
        }

            xOrigin = padding;
        break;

    case Bottom:
        if (group == Horizontal) {
            xOrigin = (self.width - ((views.count) * width) - ((views.count - 1) * padding)) / 2.0;
            yOrigin = self.height - height - padding;
            xAdjust = width + padding;
        } else {
            xOrigin = (self.width / 2.0) - (width / 2.0);
            yOrigin = self.height - ((views.count) * height) - ((views.count) * padding);
            yAdjust = height + padding;
        }

        break;
    case Right:
        if (group == Horizontal) {
            xOrigin = self.width - ((views.count) * width) - ((views.count) * padding);
            yOrigin = (self.height / 2.0) - (height / 2.0);
            xAdjust = width + padding;
        } else {
            xOrigin = self.width - width - padding;
            yOrigin = (self.height - ((views.count) * height) - ((views.count - 1) * padding)) / 2.0;
            yAdjust = height + padding;
        }
        break;

    default:

        break;
    }

    for (UIView *view in views) {
        view.frame = CGRectMake(xOrigin, yOrigin, width, height);

        xOrigin += xAdjust;
        yOrigin += yAdjust;
    }

}



- (void)groupAndAlign:(Group)group andAlign:(Align)align views:(NSArray <UIView *>*)views relativeTo:(UIView *)sibling padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height {
    switch (group) {
    case Horizontal:
            [self groupAndAlignHorizontal:align views:views relativeTo:sibling padding:padding width:width height:height];

        break;
    case Vertical:
            [self groupAndAlignVertical:align views:views relativeTo:sibling padding:padding width:width height:height];

        break;

    default:
        break;
    }

}

#pragma mark - 多个View填充父视图

- (void)groupAndFill:(Group)group views:(NSArray <UIView *>*)views padding:(CGFloat)padding {

    if (views.count == 0) {
        NSLog(@"[NEON] Warning: No subviews provided to groupAndFill().");
        return;
    }

    CGFloat xOrigin = padding;
    CGFloat yOrigin = padding;
    CGFloat width = 0.0;
    CGFloat height = 0.0;
    CGFloat xAdjust = 0.0;
    CGFloat yAdjust = 0.0;

    switch (group) {
    case Horizontal:
            width = (self.width - ((views.count + 1) * padding)) / (views.count);
            height = self.height - (2 * padding);
            xAdjust = width + padding;
        break;
    case Vertical:
            width = self.width - (2 * padding);
            height = (self.height - ((views.count + 1) * padding)) / (views.count);
            yAdjust = height + padding;
        break;

    default:
        break;
    }

    for (UIView *view in views) {
        view.frame = CGRectMake(xOrigin, yOrigin, width, height);

        xOrigin += xAdjust;
        yOrigin += yAdjust;
    }

}


#pragma mark - Private utils
- (void)groupInCornerHorizontal:(NSArray <UIView *>*)views inCorner:(Corner)corner padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height {

    if (views.count == 0) {
        NSLog(@"[NEON] Warning: No subviews provided to groupInCorner().");
        return;
    }

    CGFloat xOrigin = 0.0;
    CGFloat yOrigin = 0.0;
    CGFloat xAdjust = width + padding;

    switch (corner) {
    case TopLeft:
            xOrigin = padding;
            yOrigin = padding;

        break;
    case TopRight:
            xOrigin = self.width - (((views.count) * width) + ((views.count) * padding));
            yOrigin = padding;

        break;
    case BottomLeft:
            xOrigin = padding;
            yOrigin = self.height - height - padding;

        break;
    case BottomRight:
            xOrigin = self.width - (((views.count) * width) + ((views.count) * padding));
            yOrigin = self.height - height - padding;

        break;
    }

    for (UIView *view in views) {
        view.frame = CGRectMake(xOrigin, yOrigin, width, height);
        xOrigin += xAdjust;
    }

}

- (void)groupInCornerVertical:(NSArray <UIView *>*)views inCorner:(Corner)corner padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height {

    if (views.count == 0) {
        NSLog(@"[NEON] Warning: No subviews provided to groupInCorner().");
        return;
    }

    CGFloat xOrigin = 0.0;
    CGFloat yOrigin = 0.0;
    CGFloat yAdjust = height + padding;

    switch (corner) {
        case TopLeft:
            xOrigin = padding;
            yOrigin = padding;

            break;
        case TopRight:
            xOrigin = self.width - width - padding;
            yOrigin = padding;

            break;
        case BottomLeft:
            xOrigin = padding;
            yOrigin = self.height - (((views.count) * height) + ((views.count) * padding));

            break;
        case BottomRight:
            xOrigin = self.width - width - padding;
            yOrigin = self.height - (((views.count) * height) + ((views.count) * padding));

            break;
    }

    for (UIView *view in views) {
        view.frame = CGRectMake(xOrigin, yOrigin, width, height);
        yOrigin += yAdjust;
    }
    
}


- (void)groupAndAlignHorizontal:(Align)align views:(NSArray <UIView *>*)views relativeTo:(UIView *)sibling padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height {

    if (views.count == 0) {
        NSLog(@"[NEON] Warning: No subviews provided to groupInCorner().");
        return;
    }

    CGFloat xOrigin = 0.0;
    CGFloat yOrigin = 0.0;
    CGFloat xAdjust = width + padding;

    switch (align) {
    case ToTheRightMatchingTop:
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.y;

        break;
    case ToTheRightMatchingBottom:
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.yMax - height;

        break;
    case ToTheRightCentered:
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.yMid - (height / 2.0);

        break;
    case ToTheLeftMatchingTop:
            xOrigin = sibling.x - ((views.count) * width) - ((views.count) * padding);
            yOrigin = sibling.y;

        break;
    case ToTheLeftMatchingBottom:
            xOrigin = sibling.x - ((views.count) * width) - ((views.count) * padding);
            yOrigin = sibling.yMax - height;
        break;

    case ToTheLeftCentered:
            xOrigin = sibling.x - ((views.count) * width) - ((views.count) * padding);
            yOrigin = sibling.yMid - (height / 2.0);
        break;
    case UnderMatchingLeft:
            xOrigin = sibling.x;
            yOrigin = sibling.yMax + padding;

        break;
    case UnderMatchingRight:
            xOrigin = sibling.xMax - ((views.count) * width) - ((views.count - 1) * padding);
            yOrigin = sibling.yMax + padding;

        break;
    case UnderCentered:
            xOrigin = sibling.xMid - (((views.count) * width) + ((views.count - 1) * padding)) / 2.0;
            yOrigin = sibling.yMax + padding;

        break;
    case AboveMatchingLeft:
            xOrigin = sibling.x;
            yOrigin = sibling.y - height - padding;

        break;
    case AboveMatchingRight:
            xOrigin = sibling.xMax - ((views.count) * width) - ((views.count - 1) * padding);
            yOrigin = sibling.y - height - padding;

        break;
    case AboveCentered:
            xOrigin = sibling.xMid - (((views.count) * width) + ((views.count - 1) * padding)) / 2.0;
            yOrigin = sibling.y - height - padding;
        break;
    default:
        break;
    }

    for (UIView *view in views) {
        view.frame = CGRectMake(xOrigin, yOrigin, width, height);
        xOrigin += xAdjust;
    }



}



- (void)groupAndAlignVertical:(Align)align views:(NSArray <UIView *>*)views relativeTo:(UIView *)sibling padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height {

    if (views.count == 0) {
        NSLog(@"[NEON] Warning: No subviews provided to groupInCorner().");
        return;
    }

    CGFloat xOrigin = 0.0;
    CGFloat yOrigin = 0.0;
    CGFloat yAdjust = height + padding;

    switch (align) {
        case ToTheRightMatchingTop:
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.y;

            break;
        case ToTheRightMatchingBottom:
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.yMax - ((views.count) * height) - ((views.count - 1) * padding);

            break;
        case ToTheRightCentered:
            xOrigin = sibling.xMax + padding;
            yOrigin = sibling.yMid - (((views.count) * height) + (views.count - 1) * padding) / 2.0;

            break;
        case ToTheLeftMatchingTop:
            xOrigin = sibling.x - width - padding;
            yOrigin = sibling.y;

            break;
        case ToTheLeftMatchingBottom:
            xOrigin = sibling.x - width - padding;
            yOrigin = sibling.yMax - ((views.count) * height) - ((views.count - 1) * padding);

            break;

        case ToTheLeftCentered:
            xOrigin = sibling.x - width - padding;
            yOrigin = sibling.yMid - (((views.count) * height) + (views.count - 1) * padding) / 2.0;

            break;
        case UnderMatchingLeft:
            xOrigin = sibling.x;
            yOrigin = sibling.yMax + padding;

            break;
        case UnderMatchingRight:
            xOrigin = sibling.xMax - width;
            yOrigin = sibling.yMax + padding;

            break;
        case UnderCentered:
            xOrigin = sibling.xMid - (width / 2.0);
            yOrigin = sibling.yMax + padding;

            break;
        case AboveMatchingLeft:
            xOrigin = sibling.x;
            yOrigin = sibling.y - ((views.count) * height) - ((views.count) * padding);

            break;
        case AboveMatchingRight:
            xOrigin = sibling.xMax - width;
            yOrigin = sibling.y - ((views.count) * height) - ((views.count) * padding);

            break;
        case AboveCentered:
            xOrigin = sibling.xMid - (width / 2.0);
            yOrigin = sibling.y - ((views.count) * height) - ((views.count) * padding);

            break;
        default:
            break;
    }
    
    for (UIView *view in views) {
        view.frame = CGRectMake(xOrigin, yOrigin, width, height);
        yOrigin += yAdjust;
    }
    
    
    
}




@end
