//
//  CALayer+YQConstants.h
//  YQlayout
//
//  Created by gengyongqiang on 16/7/20.
//  Copyright © 2016年 speedoflight. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (YQConstants)

@property (nonatomic, assign) CGRect superFrame;

- (void)setDimensionAutomatically;

@end
