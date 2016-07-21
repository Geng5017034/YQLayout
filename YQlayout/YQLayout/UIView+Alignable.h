//
//  UIView+Alignable.h
//  YQlayout
//
//  Created by gengyongqiang on 16/7/21.
//  Copyright © 2016年 speedoflight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YQConstants.h"
@interface UIView (Alignable)

//align relativeView
- (void)align:(Align)align relativeTo:(id)sibling padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height offset:(CGFloat)offset;

//Align a view relative to a sibling view in the same superview, and automatically expand the width to fill
- (void)alignAndFillWidth:(Align)align relativeTo:(id)sibling padding:(CGFloat)padding height:(CGFloat)height offset:(CGFloat)offset;

//Align a view relative to a sibling view in the same superview, and automatically expand the height to fill
- (void)alignAndFillHeight:(Align)align relativeTo:(id)sibling padding:(CGFloat)padding width:(CGFloat)width offset:(CGFloat)offset;

// Align a view relative to a sibling view in the same superview, and automatically expand the width AND height
- (void)alignAndFill:(Align)align relativeTo:(id)sibling padding:(CGFloat)padding offset:(CGFloat)offset;

// Align a view between two sibling views horizontally, automatically expanding the width to extend the full
- (void)alignBetweenHorizontal:(Align)align primaryView:(UIView *)primaryView secondaryView:(UIView *)secondaryView padding:(CGFloat)padding height:(CGFloat)height offset:(CGFloat)offset;

// Align a view between two sibling views vertically, automatically expanding the height to extend the full
- (void)alignBetweenVertical:(Align)align primaryView:(UIView *)primaryView secondaryView:(UIView *)secondaryView padding:(CGFloat)padding width:(CGFloat)width offset:(CGFloat)offset;

@end
