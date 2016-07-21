//
//  YQConstants.h
//  YQlayout
//
//  Created by gengyongqiang on 16/7/20.
//  Copyright © 2016年 speedoflight. All rights reserved.
//

#define AutoHeight  -1
#define AutoWidth   -1

/**
 Corner 角落

 Specifies a corner of a frame.
 
 **TopLeft**: The upper-left corner of the frame.

 **TopRight**: The upper-right corner of the frame.

 **BottomLeft**: The bottom-left corner of the frame.

 **BottomRight**: The upper-right corner of the frame.
 **/
typedef enum : NSUInteger {
    TopLeft,
    TopRight,
    BottomLeft,
    BottomRight
} Corner;

/**
 Edge 边缘
 Specifies an edge, or face, of a frame.

 **Top**: The top edge of the frame.

 **Left**: The left edge of the frame.

 **Bottom**: The bottom edge of the frame.

 **Right**: The right edge of the frame.

 **/
typedef enum : NSUInteger {
    Top,
    Left,
    Bottom,
    Right
} Edge;


/**
 Align 相对
 **/

typedef enum : NSUInteger {

 ToTheRightMatchingTop,
 ToTheRightMatchingBottom,
 ToTheRightCentered,

 ToTheLeftMatchingTop,
 ToTheLeftMatchingBottom,
 ToTheLeftCentered,

 UnderMatchingLeft,
 UnderMatchingRight,
 UnderCentered,

 AboveMatchingLeft,
 AboveMatchingRight,
 AboveCentered

} Align;


/**
 group 组合
 **/

typedef enum : NSUInteger {
    Horizontal,   //水平
    Vertical      //垂直
} Group;
