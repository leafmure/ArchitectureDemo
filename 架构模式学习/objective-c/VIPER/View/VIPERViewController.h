//
//  VIPERViewController.h
//  架构模式学习
//
//  Created by mo2323 on 2018/11/12.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VIPERViewEventHandler.h"
@class VIPERView;

@interface VIPERViewController : UIViewController
/** @brief mainView */
@property (nonatomic,strong) VIPERView *mainView;
/** @brief eventHandler */
@property (nonatomic,strong) id<VIPERViewEventHandler> eventHandler;

@end
