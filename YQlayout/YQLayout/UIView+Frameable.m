//
//  UIView+Frameable.m
//  YQlayout
//
//  Created by gengyongqiang on 16/7/20.
//  Copyright © 2016年 speedoflight. All rights reserved.
//

#import "UIView+Frameable.h"

@implementation UIView (Frameable)
@dynamic x,xMax,xMid,y,yMax,yMid,width,height;

- (CGFloat)x{
    return CGRectGetMinX(self.frame);
}

- (CGFloat)xMid{
    return CGRectGetMinX(self.frame) + (CGRectGetWidth(self.frame) / 2.0);
}

- (CGFloat)xMax{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)y{
    return CGRectGetMinY(self.frame);
}

- (CGFloat)yMid{
    return CGRectGetMinY(self.frame) + (CGRectGetHeight(self.frame) / 2.0);
}

- (CGFloat)yMax{
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)width{
    return CGRectGetWidth(self.frame);
}

- (CGFloat)height{
    return CGRectGetHeight(self.frame);
}

@end
