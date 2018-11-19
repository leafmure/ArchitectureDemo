//
//  VIPERViewController.m
//  架构模式学习
//
//  Created by mo2323 on 2018/11/12.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import "VIPERViewController.h"
#import "VIPERView.h"

@interface VIPERViewController ()

@end

@implementation VIPERViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
    [_eventHandler viewDidLoadLifeMethod];
}

- (void)initView
{
    _mainView = [[VIPERView alloc] initWithFrame:self.view.bounds];
    [_mainView.attackButton addTarget:self action:@selector(attackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_mainView];
    [_eventHandler viperViewIsAlready:_mainView];
}


- (void)attackButtonAction
{
    [_eventHandler attackAnimalButtonAction];
}


@end
