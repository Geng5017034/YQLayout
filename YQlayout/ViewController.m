//
//  ViewController.m
//  YQlayout
//
//  Created by gengyongqiang on 16/7/20.
//  Copyright © 2016年 speedoflight. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *centerView;
@property (nonatomic, strong) UILabel *secondView;
@property (nonatomic, strong) UILabel *thirdView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.centerView = [[UILabel alloc]init];
    self.centerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.centerView];

    self.secondView = [[UILabel alloc]init];
    self.secondView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.secondView];

    self.thirdView = [[UILabel alloc]init];
    self.thirdView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.thirdView];
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)layOutFrame{
    
//    [self.centerView anchorAndFillEdge:Top xPad:100 yPad:100 otherSize:100];
//    [self.centerView anchorToEdge:Top padding:10 width:100 height:100];
    [self.centerView anchorToEdge:Left padding:10 width:100 height:100];
//
//    [self.secondView align:UnderCentered relativeTo:self.centerView padding:200 width:self.centerView.width height:50 offset:0];
//
//    [self.thirdView alignBetweenVertical:UnderCentered primaryView:self.centerView secondaryView:self.secondView padding:10 width:100 offset:0];
//    [self.view groupInCenter:Vertical views:@[self.centerView,self.secondView,self.thirdView] padding:20 width:50 height:50];
//    [self.view groupAgainstEdge:Horizontal views:@[self.centerView,self.secondView,self.thirdView] againstEdge:Left padding:10 width:50 height:50];
//    [self.view groupAndFill:Vertical views:@[self.centerView,self.secondView,self.thirdView] padding:10];

//    [self.view groupInCorner:Horizontal views:@[self.centerView,self.secondView,self.thirdView] inCorner:TopRight padding:10 width:50 height:50];
    [self.view groupAndAlign:Vertical andAlign:ToTheRightMatchingTop views:@[self.secondView,self.thirdView] relativeTo:self.centerView padding:50 width:50 height:(self.centerView.height - 50)/2];

}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self layOutFrame];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
