//
//  CALayer+YQConstants.m
//  YQlayout
//
//  Created by gengyongqiang on 16/7/20.
//  Copyright © 2016年 speedoflight. All rights reserved.
//

#import "CALayer+YQConstants.h"

@implementation CALayer (YQConstants)
@dynamic superFrame;

- (CGRect)superFrame{

    if (self.superlayer != nil) {
        return self.superlayer.frame;
    }else{
        return CGRectZero;
    }
    
}

- (void)setDimensionAutomatically{
    /* no-op here as this shouldn't apply to CALayers */
}

@end
