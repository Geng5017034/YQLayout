//
//  UIView+Alignable.m
//  YQlayout
//
//  Created by gengyongqiang on 16/7/21.
//  Copyright © 2016年 speedoflight. All rights reserved.
//

#import "UIView+Alignable.h"
#import "UIView+Frameable.h"
#import "UIView+YQConstants.h"

@implementation UIView (Alignable)

#pragma mark - 相对关联试图
- (void)align:(Align)align relativeTo:(id)sibling padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height offset:(CGFloat)offset {

    UIView *relativeView = nil;
    if ([sibling isKindOfClass:[UIView class]]) {
        relativeView = sibling;
    }else{
        return ;
    }

    if (relativeView == nil) {
        return ;
    }

    CGFloat xOrigin = 0.0;
    CGFloat yOrigin = 0.0;
    switch (align) {
        case ToTheRightMatchingTop:
            xOrigin = relativeView.xMax + padding;
            yOrigin = relativeView.y + offset;

            break;
        case ToTheRightMatchingBottom:
            xOrigin = relativeView.xMax + padding;
            yOrigin = relativeView.yMax - height + offset;

            break;
        case ToTheRightCentered:
            xOrigin = relativeView.xMax + padding;
            yOrigin = relativeView.yMid - (height / 2.0) + offset;

            break;
        case ToTheLeftMatchingTop:
            xOrigin = relativeView.x - width - padding;
            yOrigin = relativeView.y + offset;

            break;
        case ToTheLeftMatchingBottom:
            xOrigin = relativeView.x - width - padding;
            yOrigin = relativeView.yMax - height + offset;

            break;
        case ToTheLeftCentered:
            xOrigin = relativeView.x - width - padding;
            yOrigin = relativeView.yMid - (height / 2.0) + offset;

            break;
        case UnderMatchingLeft:
            xOrigin = relativeView.x + offset;
            yOrigin = relativeView.yMax + padding;

            break;
        case UnderMatchingRight:
            xOrigin = relativeView.xMax - width + offset;
            yOrigin = relativeView.yMax + padding;

            break;
        case UnderCentered:
            xOrigin = relativeView.xMid - (width / 2.0) + offset;
            yOrigin = relativeView.yMax + padding;

            break;
        case AboveMatchingLeft:
            xOrigin = relativeView.x + offset;
            yOrigin = relativeView.y - padding - height;

            break;
        case AboveMatchingRight:
            xOrigin = relativeView.xMax - width + offset;
            yOrigin = relativeView.y - padding - height;

            break;
        case AboveCentered:
            xOrigin = relativeView.xMid - (width / 2.0) + offset;
            yOrigin = relativeView.y - padding - height;
            break;

        default:
            break;
    }

    self.frame = CGRectMake(xOrigin, yOrigin, width, height);

    if (height == AutoHeight) {
        [self setDimensionAutomatically];
        [self align:align relativeTo:sibling padding:padding width:width height:self.height offset:offset];

    }
    if (width == AutoWidth) {
        [self setDimensionAutomatically];
        [self align:align relativeTo:sibling padding:padding width:self.width height:height offset:offset];
    }

}

#pragma mark - 相对关联试图与父视图边界之间 宽

- (void)alignAndFillWidth:(Align)align relativeTo:(id)sibling padding:(CGFloat)padding height:(CGFloat)height offset:(CGFloat)offset{

    UIView *relativeView = nil;
    if ([sibling isKindOfClass:[UIView class]]) {
        relativeView = sibling;
    }else{
        return ;
    }

    if (relativeView == nil) {
        return ;
    }

    CGFloat superviewWidth = self.superFrame.size.width;
    CGFloat xOrigin = 0.0;
    CGFloat yOrigin = 0.0;
    CGFloat width = 0.0;

    switch (align) {
        case ToTheRightMatchingTop:
            xOrigin = relativeView.xMax + padding;
            yOrigin = relativeView.y + offset;
            width = superviewWidth - xOrigin - padding;

            break;
        case ToTheRightMatchingBottom:
            xOrigin = relativeView.xMax + padding;
            yOrigin = relativeView.yMax - height + offset;
            width = superviewWidth - xOrigin - padding;

            break;
        case ToTheRightCentered:
            xOrigin = relativeView.xMax + padding;
            yOrigin = relativeView.yMid - (height / 2.0) + offset;
            width = superviewWidth - xOrigin - padding;

            break;
        case ToTheLeftMatchingTop:
            xOrigin = padding;
            yOrigin = relativeView.y + offset;
            width = relativeView.x - (2 * padding);

            break;
        case ToTheLeftMatchingBottom:
            xOrigin = padding;
            yOrigin = relativeView.yMax - height + offset;
            width = relativeView.x - (2 * padding);

            break;
        case ToTheLeftCentered:
            xOrigin = padding;
            yOrigin = relativeView.yMid - (height / 2.0) + offset;
            width = relativeView.x - (2 * padding);

            break;
        case UnderMatchingLeft:
            xOrigin = relativeView.x + offset;
            yOrigin = relativeView.yMax + padding;
            width = superviewWidth - xOrigin - padding;

            break;
        case UnderMatchingRight:
            xOrigin = padding + offset;
            yOrigin = relativeView.yMax + padding;
            width = superviewWidth - (superviewWidth - relativeView.xMax) - padding;

            break;
        case UnderCentered:
            xOrigin = padding + offset;
            yOrigin = relativeView.yMax + padding;
            width = superviewWidth - (2 * padding);

            break;
        case AboveMatchingLeft:
            xOrigin = relativeView.x + offset;
            yOrigin = relativeView.y - padding - height;
            width = superviewWidth - xOrigin - padding;

            break;
        case AboveMatchingRight:
            xOrigin = padding + offset;
            yOrigin = relativeView.y - padding - height;
            width = superviewWidth - (superviewWidth - relativeView.xMax) - padding;

            break;
        case AboveCentered:
            xOrigin = padding + offset;
            yOrigin = relativeView.y - padding - height;
            width = superviewWidth - (2 * padding);
            break;
        default:
            break;
    }

    if (width < 0.0) {
        width = 0.0;
    }
    self.frame = CGRectMake(xOrigin, yOrigin, width, height);

    if (height == AutoHeight) {
        [self setDimensionAutomatically];
        [self alignAndFillWidth:align relativeTo:sibling padding:padding height:self.height offset:offset];
    }

}

#pragma mark - 相对关联试图与父视图边界之间 高

- (void)alignAndFillHeight:(Align)align relativeTo:(id)sibling padding:(CGFloat)padding width:(CGFloat)width offset:(CGFloat)offset {

    UIView *relativeView = nil;
    if ([sibling isKindOfClass:[UIView class]]) {
        relativeView = sibling;
    }else{
        return ;
    }

    if (relativeView == nil) {
        return ;
    }

    CGFloat superviewHeight = self.superFrame.size.height;
    CGFloat xOrigin = 0.0;
    CGFloat yOrigin = 0.0;
    CGFloat height = 0.0;

    switch (align) {
        case ToTheRightMatchingTop:
            xOrigin = relativeView.xMax + padding;
            yOrigin = relativeView.y + offset;
            height = superviewHeight - relativeView.y - padding;

            break;
        case ToTheRightMatchingBottom:
            xOrigin = relativeView.xMax + padding;
            yOrigin = padding + offset;
            height = superviewHeight - (superviewHeight - relativeView.yMax) - padding;

            break;
        case ToTheRightCentered:
            xOrigin = relativeView.xMax + padding;
            yOrigin = padding + offset;
            height = superviewHeight - (2 * padding);

            break;
        case ToTheLeftMatchingTop:
            xOrigin = relativeView.x - width - padding;
            yOrigin = relativeView.y + offset;
            height = superviewHeight - relativeView.y - padding;

            break;
        case ToTheLeftMatchingBottom:
            xOrigin = relativeView.x - width - padding;
            yOrigin = padding + offset;
            height = superviewHeight - (superviewHeight - relativeView.yMax) - padding;

            break;
        case ToTheLeftCentered:
            xOrigin = relativeView.x - width - padding;
            yOrigin = padding + offset;
            height = superviewHeight - (2 * padding);

            break;
        case UnderMatchingLeft:
            xOrigin = relativeView.x + offset;
            yOrigin = relativeView.yMax + padding;
            height = superviewHeight - yOrigin - padding;

            break;
        case UnderMatchingRight:
            xOrigin = relativeView.xMax - width + offset;
            yOrigin = relativeView.yMax + padding;
            height = superviewHeight - yOrigin - padding;

            break;
        case UnderCentered:
            xOrigin = relativeView.xMid - (width / 2.0) + offset;
            yOrigin = relativeView.yMax + padding;
            height = superviewHeight - yOrigin - padding;

            break;
        case AboveMatchingLeft:
            xOrigin = relativeView.x + offset;
            yOrigin = padding;
            height = relativeView.y - (2 * padding);

            break;
        case AboveMatchingRight:
            xOrigin = relativeView.xMax - width + offset;
            yOrigin = padding;
            height = relativeView.y - (2 * padding);

            break;
        case AboveCentered:
            xOrigin = relativeView.xMid - (width / 2.0) + offset;
            yOrigin = padding;
            height = relativeView.y - (2 * padding);
            break;
        default:
            break;
    }


    if (height < 0.0) {
        height = 0.0;
    }

    self.frame = CGRectMake(xOrigin, yOrigin, width, height);

    if (height == AutoHeight) {
        [self setDimensionAutomatically];
        [self alignAndFillHeight:align relativeTo:sibling padding:padding width:self.height offset:offset];
    }

}

#pragma mark - 相对关联试图自动填充

- (void)alignAndFill:(Align)align relativeTo:(id)sibling padding:(CGFloat)padding offset:(CGFloat)offset {

    UIView *relativeView = nil;
    if ([sibling isKindOfClass:[UIView class]]) {
        relativeView = sibling;
    }else{
        return ;
    }

    if (relativeView == nil) {
        return ;
    }


    CGFloat superviewWidth = self.superFrame.size.width;
    CGFloat superviewHeight = self.superFrame.size.height;
    CGFloat xOrigin = 0.0;
    CGFloat yOrigin = 0.0;
    CGFloat width = 0.0;
    CGFloat height = 0.0;

    switch (align) {
        case ToTheRightMatchingTop:
            xOrigin = relativeView.xMax + padding;
            yOrigin = relativeView.y + offset;
            width = superviewWidth - xOrigin - padding;
            height = superviewHeight - yOrigin - padding;

            break;
        case ToTheRightMatchingBottom:
            xOrigin = relativeView.xMax + padding;
            yOrigin = padding + offset;
            width = superviewWidth - xOrigin - padding;
            height = superviewHeight - (superviewHeight - relativeView.yMax) - padding;

            break;
        case ToTheRightCentered:
            xOrigin = relativeView.xMax + padding;
            yOrigin = padding + offset;
            width = superviewWidth - xOrigin - padding;
            height = superviewHeight - (2 * padding);

            break;
        case ToTheLeftMatchingTop:
            xOrigin = padding;
            yOrigin = relativeView.y + offset;
            width = superviewWidth - (superviewWidth - relativeView.x) - (2 * padding);
            height = superviewHeight - yOrigin - padding;

            break;
        case ToTheLeftMatchingBottom:
            xOrigin = padding;
            yOrigin = padding + offset;
            width = superviewWidth - (superviewWidth - relativeView.x) - (2 * padding);
            height = superviewHeight - (superviewHeight - relativeView.yMax) - padding;

            break;
        case ToTheLeftCentered:
            xOrigin = padding;
            yOrigin = padding + offset;
            width = superviewWidth - (superviewWidth - relativeView.x) - (2 * padding);
            height = superviewHeight - (2 * padding);

            break;
        case UnderMatchingLeft:
            xOrigin = relativeView.x + offset;
            yOrigin = relativeView.yMax + padding;
            width = superviewWidth - xOrigin - padding;
            height = superviewHeight - yOrigin - padding;


            break;
        case UnderMatchingRight:
            xOrigin = padding + offset;
            yOrigin = relativeView.yMax + padding;
            width = superviewWidth - (superviewWidth - relativeView.xMax) - padding;
            height = superviewHeight - yOrigin - padding;

            break;
        case UnderCentered:
            xOrigin = padding + offset;
            yOrigin = relativeView.yMax + padding;
            width = superviewWidth - (2 * padding);
            height = superviewHeight - yOrigin - padding;

            break;
        case AboveMatchingLeft:
            xOrigin = relativeView.x + offset;
            yOrigin = padding;
            width = superviewWidth - xOrigin - padding;
            height = superviewHeight - (superviewHeight - relativeView.y) - (2 * padding);

            break;
        case AboveMatchingRight:
            xOrigin = padding + offset;
            yOrigin = padding;
            width = superviewWidth - (superviewWidth - relativeView.xMax) - padding;
            height = superviewHeight - (superviewHeight - relativeView.y) - (2 * padding);

            break;
        case AboveCentered:
            xOrigin = padding + offset;
            yOrigin = padding;
            width = superviewWidth - (2 * padding);
            height = superviewHeight - (superviewHeight - relativeView.y) - (2 * padding);

            break;
        default:
            break;
    }

    if (width < 0.0) {
        width = 0.0;
    }

    if (height < 0.0) {
        height = 0.0;
    }

    self.frame = CGRectMake(xOrigin, yOrigin, width, height);

}


#pragma mark - 在两个关联试图左右之间
- (void)alignBetweenHorizontal:(Align)align primaryView:(UIView *)primaryView secondaryView:(UIView *)secondaryView padding:(CGFloat)padding height:(CGFloat)height offset:(CGFloat)offset {

    CGFloat superviewWidth = self.superFrame.size.width;
    CGFloat xOrigin = 0.0;
    CGFloat yOrigin = 0.0;
    CGFloat width = 0.0;

    switch (align) {
        case ToTheRightMatchingTop:
            xOrigin = primaryView.xMax + padding;
            yOrigin = primaryView.y + offset;
            width = superviewWidth - primaryView.xMax - (superviewWidth - secondaryView.x) - (2 * padding);

            break;
        case ToTheRightMatchingBottom:
            xOrigin = primaryView.xMax + padding;
            yOrigin = primaryView.yMax - height + offset;
            width = superviewWidth - primaryView.xMax - (superviewWidth - secondaryView.x) - (2 * padding);

            break;
        case ToTheRightCentered:
            xOrigin = primaryView.xMax + padding;
            yOrigin = primaryView.yMid - (height / 2.0) + offset;
            width = superviewWidth - primaryView.xMax - (superviewWidth - secondaryView.x) - (2 * padding);

            break;
        case ToTheLeftMatchingTop:
            xOrigin = secondaryView.xMax + padding;
            yOrigin = primaryView.y + offset;
            width = superviewWidth - secondaryView.xMax - (superviewWidth - primaryView.x) - (2 * padding);


            break;
        case ToTheLeftMatchingBottom:
            xOrigin = secondaryView.xMax + padding;
            yOrigin = primaryView.yMax - height + offset;
            width = superviewWidth - secondaryView.xMax - (superviewWidth - primaryView.x) - (2 * padding);

            break;
        case ToTheLeftCentered:
            xOrigin = secondaryView.xMax + padding;
            yOrigin = primaryView.yMid - (height / 2.0) + offset;
            width = superviewWidth - secondaryView.xMax - (superviewWidth - primaryView.x) - (2 * padding);
            break;

        default:
            NSLog(@"[NEON] Invalid Align specified for alignBetweenHorizonal().");

            break;
    }


    if (width < 0.0) {
        width = 0.0;
    }
    self.frame = CGRectMake(xOrigin, yOrigin, width, height);

    if (height == AutoHeight) {
        [self setDimensionAutomatically];
        [self alignBetweenHorizontal:align primaryView:primaryView secondaryView:secondaryView padding:padding height:self.height offset:0];
    }

}

#pragma mark - 在两个关联试图上下之间
- (void)alignBetweenVertical:(Align)align primaryView:(UIView *)primaryView secondaryView:(UIView *)secondaryView padding:(CGFloat)padding width:(CGFloat)width offset:(CGFloat)offset {

    CGFloat superviewHeight = self.superFrame.size.height;
    CGFloat xOrigin = 0.0;
    CGFloat yOrigin = 0.0;
    CGFloat height = 0.0;

    switch (align) {
        case UnderMatchingLeft:
            xOrigin = primaryView.x + offset;
            yOrigin = primaryView.yMax + padding;
            height = superviewHeight - primaryView.yMax - (superviewHeight - secondaryView.y) - (2 * padding);

            break;
        case UnderMatchingRight:
            xOrigin = primaryView.xMax - width + offset;
            yOrigin = primaryView.yMax + padding;
            height = superviewHeight - primaryView.yMax - (superviewHeight - secondaryView.y) - (2 * padding);

            break;
        case UnderCentered:
            xOrigin = primaryView.xMid - (width / 2.0) + offset;
            yOrigin = primaryView.yMax + padding;
            height = superviewHeight - primaryView.yMax - (superviewHeight - secondaryView.y) - (2 * padding);

            break;
        case AboveMatchingLeft:
            xOrigin = primaryView.x + offset;
            yOrigin = secondaryView.yMax + padding;
            height = superviewHeight - secondaryView.yMax - (superviewHeight - primaryView.y) - (2 * padding);

            break;
        case AboveMatchingRight:
            xOrigin = primaryView.xMax - width + offset;
            yOrigin = secondaryView.yMax + padding;
            height = superviewHeight - secondaryView.yMax - (superviewHeight - primaryView.y) - (2 * padding);

            break;
        case AboveCentered:
            xOrigin = primaryView.xMid - (width / 2.0) + offset;
            yOrigin = secondaryView.yMax + padding;
            height = superviewHeight - secondaryView.yMax - (superviewHeight - primaryView.y) - (2 * padding);

            break;

        default:
             NSLog(@"[NEON] Invalid Align specified for alignBetweenHorizonal().");
            break;
    }

    self.frame = CGRectMake(xOrigin, yOrigin, width, height);

    if (width == AutoWidth) {
        [self setDimensionAutomatically];
        [self alignBetweenVertical:align primaryView:primaryView secondaryView:secondaryView padding:padding width:self.height offset:offset];
    
    }

}



@end
