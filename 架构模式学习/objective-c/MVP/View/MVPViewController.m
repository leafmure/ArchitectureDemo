//
//  MVCViewController.m
//  架构模式学习
//
//  Created by mo2323 on 2018/11/12.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import "MVPViewController.h"
#import "MVPView.h"
#import "MVPAnimalPresenter.h"
#import "MVPAnimal.h"

@interface MVPViewController ()
/** @brief promptLabel */
@property (nonatomic,strong) UILabel *promptLabel;
/** @brief model */
@property (nonatomic,strong) MVPAnimal *dog;
/** @brief view */
@property (nonatomic,strong) MVPView *mainView;
/** @brief presenter */
@property (nonatomic,strong) MVPAnimalPresenter *presenter;
/** @brief attackButton */
@property (nonatomic,strong) UIButton *attackButton;

@end

@implementation MVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initModel];
    [self initView];
    [self initPresenter];
}

- (void)initView
{
    _mainView = [[MVPView alloc] initWithFrame:self.view.bounds];
    [_mainView.attackButton addTarget:self action:@selector(attackButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_mainView];
}

- (void)attackButtonAction:(UIButton *)sender
{
    [_presenter attackAnimal:sender];
}

- (void)initModel
{
    _dog = [[MVPAnimal alloc] init];
    _dog.name = @"蠢狗";
    _dog.bloodVolume = 50;
    _dog.aggressivity = 0;
    _dog.defenses = 5;
}

- (void)initPresenter
{
    _presenter = [[MVPAnimalPresenter alloc] initWithView:_mainView animal:_dog];
}

@end
