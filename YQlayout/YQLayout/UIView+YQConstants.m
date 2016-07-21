//
//  UIView+YQConstants.m
//  YQlayout
//
//  Created by gengyongqiang on 16/7/20.
//  Copyright © 2016年 speedoflight. All rights reserved.
//

#import "UIView+YQConstants.h"

@implementation UIView (YQConstants)
@dynamic superFrame;

- (CGRect)superFrame{

    if (self.superview != nil) {
        return self.superview.frame;
    }else{
        return CGRectZero;
    }

}

- (void)setDimensionAutomatically{

    [self sizeToFit];

}

@end
