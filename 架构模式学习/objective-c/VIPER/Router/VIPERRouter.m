//
//  VIPERRouter.m
//  架构模式学习
//
//  Created by mo2323 on 2018/11/13.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import "VIPERRouter.h"
#import "VIPERViewController.h"
#import "VIPERInteractor.h"
#import "VIPERPresenter.h"

@interface VIPERRouter ()
/** @brief presenter */
@property (nonatomic,strong) VIPERPresenter *presenter;
/** @brief interactor */
@property (nonatomic,strong) VIPERInteractor *interactor;

@end

@implementation VIPERRouter

- (void)connectViperModule
{
    VIPERViewController *view = [[VIPERViewController alloc] init];
    VIPERInteractor *interactor = [[VIPERInteractor alloc] init];
    VIPERPresenter *presenter = [[VIPERPresenter alloc] init];
    presenter.view = view.mainView;
    presenter.interactor = _interactor;
    view.eventHandler = presenter;
    interactor.output = presenter;
}

@end
