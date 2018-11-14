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
    //https://www.jianshu.com/p/a901de9c7eaf
    //http://ios.jobbole.com/83727/
    
    [self initView];
}

- (void)initView
{
    _mainView = [[VIPERView alloc] initWithFrame:self.view.bounds];
    [_mainView.attackButton addTarget:self action:@selector(attackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_mainView];
}


- (void)attackButtonAction
{
    [_eventHandler attackAnimalButtonAction];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
