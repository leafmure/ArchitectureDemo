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
#import "VIPERView.h"

@implementation VIPERRouter

+ (void)setRootViewControllerToWindow:(UIWindow *)window
{
    
    window.rootViewController = [self connectViperModule];
}

+ (void)pushFromController:(UIViewController *)fromController
{
    [fromController.navigationController pushViewController:[self connectViperModule] animated:YES];
}

+ (VIPERViewController *)connectViperModule
{
    VIPERViewController *viewController = [[VIPERViewController alloc] init];
    VIPERInteractor *interactor = [[VIPERInteractor alloc] init];
    VIPERPresenter *presenter = [[VIPERPresenter alloc] init];
    presenter.interactor = interactor;
    viewController.eventHandler = presenter;
    interactor.output = presenter;
    return viewController;
}

@end
