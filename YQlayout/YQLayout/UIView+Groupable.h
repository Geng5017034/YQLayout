//
//  UIView+Groupable.h
//  YQlayout
//
//  Created by gengyongqiang on 16/7/21.
//  Copyright © 2016年 speedoflight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YQConstants.h"
@interface UIView (Groupable)

// Tell a view to group an array of its subviews centered, specifying the padding between each subview
- (void)groupInCenter:(Group)group views:(NSArray <UIView *>*)views padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height;

// Tell a view to group an array of its subviews in one of its corners, specifying the padding between each subview,
- (void)groupInCorner:(Group)group views:(NSArray <UIView *>*)views inCorner:(Corner)corner padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height;

// Tell a view to group an array of its subviews against one of its edges, specifying the padding between each subview
- (void)groupAgainstEdge:(Group)group views:(NSArray <UIView *>*)views againstEdge:(Edge)edge padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height;

// Tell a view to group an array of its subviews relative to another of that view's subview, specifying the padding between
- (void)groupAndAlign:(Group)group andAlign:(Align)align views:(NSArray <UIView *>*)views relativeTo:(UIView *)sibling padding:(CGFloat)padding width:(CGFloat)width height:(CGFloat)height;


// Tell a view to group an array of its subviews filling the width and height of the superview, specifying the padding between
- (void)groupAndFill:(Group)group views:(NSArray <UIView *>*)views padding:(CGFloat)padding;

@end
